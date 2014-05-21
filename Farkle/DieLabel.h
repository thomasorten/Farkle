//
//  DieLabel.h
//  Farkle
//
//  Created by Orten, Thomas on 21.05.14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate
- (void)didChooseDie:(id)dieLabel;
@end

@interface DieLabel : UILabel
@property id <DieLabelDelegate> delegate;
@property BOOL isHeld;
@property BOOL isLocked;
- (void)roll;
@end
