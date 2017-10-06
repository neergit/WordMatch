//
//  DesignableLabels.m
//  WordMatch
//
//  Created by Neeraj Chandra on 25/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "DesignableLabels.h"


@implementation DesignableLabels

- (void)setCornerRadius:(int)cornerRadius {
    _cornerRadius = cornerRadius;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:_cornerRadius];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}


@end
