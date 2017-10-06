//
//  GameManager.h
//  WordMatch
//
//  Created by Neeraj Chandra on 22/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "GamePlayer.h"

@interface GameManager : NSObject

@property (nonatomic, strong) NSString* userName;
@property (nonatomic, assign) NSInteger highestScore;

@property (nonatomic, strong) NSArray* wordsList;

+(instancetype)loadInstance;
-(instancetype)init;

-(void)createGame:(void(^)(Game*))callback;
-(void)setUpNextRoundFor:(Game*)game;

@end

#define _gGameManager [GameManager loadInstance]
