//
//  ReminderTextFieldCellView.m
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderTextFieldCellView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ReminderTextFieldCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		UIView* cellBackView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
		cellBackView.backgroundColor = [UIColor clearColor];
		cellBackView.layer.borderWidth=1;
		cellBackView.layer.borderColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.0].CGColor;
		self.backgroundView = cellBackView;

		self.textLabel.font = [UIFont systemFontOfSize:16];
		self.textLabel.textColor = [UIColor darkGrayColor];
		self.textLabel.backgroundColor = [UIColor clearColor];
		self.detailTextLabel.backgroundColor = [UIColor clearColor];
		textField.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void) layoutSubviews
{
	[super layoutSubviews];

}

-(void) updateWithTitle:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder
{
	[super updateWithTitle:title text:text placeholder:placeholder];
	
}

@end
