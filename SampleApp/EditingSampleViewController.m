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
@property (nonatomic, retain) TKMutableSection* planetsSection;
@end

@implementation EditingSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	if(self.sections==nil)
	{
		_planetsSection = [[TKMutableSection alloc] init];
		_planetsSection.preventIndentationDuringEditing = YES;
		_planetsSection.allowsReorderingDuringEditing = YES;
		_planetsSection.headerTitle = @"Solar System";

		[_planetsSection addCell:[TKStaticCell cellWithText:@"Mercury"]];
		[_planetsSection addCell:[TKStaticCell cellWithText:@"Venus"]];
		[_planetsSection addCell:[TKStaticCell cellWithText:@"Earth"]];
		[_planetsSection addCell:[TKStaticCell cellWithText:@"Mars"]];

		self.textFieldCell = [TKTextFieldCell cellWithStyle:UITableViewCellStyleValue2 title:@"Add New:" placeholder:@"Enter Text"];
		_textFieldCell.textField.delegate = (id)self;
		[_textFieldCell setPreventEditing:YES];
		[_planetsSection addCell:_textFieldCell];

		TKSwitchCell* editingModeCell = [TKSwitchCell cellWithText:@"Editing Mode" target:self action:@selector(onSwitchCell:)];
		TKSection* editingModeSection = [TKSection sectionWithCells:editingModeCell, nil];

		self.sections = [NSArray arrayWithObjects:_planetsSection, editingModeSection, nil];
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	if([_textFieldCell.text length] > 0)
	{
		int newRowIndex = [_planetsSection indexOfCell:_textFieldCell];
		TKStaticCell* customPlanetCell = [TKStaticCell cellWithText:_textFieldCell.text];
		[_planetsSection insertCell:customPlanetCell atIndex:newRowIndex];
		
		NSIndexPath* indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
		[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationBottom];
		
		_textFieldCell.text = nil;
		[_textFieldCell updateCellViewInTableView:self.tableView];
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
