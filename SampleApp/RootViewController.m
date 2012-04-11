//
//  RootViewController.m
//  TableKitSample
//
//  Created by onegray on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "EditingSampleViewController.h"
#import "AttributesSampleViewController.h"
#import "TKSection.h"
#import "TKActionCell.h"


@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	if(self.sections==nil)
	{
		TKActionCell* attributesSampleCell = [TKActionCell cellWithTitle:@"Attributes Sample" target:self action:@selector(onAttributesSampleCell)];
		[attributesSampleCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

		TKActionCell* editingSampleCell = [TKActionCell cellWithTitle:@"Editing Sample" target:self action:@selector(onEditingSampleCell)];
		[editingSampleCell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];

		TKSection* section = [TKSection sectionWithCells:attributesSampleCell, editingSampleCell, nil];
		self.sections = [NSArray arrayWithObjects:section, nil];
	}
}

-(void) onAttributesSampleCell 
{
	AttributesSampleViewController* vc = [[[AttributesSampleViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
}

-(void) onEditingSampleCell 
{
	EditingSampleViewController* vc = [[[EditingSampleViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
	[self.navigationController pushViewController:vc animated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
