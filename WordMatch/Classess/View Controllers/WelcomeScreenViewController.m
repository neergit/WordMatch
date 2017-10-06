//
//  WelcomeScreenViewController.m
//  WordMatch
//
//  Created by Neeraj Chandra on 22/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "WelcomeScreenViewController.h"
#import "GameManager.h"
#import "Util.h"

@interface WelcomeScreenViewController ()

@end

@implementation WelcomeScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setUpVc];
}

#pragma mark -
-(void)setUpVc
{
    if(_gGameManager.userName)
    {
        [self setUpFields];
    }
    else
    {
        __weak typeof(self) weakSelf = self;
        [Util showTextFieldAlertWithTitle:@"Player Name" message:@"Enter name of player" viewController:self submitClick:^(NSString *name) {
            [_gGameManager setUserName:name];
            [weakSelf setUpFields];
        }];
    }
}

-(void)setUpFields
{
    self.userNameLabel.text = _gGameManager.userName;
    self.highScoreLabel.text = [NSString stringWithFormat:@"%ld",(long)_gGameManager.highestScore];
}

@end
