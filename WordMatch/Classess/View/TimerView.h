//
//  TimerView.h
//  WordMatch
//
//  Created by Neeraj Chandra on 23/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface TimerView : UIView<GameDelegate>
{
    float _endAngle;
}
@property (assign, nonatomic) float radius;
@property (assign, nonatomic) float internalRadius;
@property (strong, nonatomic) void(^timeOverCall)();

- (id)initWithPosition:(CGPoint)position
                radius:(float)radius
        internalRadius:(float)internalRadius;

@end
