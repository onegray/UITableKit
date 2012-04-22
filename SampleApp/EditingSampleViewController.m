//
//  EditingSampleViewController.m
//  TableKitSample
//
//  Created by onegray on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EditingSampleViewController.h"
#import "TKSection.h"
#import "TKTextFieldCell.h"
#import "TKStaticCell.h"
#import "TKSwitchCell.h"

@interface EditingSampleViewController ()
@property (nonatomic, retain) TKTextFieldCell* textFieldCell;
@property (nonatomic, retain) TKSection* planetsSection;
@end

@implementation EditingSampleViewController
@synthesize planetsSection, textFieldCell;

-(void) dealloc
{
	[planetsSection release];
	[textFieldCell release];
	[super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

	if(self.sections==nil)
	{
		self.planetsSection = [[[TKSection alloc] init] autorelease];
		planetsSection.preventIndentationDuringEditing = YES;
		planetsSection.allowsReorderingDuringEditing = YES;
		planetsSection.headerTitle = @"Solar System";

		[planetsSection addCell:[TKStaticCell cellWithText:@"Mercury"]];
		[planetsSection addCell:[TKStaticCell cellWithText:@"Venus"]];
		[planetsSection addCell:[TKStaticCell cellWithText:@"Earth"]];
		[planetsSection addCell:[TKStaticCell cellWithText:@"Mars"]];

		self.textFieldCell = [TKTextFieldCell cellWithStyle:UITableViewCellStyleValue2 title:@"Add New:" placeholder:@"Enter Text"];
		textFieldCell.textField.delegate = (id)self;
		[textFieldCell setPreventEditing:YES];
		[planetsSection addCell:textFieldCell];

		TKSwitchCell* editingModeCell = [TKSwitchCell cellWithText:@"Editing Mode" target:self action:@selector(onSwitchCell:)];
		TKSection* editingModeSection = [TKSection sectionWithCells:editingModeCell, nil];
		editingModeSection.preventEditing = YES;

		self.sections = [NSArray arrayWithObjects:planetsSection, editingModeSection, nil];
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	if([textFieldCell.text length] > 0) 
	{
		int newRowIndex = [planetsSection indexOfCell:textFieldCell];
		TKStaticCell* customPlanetCell = [TKStaticCell cellWithText:textFieldCell.text];
		[planetsSection insertCell:customPlanetCell atIndex:newRowIndex];
		
		NSIndexPath* indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
		[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationBottom];
		
		textFieldCell.text = nil;
		[textFieldCell updateViewInTableView:self.tableView];
	}
	return YES;
}


-(void)onSwitchCell:(BOOL)state
{
	self.tableView.editing = state;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
