//
//  ReminderSwitchCellView.m
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderSwitchCellView.h"

@implementation ReminderSwitchCellView
@synthesize switchButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
        switchButton = [[UISwitch alloc] initWithFrame:CGRectZero];
		self.accessoryView = switchButton;
		[switchButton release];
		self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText state:(BOOL)state
{
	self.textLabel.text = text;
	self.detailTextLabel.text = detailText;
	switchButton.on = state;
}

@end
