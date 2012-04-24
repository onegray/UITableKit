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
#import "CustomTheme.h"

@implementation ThemeSampleViewController

-(void) dealloc
{
	[super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self.tableView applyTheme:[[[CustomTheme alloc ] init] autorelease]];
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	if(self.sections==nil)
	{
		TKSection* section = [TKSection sectionWithCells:nil];
		[section addCell:[TKStaticCell cellWithText:@"Custom Theme example"]];
		[section addCell:[TKStaticCell cellWithStyle:UITableViewCellStyleValue1 text:@"Date" detailText:@"2012-01-01"]];
		[section addCell:[TKTextFieldCell cellWithStyle:UITableViewCellStyleValue2 title:@"Teft Field:" placeholder:@"placeholder"]];
		self.sections = [NSArray arrayWithObjects:section, nil];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
