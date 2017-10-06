//
//  DesignableButtons.h
//  WordMatch
//
//  Created by Neeraj Chandra on 25/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface DesignableButtons : UIButton

@property (nonatomic) IBInspectable int cornerRadius;
@property (nonatomic) IBInspectable UIImage* image;
//@property (nonatomic) IBInspectable CGFloat shadowRadius;
//@property (nonatomic) IBInspectable CGSize shadowOffset;
//@property (nonatomic) IBInspectable UIColor* shadowColor;
//@property (nonatomic) IBInspectable CGFloat shadowOpacity;


@end
