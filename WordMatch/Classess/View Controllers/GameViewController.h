//
//  ViewController.h
//  WordMatch
//
//  Created by Neeraj Chandra on 18/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePlayer.h"
#import "TimerView.h"

@interface GameViewController : UIViewController

@property (nonatomic, retain) IBOutletCollection(UIButton) NSArray *inputButtons;
@property (nonatomic, retain) IBOutletCollection(UILabel) NSArray *selectedLetter;
@property (nonatomic, strong) IBOutlet UILabel* scoreLabel;
@property (nonatomic, strong) TimerView* timerView;

@property (nonatomic, strong) GamePlayer* player;


-(IBAction)onLetterClick:(id)sender;
- (IBAction)gotoRoot:(UIStoryboardSegue*)segue;

@end

