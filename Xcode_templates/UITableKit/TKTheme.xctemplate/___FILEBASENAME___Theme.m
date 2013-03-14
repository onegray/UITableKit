//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___Theme.h"
#import "___FILEBASENAME___GeneralCellView.h"
#import "___FILEBASENAME___TextFieldCellView.h"
#import "___FILEBASENAME___SwitchCellView.h"
#import "___FILEBASENAME___TextViewCellView.h"

@implementation ___FILEBASENAME___Theme

-(___FILEBASENAME___GeneralCellView*) generalCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[___FILEBASENAME___GeneralCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
}

-(___FILEBASENAME___GeneralCellView*) actionCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	___FILEBASENAME___GeneralCellView* cellView = [[___FILEBASENAME___GeneralCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
	cellView.selectionStyle = UITableViewCellSelectionStyleBlue;
	return cellView;
}

-(___FILEBASENAME___SwitchCellView*) switchCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[___FILEBASENAME___SwitchCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
}

-(___FILEBASENAME___TextFieldCellView*) textFieldCellViewWithStyle:(UITableViewCellStyle)cellStyle
{
	return [[___FILEBASENAME___TextFieldCellView alloc] initWithStyle:cellStyle reuseIdentifier:nil];
}

-(___FILEBASENAME___TextViewCellView*) textViewCellView
{
	return [[___FILEBASENAME___TextViewCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}

@end


