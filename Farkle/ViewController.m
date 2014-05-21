//
//  ViewController.m
//  Farkle
//
//  Created by Orten, Thomas on 21.05.14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate>
@property NSMutableArray *dice;
@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTurnLabel;
@property NSInteger playerOneScore;
@property NSInteger playerTwoScore;
@property NSInteger currentPlayerScore;
@property BOOL isPlayerTwo;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dice = [[NSMutableArray alloc] init];
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[DieLabel class]]) {
            DieLabel *label = (DieLabel *) subview;
            label.delegate = self;
        }
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onRollButtonPressed:(id)sender {
    for (DieLabel *lockedLabel in self.dice) {
        lockedLabel.isLocked = YES;
    }
    [self setCurrentThrowScore];
    for (UIView *subview in self.view.subviews) {
        DieLabel *label = (DieLabel *) subview;
        if ([subview isKindOfClass:[DieLabel class]] && ![self.dice containsObject:subview] && !label.isLocked) {
            DieLabel *label = (DieLabel *) subview;
            [label roll];
        }
    }
}

- (IBAction)onSkipTurnButtonPressed:(id)sender {
    self.isPlayerTwo = !self.isPlayerTwo;
    if (self.isPlayerTwo) {
        self.playerTurnLabel.text = @"Player two score:";
        self.userScore.text = [NSString stringWithFormat:@"%d", self.playerTwoScore];
    } else {
        self.playerTurnLabel.text = @"Player one score:";
        self.userScore.text = [NSString stringWithFormat:@"%d", self.playerOneScore];
    }
    self.currentPlayerScore = 0;
}

- (void)didChooseDie:(DieLabel *)dieLabel
{
    dieLabel.isHeld = !dieLabel.isHeld;
    if (dieLabel.isHeld || dieLabel.isLocked) {
        dieLabel.backgroundColor = [UIColor redColor];
        [self.dice addObject:dieLabel];
    } else {
        dieLabel.backgroundColor = [UIColor blueColor];
        [self.dice removeObject:dieLabel];
    }
}

- (void)setCurrentThrowScore
{
    NSInteger diceCounter[6] = {0,0,0,0,0,0};

    for (DieLabel *label in self.dice) {
        diceCounter[label.text.intValue-1]++;
    }
}

@end
