//
//  Game.m
//  WordMatch
//
//  Created by Neeraj Chandra on 18/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "Game.h"
#import "GamePlayer.h"

#define kWordsList @"WordsList"
#define kDefaultTime 20.0f

@interface Game ()
{
    NSMutableArray* _randomIndexes;
}
@end
@implementation Game

-(void)newGame
{
    _seconds = kDefaultTime;
    _status = YES;

    [self setUpQuestion];
    [self timeCounter];
}


-(void)setUpQuestion
{
    if(_status)
    {
        _jumbledCharacters = [[NSMutableArray alloc] init];
        _randomIndexes = [[NSMutableArray alloc] init];
        
        NSString* word = [_possibleCombinations objectAtIndex:0];
        
        
        for(NSInteger i = 0; i < word.length; i++)
        {
            NSString* alphabet = [NSString stringWithFormat:@"%c",[word characterAtIndex:[self getRandomNumber:word.length andAdd:_randomIndexes]]];
            [_jumbledCharacters addObject:alphabet];
        }
    }
}

#pragma mark - Timer
-(void)timeCounter
{
           _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(timeView)
                                           userInfo:nil
                                            repeats:YES];
}

-(void)timeView
{
    _seconds -= 0.1;
        [self.delegate updateTime:_seconds];
        
        if(_seconds <= 0)
        {
            _status = NO;
            [_timer invalidate];
            [self.delegate gameOver];
        }
}


-(int)getRandomNumber:(NSInteger)limit andAdd:(NSMutableArray*)arr
{
    int num = 0;
    do
    {
        num = arc4random_uniform((int)limit);
    } while ([arr containsObject:[NSNumber numberWithInt:num]]);
    
    [arr addObject:[NSNumber numberWithInt:num]];
    return num;}

@end
