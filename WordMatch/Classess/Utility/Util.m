//
//  Util.m
//  WordMatch
//
//  Created by Neeraj Chandra on 22/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "Util.h"

@implementation Util

+(void)showTextFieldAlertWithTitle:(NSString*)title message:(NSString*)message viewController:(UIViewController*)vc submitClick:(void(^)(NSString*))okClick
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"Player Name";
        textField.textColor = [UIColor blackColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.minimumFontSize = 15;
        
    }];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Submit", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
        if(okClick)
        {
            UITextField* textField = alert.textFields.firstObject;
            okClick(textField.text);
        }
    }];
    
    [alert addAction:okAction];
    [vc presentViewController:alert animated:YES completion:nil];
}

@end
