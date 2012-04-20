//
//  AttributesSampleViewController.m
//  TableKitSample
//
//  Created by onegray on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AttributesSampleViewController.h"
#import "TKSection.h"
#import "TKTextFieldCell.h"
#import "TKStaticCell.h"
#import "TKSwitchCell.h"
#import "TKTextViewCell.h"

@implementation AttributesSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	if(self.sections==nil)
	{
		TKStaticCell* staticCell = [TKStaticCell cellWithStyle:UITableViewCellStyleValue1 text:@"Static cell" detailText:@"details"];
		[staticCell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
		[staticCell setTextColor:[UIColor redColor]];
		[staticCell setImage:[UIImage imageNamed:@"coke.png"]];
		
		TKTextFieldCell* textFieldCell = [TKTextFieldCell cellWithText:@"Text" placeholder:@"Enter text"];
		[textFieldCell setKeyboardType:UIKeyboardTypeEmailAddress];
		[textFieldCell setImage:[UIImage imageNamed:@"apple.png"]];
		[textFieldCell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
		
		TKSwitchCell* switchCell = [TKSwitchCell cellWithText:@"Switch" state:NO];
		[switchCell setImage:[UIImage imageNamed:@"coke.png"]];
		
		TKTextViewCell* textViewCell = [TKTextViewCell cellWithText:@"Hello World!" placeholder:@"start typing here"];
		[textViewCell setFont:[UIFont systemFontOfSize:18]];
		[textViewCell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
		[textViewCell setImage:[UIImage imageNamed:@"apple.png"]];
		
		TKSection* section = [TKSection sectionWithCells:staticCell, textFieldCell, switchCell, textViewCell, nil];
		section.headerTitle = @"Section title";
		
		self.sections = [NSArray arrayWithObjects:section, nil];	
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
