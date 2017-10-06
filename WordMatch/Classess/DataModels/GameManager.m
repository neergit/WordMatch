//
//  GameManager.m
//  WordMatch
//
//  Created by Neeraj Chandra on 22/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "GameManager.h"

#define kUserName @"UserName"
#define kHighScore @"HighestScore"
#define kWordsList @"WordsList"
#define kListKey @"en"

static GameManager* sSharedInstance;


@interface GameManager ()
{
    NSMutableArray* _randomWords;
    NSUserDefaults* _userDefaults;
}
@end

@implementation GameManager

#pragma mark -
+(instancetype)loadInstance
{
    if(!sSharedInstance)
        sSharedInstance = [[GameManager alloc] init];
    return sSharedInstance;
}

#pragma mark -
-(instancetype)init
{
    if(self = [super init])
    {
//        self.sharedUserDefaults = [[NSUserDefaults alloc] init];
        _userDefaults = [NSUserDefaults standardUserDefaults];
        self.userName =  [_userDefaults valueForKey:kUserName];
        self.highestScore = [[_userDefaults valueForKey:kHighScore] integerValue];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:kWordsList ofType:@"plist"];
        NSDictionary* wordsDiction = [NSDictionary dictionaryWithContentsOfFile:path];
        _wordsList = [wordsDiction objectForKey:kListKey];
        
    }
    return self;
}


-(void)setUserName:(NSString *)userName
{
    _userName = userName;
    [_userDefaults setValue:userName forKey:kUserName];
    [_userDefaults synchronize];
}

-(void)setHighestScore:(NSInteger)hScore
{
    _highestScore = hScore;
    [_userDefaults setValue:[NSNumber numberWithInteger:hScore] forKey:kHighScore];
    [_userDefaults synchronize];
}

#pragma mark -
-(void)createGame:(void(^)(Game*))callback
{
    Game* game = [[Game alloc] init];
    _randomWords = [[NSMutableArray alloc] init];
    NSString* str = [_wordsList objectAtIndex:[game getRandomNumber:_wordsList.count andAdd:_randomWords]];
    game.possibleCombinations = [str componentsSeparatedByString:@"."];
    
    [game newGame];
    
    if(callback)
        callback(game);
}

-(void)setUpNextRoundFor:(Game*)game
{
    NSString* str = [_wordsList objectAtIndex:[game getRandomNumber:_wordsList.count andAdd:_randomWords]];
    game.possibleCombinations = [str componentsSeparatedByString:@"."];
    [game setUpQuestion];
}


@end
