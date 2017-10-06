//
//  Util.h
//  WordMatch
//
//  Created by Neeraj Chandra on 22/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Util : NSObject

+(void)showTextFieldAlertWithTitle:(NSString*)title message:(NSString*)message viewController:(UIViewController*)vc submitClick:(void(^)(NSString*))okClick;

@end
