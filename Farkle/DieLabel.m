//
//  DieLabel.m
//  Farkle
//
//  Created by Orten, Thomas on 21.05.14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.isLocked = NO;
    }
    return self;
}

- (IBAction)onTapped:(id)sender
{
    [self.delegate didChooseDie:self];
}

- (void)roll
{
    int random = arc4random_uniform(6)+1;
    self.text = [NSString stringWithFormat:@"%d", random];
}

@end
