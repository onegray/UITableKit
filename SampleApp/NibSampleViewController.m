//
//  NibSampleViewController.m
//  TableKitSample
//
//  Created by onegray on 3/1/13.
//
//

#import "TKStaticCell.h"
#import "TKSection.h"
#import "NibSampleViewController.h"

@interface NibSampleViewController ()

@end

@implementation NibSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	if(self.sections==nil) {
		TKSection* section = [TKSection sectionWithCells:nil];
		section.headerTitle = @"Child TableView";
		[section addCell:[TKStaticCell cellWithText:@"Cell1"]];
		[section addCell:[TKStaticCell cellWithText:@"Cell2"]];
		self.sections = [NSArray arrayWithObjects:section, nil];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
