//
//  ReminderTheme.m
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderTheme.h"
#import "ReminderGeneralCellView.h"
#import "ReminderTextFieldCellView.h"
#import "ReminderSwitchCellView.h"
#import "ReminderTextViewCellView.h"

@implementation ReminderTheme

-(ReminderGeneralCellView*) generalCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[[ReminderGeneralCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil] autorelease];
}

-(ReminderGeneralCellView*) actionCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	ReminderGeneralCellView* cellView = [[ReminderGeneralCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
	cellView.selectionStyle = UITableViewCellSelectionStyleBlue;
	return [cellView autorelease];
}

-(ReminderSwitchCellView*) switchCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[[ReminderSwitchCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil] autorelease];
}

-(ReminderTextFieldCellView*) textFieldCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[[ReminderTextFieldCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil] autorelease];
}

-(ReminderTextViewCellView*) textViewCellView
{
	return [[[ReminderTextViewCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
}

@end


