//
//  TimerView.m
//  WordMatch
//
//  Created by Neeraj Chandra on 23/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "TimerView.h"

#define kDefaultTime 20
#define kRed 177/255.0
#define kGreen 0/255.0
#define kBlue 54/255.0

@interface TimerView ()
{
    float _strokePos;
}
@end
@implementation TimerView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.radius = frame.size.width / 2;
        self.internalRadius = 0.f;
        [super setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (id)initWithPosition:(CGPoint)position
                radius:(float)radius
        internalRadius:(float)internalRadius
{
    self = [super initWithFrame:CGRectMake(position.x, position.y, radius * 2, radius * 2)];
    if (self) {
        self.radius = radius;
        self.internalRadius = internalRadius;
        [super setBackgroundColor:[UIColor clearColor]];
        _endAngle = M_PI * 2;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.radius = self.frame.size.width / 2;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    float strokeWidth = self.radius - self.internalRadius;
    float radius = self.internalRadius + strokeWidth / 2;
    
    UIBezierPath *timeCircle = [UIBezierPath bezierPathWithArcCenter:center
                                                                    radius:radius
                                                                startAngle:0.0f
                                                            endAngle:_strokePos
                                                                 clockwise:YES];

    [[UIColor colorWithRed:kRed green:kGreen blue:kBlue alpha:1.0] setStroke];
    timeCircle.lineWidth = strokeWidth;
    [timeCircle stroke];
//    _maskLayer = [CAShapeLayer layer];
//    _maskLayer.frame         = self.bounds;
//    _maskLayer.path          = timeCircle.CGPath;
//    _maskLayer.strokeColor   = [UIColor colorWithRed:kRed green:kGreen blue:kBlue alpha:1.0].CGColor;
//    _maskLayer.lineWidth     = strokeWidth;
//    _maskLayer.fillColor     = [UIColor clearColor].CGColor;
//    [self.layer addSublayer:_maskLayer];
}

#pragma mark -
-(void)updateTime:(float)newTime
{
    float percent = (float)(kDefaultTime - newTime)/kDefaultTime;
    _strokePos = (_endAngle) * (percent); // finding angle for percentage of time
    [self setNeedsDisplay];
//    [_maskLayer removeFromSuperlayer];
}

-(void)gameOver
{
    if(self.timeOverCall)
        _timeOverCall();
}

@end
