//
//  DesignableButtons.m
//  WordMatch
//
//  Created by Neeraj Chandra on 25/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "DesignableButtons.h"

@implementation DesignableButtons

- (void)setCornerRadius:(int)cornerRadius
{
    _cornerRadius = cornerRadius;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
{
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0f, 40.0f, 0.0f, 0.0f);
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:_cornerRadius];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
}

@end
