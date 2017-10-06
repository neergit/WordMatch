//
//  GamePlayer.h
//  WordMatch
//
//  Created by Neeraj Chandra on 18/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface GamePlayer : NSObject

@property (nonatomic, strong) NSString* playerName;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, retain) NSMutableArray* charsInOrder;

@property (nonatomic, strong) Game* game;

-(instancetype)initWithGame:(Game*)game;
-(void)updateScore;

@end

