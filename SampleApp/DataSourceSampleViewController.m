//
//  DataSourceSampleViewController.m
//  TableKitSample
//
//  Created by onegray on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataSourceSampleViewController.h"
#import "TKTheme.h"
#import "CustomTheme.h"
#import "TKCellView.h"
#import "TKTextFieldCell.h"
#import "TKActionCell.h"

@implementation DataSourceSampleViewController

-(void) dealloc
{
	[textFieldCell release];
	[super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Appling custom theme if needed
	//[self.tableView applyTheme:[[[CustomTheme alloc] init] autorelease]];
	
	if(!textFieldCell) {
		textFieldCell = [[TKTextFieldCell alloc] initWithStyle:UITableViewCellStyleValue2 title:@"Footer:"
														 text:@"Comment" placeholder:@"Enter text"];
		textFieldCell.textField.delegate = (id)self;
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return section==0 ? 5 : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.section == 0)
	{
		TKGeneralCellView* cellView = [tableView.theme generalCellViewWithStyle:UITableViewCellStyleSubtitle];
		[cellView updateWithText:[NSString stringWithFormat:@"Row %d", indexPath.row] detailText:textFieldCell.text];
		return cellView;
	}

	if(indexPath.section == 1)
	{
		return [textFieldCell cellForTableView:tableView];
	}

	return nil;
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	[self.tableView reloadData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}


@end
