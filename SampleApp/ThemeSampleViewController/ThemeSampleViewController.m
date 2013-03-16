//
//  ThemeSampleViewController.m
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThemeSampleViewController.h"
#import "TKSection.h"
#import "TKStaticCell.h"
#import "TKTextFieldCell.h"
#import "TKSwitchCell.h"
#import "UserDefinedCell.h"
#import "CustomTheme.h"
#import "TKDefaultTheme.h"

@implementation ThemeSampleViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self.tableView applyTheme:[[CustomTheme alloc ] init]];
	
	if(self.sections==nil)
	{
		TKSection* section = [TKSection sectionWithCells:nil];
		[section addCell:[TKStaticCell cellWithText:@"Custom Theme example"]];
		[section addCell:[TKStaticCell cellWithStyle:UITableViewCellStyleValue1 text:@"Date" detailText:@"2012-01-01"]];
		[section addCell:[TKTextFieldCell cellWithStyle:UITableViewCellStyleValue2 title:@"Teft Field" placeholder:@"placeholder"]];
		[section addCell:[[UserDefinedCell alloc] initWithTitle:@"User defined cell with custom design"]];
		
		TKSwitchCell* switchCell = [TKSwitchCell cellWithText:@"Custom Theme" state:YES target:self action:@selector(onSwitchCell:)];
		TKSection* switchSection = [TKSection sectionWithCells:switchCell, nil];
		switchSection.footerTitle = @"Hint: tap the switch to change theme";

		self.sections = [NSArray arrayWithObjects:section, switchSection, nil];
	}
}

-(void) onSwitchCell:(TKSwitchCell*)cell
{
	if(cell.state == YES)
	{
		[self.tableView applyTheme:[[CustomTheme alloc ] init]];
	}
	else
	{
		[self.tableView applyTheme:[[TKDefaultTheme alloc ] init]];
	}

	[self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
