//
//  ScoreCardViewController.h
//  WordMatch
//
//  Created by Neeraj Chandra on 22/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreCardViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView* tableView;
@property (weak, nonatomic) IBOutlet UILabel* score;

@property (nonatomic, assign) NSInteger pScore;
@property (nonatomic, strong) NSArray* possibleWords;

@property (strong, nonatomic) void(^playAgainCall)();

-(IBAction)playAgain:(id)sender;
-(IBAction)goToHome:(id)sender;

@end
