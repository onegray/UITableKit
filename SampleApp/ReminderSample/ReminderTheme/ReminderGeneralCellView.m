//
//  ReminderGeneralCellView.m
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderGeneralCellView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ReminderGeneralCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIView* cellBackView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
		cellBackView.backgroundColor = [UIColor clearColor];
		cellBackView.layer.borderWidth=1;
		cellBackView.layer.borderColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0].CGColor;
		self.backgroundView = cellBackView;
		
		self.textLabel.font = [UIFont systemFontOfSize:16];
		self.textLabel.textColor = [UIColor darkGrayColor];
		self.textLabel.backgroundColor = [UIColor clearColor];
		self.detailTextLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void) updateWithText:(NSString*)text detailText:(NSString*)detailText
{
	self.textLabel.text = text;
	self.detailTextLabel.text = detailText;
}

@end
