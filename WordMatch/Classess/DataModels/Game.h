//
//  Game.h
//  WordMatch
//
//  Created by Neeraj Chandra on 18/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GameDelegate <NSObject>

@required
-(void) updateTime:(float)newTime;
-(void) gameOver;

@end

@interface Game : NSObject
{
    NSTimer* _timer;
}

@property (nonatomic, assign) float seconds;
@property (nonatomic, strong) NSArray* possibleCombinations;
@property (nonatomic, strong) NSMutableArray* jumbledCharacters;

@property id <GameDelegate>delegate;
@property (nonatomic,assign) BOOL status;

-(void)newGame;
-(void)setUpQuestion;

-(int)getRandomNumber:(NSInteger)limit andAdd:(NSMutableArray*)arr;

@end
