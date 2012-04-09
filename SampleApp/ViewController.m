//
//  ViewController.m
//  TableKitSample
//
//  Created by Sergey Nikitenko on 4/5/12.
//  Copyright (c) 2012 Sergey Nikitenko. All rights reserved.
//

#import "ViewController.h"

#import "TKSection.h"
#import "TKTextFieldCell.h"
#import "TKStaticCell.h"
#import "TKSwitchCell.h"
#import "TKTextViewCell.h"

#import "TKDefaultTheme.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	TKDefaultTheme* defaultTheme = [[[TKDefaultTheme alloc] init] autorelease];
	[self.tableView applyTheme:defaultTheme];

	if(self.sections==nil)
	{
		staticCell = [TKStaticCell cellWithTitle:@"Static cell"];
		[staticCell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
		[staticCell setTextColor:[UIColor redColor]];
		[staticCell setImage:[UIImage imageNamed:@"coke.png"]];
		
		textFieldCell = [TKTextFieldCell cellWithText:@"Text" placeholder:@"Enter text"];
		[textFieldCell setKeyboardType:UIKeyboardTypeEmailAddress];
		textFieldCell.delegate = (id)self;
		[textFieldCell setImage:[UIImage imageNamed:@"apple.png"]];
		[textFieldCell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
		
		switchCell = [TKSwitchCell cellWithTitle:@"Switch" state:NO];
		[switchCell setImage:[UIImage imageNamed:@"coke.png"]];
		
		textViewCell = [TKTextViewCell cellWithText:@"Hello!"];
		[textViewCell setFont:[UIFont systemFontOfSize:18]];
		[textViewCell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
		[textViewCell setImage:[UIImage imageNamed:@"apple.png"]];

		TKSection* section = [TKSection sectionWithCells:staticCell, textFieldCell, switchCell, textViewCell, nil];
		section.headerTitle = @"Section title";

		self.sections = [NSArray arrayWithObjects:section, nil];	
	}
}

-(void)textFieldCellDidEndEditing:(TKTextFieldCell*)cell
{
	staticCell.title = cell.text;
	[staticCell updateViewInTableView:self.tableView];
}


@end
