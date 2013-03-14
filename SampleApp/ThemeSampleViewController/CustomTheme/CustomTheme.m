//
//  CustomTheme.m
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomTheme.h"
#import "CustomGeneralCellView.h"
#import "CustomTextFieldCellView.h"
#import "CustomSwitchCellView.h"

@implementation CustomTheme

-(CustomGeneralCellView*) generalCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[CustomGeneralCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
}

-(CustomGeneralCellView*) actionCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	CustomGeneralCellView* cellView = [[CustomGeneralCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
	cellView.selectionStyle = UITableViewCellSelectionStyleBlue;
	return cellView;
}

-(CustomSwitchCellView*) switchCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[CustomSwitchCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
}

-(CustomTextFieldCellView*) textFieldCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[CustomTextFieldCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
}

@end


