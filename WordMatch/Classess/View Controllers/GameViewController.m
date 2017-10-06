//
//  ViewController.m
//  WordMatch
//
//  Created by Neeraj Chandra on 18/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "GameViewController.h"
#import "GamePlayer.h"
#import "ScoreCardViewController.h"
#import "GameManager.h"

#define kTagDifference 10
#define kDelayAfterLastLetter 0.2
#define kWordLength 5
#define kRadius 150.5
#define kInternalRadius 143
#define KDifferenceYAndCentre 50.5
#define kSegueIdentifier @"PlayToScore"

@interface GameViewController ()
{
    NSInteger _count; // to manage index of selected letter
}
@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpGame];
}

#pragma mark -
-(IBAction)onLetterClick:(id)sender
{
    NSInteger pos = [sender tag] - kTagDifference;
    
    UIButton* btn = [_inputButtons objectAtIndex:pos];
    btn.enabled = NO;
    UILabel* label = [_selectedLetter objectAtIndex:_count++];
    label.text = [_player.game.jumbledCharacters objectAtIndex:pos];

    [_player.charsInOrder addObject:[_player.game.jumbledCharacters objectAtIndex:pos]];
    
    if(_count == kWordLength)
        [self performSelector:@selector(updateGameStatus) withObject:nil afterDelay:kDelayAfterLastLetter];
}

#pragma mark -
-(void)setUpGame
{
    _count = 0;  // start index of selected letter
    __weak typeof(self) weakSelf = self;
    [_gGameManager createGame:^(Game *game) {
        weakSelf.player = [[GamePlayer alloc]initWithGame:game];
        [weakSelf setUpView];
        [weakSelf setTimerView];
    }];
}

-(void)setQuestion
{
    int index = 0; // to manage index of jumbled word
    for(UIButton* btn in _inputButtons)
    {
        btn.enabled = YES;
        [btn setTitle:_player.game.jumbledCharacters[index++] forState:UIControlStateNormal];
    }
}

-(void)updateGameStatus
{
    _count = 0; // reset start index of selected word
    [_player updateScore];
    [self setUpView];
}

-(void)setUpLabels
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %ld",(long)self.player.score];
    for(UILabel* lbl in _selectedLetter)
        lbl.text = nil;
}

-(void)setUpView
{
    [self setQuestion];
    [self setUpLabels];
}

-(void)setTimerView
{
    CGFloat pX = self.view.frame.size.width/2 - kRadius;
    CGFloat pY = self.view.frame.size.height/2 - KDifferenceYAndCentre;
    self.timerView = [[TimerView alloc] initWithPosition:CGPointMake(pX, pY)
                                                  radius:kRadius
                                          internalRadius:kInternalRadius];
    self.player.game.delegate = self.timerView;
    [self.view insertSubview:self.timerView belowSubview:_scoreLabel];
    __weak typeof(self) weakSelf = self;
    self.timerView.timeOverCall = ^(){
        [weakSelf performSegueWithIdentifier:kSegueIdentifier sender:weakSelf];
        [weakSelf.timerView removeFromSuperview];
    };
}


#pragma mark -
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ScoreCardViewController* vc = [segue destinationViewController];
    vc.possibleWords = self.player.game.possibleCombinations;
    vc.pScore = self.player.score;
    __weak typeof(self) weakSelf = self;
    vc.playAgainCall = ^(){
        [weakSelf setUpGame];
    };
}

#pragma mark - unwindsegue
- (IBAction)gotoRoot:(UIStoryboardSegue*)segue
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
