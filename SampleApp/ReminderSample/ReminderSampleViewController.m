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
	tableView.separatorColor = [UIColor clearColor];
	if([tableView respondsToSelector:@selector(setBackgroundView:)])
	{
		tableView.backgroundView = nil;
	}
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
		TKStaticCell* staticCell = [TKStaticCell cellWithText:@"Thursday, Oct 13, 2011"];
		TKSwitchCell* switchCell = [TKSwitchCell cellWithText:@"Track Location" state:YES];
		TKTextViewCell* textViewCell = [TKTextViewCell cellWithText:nil placeholder:@"Type here"];
		textViewCell.cellHeight = 0; // Automatically adjust height
		textViewCell.textView.scrollEnabled = NO;
		textViewCell.textView.delegate = (id)self;
				
		TKSection* section = [TKSection sectionWithCells:staticCell, textViewCell, switchCell, nil];
		section.headerHeight = section.footerHeight = 0;
		tableController.sections = [NSArray arrayWithObject:section];
	}
	
	tableView.delegate = tableController;
	tableView.dataSource = tableController;
	[tableView applyTheme:[[[ReminderTheme alloc] init] autorelease]];
}

- (BOOL)textView:(UITextView *)tv shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)replacementText
{
    if ([replacementText isEqualToString:@"\n"])
	{
        [tv resignFirstResponder];
        return FALSE;
    }
	[self performSelector:@selector(recalcTableLayoutForTextView:) withObject:tv afterDelay:0];
    return TRUE;    
}

-(void) recalcTableLayoutForTextView:(UITextView*)textView
{
	if(fabsf(textView.contentSize.height - textView.frame.size.height) > 3)
	{
		[tableView beginUpdates];
		[tableView endUpdates];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
