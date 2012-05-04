//
//  ReminderSampleViewController.m
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReminderSampleViewController.h"
#import "TKSection.h"
#import "TKStaticCell.h"
#import "TKSwitchCell.h"
#import "TKTextFieldCell.h"
#import "TKTextViewCell.h"
#import "ReminderTheme.h"

@implementation ReminderSampleViewController

-(void) dealloc
{
	[tableController release];
	[super dealloc];
}

-(void) loadView
{
	self.view = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"reminder_bg.png"]];
	tableView = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped] autorelease];
	tableView.backgroundColor = [UIColor clearColor];	
	tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	if(tableController==nil)
	{
		tableController = [[TKController alloc] init];
		TKStaticCell* staticCell1 = [TKStaticCell cellWithText:@"Thursday, Oct 13, 2011"];
		TKStaticCell* staticCell2 = [TKStaticCell cellWithStyle:UITableViewCellStyleSubtitle text:@"Location" detailText:@"1227 N St NW Washington"];
		TKSwitchCell* switchCell = [TKSwitchCell cellWithText:@"Track Location" state:YES];
		TKTextFieldCell* textFieldCell = [TKTextFieldCell cellWithText:nil placeholder:@"Type here"];
		TKTextViewCell* textViewCell = [TKTextViewCell cellWithText:nil placeholder:@"Type here"];
		
		TKSection* section = [TKSection sectionWithCells:switchCell, textFieldCell, textViewCell, staticCell1, staticCell2, nil];
		section.headerHeight = section.footerHeight = 0;
		tableController.sections = [NSArray arrayWithObject:section];
	}
	
	tableView.delegate = tableController;
	tableView.dataSource = tableController;
	[tableView applyTheme:[[[ReminderTheme alloc] init] autorelease]];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


@end
