//
//  ScoreCardViewController.m
//  WordMatch
//
//  Created by Neeraj Chandra on 22/05/17.
//  Copyright © 2017 Neeraj Chandra. All rights reserved.
//

#import "ScoreCardViewController.h"
#import "Game.h"
#import "GamePlayer.h"

#define kCellId @"CellIdentifier"

@interface ScoreCardViewController ()

@end

@implementation ScoreCardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpVc];
}

#pragma mark -
-(void)setUpVc
{
    _score.text = [NSString stringWithFormat:@"%ld",(long)_pScore];
    [self.tableView reloadData];
}

#pragma mark - TableViewData
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _possibleWords.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellId forIndexPath:indexPath];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    cell.textLabel.text = [_possibleWords objectAtIndex:indexPath.row];
    return cell;
}

-(IBAction)playAgain:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.playAgainCall)
        self.playAgainCall();
}

-(IBAction)goToHome:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
