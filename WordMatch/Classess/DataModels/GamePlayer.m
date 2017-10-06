//
//  GamePlayer.m
//  WordMatch
//
//  Created by Neeraj Chandra on 18/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "GamePlayer.h"
#import "GameManager.h"

#define kBonusTime 4.0f

@implementation GamePlayer

-(instancetype)initWithGame:(Game*)game;
{
        if(self = [super init])
        {
            self.game = game;
            self.score = 0;
            self.charsInOrder = [[NSMutableArray alloc] init];
        }
        return self;
}

-(void)resetAnswer
{
    _charsInOrder = nil;
    _charsInOrder = [[NSMutableArray alloc] init];
}
-(void)updateScore
{
    if([self checkAnswer])
    {
       _score += 10;
        self.game.seconds += kBonusTime;
    }
    
    if(self.score > _gGameManager.highestScore)
        [_gGameManager setHighestScore:self.score];
    
    [self resetAnswer];
    [_gGameManager setUpNextRoundFor:self.game];
}

-(BOOL)checkAnswer
{
    NSString* answer = [_charsInOrder componentsJoinedByString:@""];
    for(NSString* obj in self.game.possibleCombinations)
    {
        if([answer isEqualToString:obj])
            return YES;
    }
    return NO;
}
@end
