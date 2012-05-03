//
//  HugeTableSampleViewController.m
//  TableKitSample
//
//  Created by onegray on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HugeTableSampleViewController.h"
#import "TKSection.h"
#import "TKStaticCell.h"

@implementation HugeTableSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	if(self.sections==nil)
	{
		UIColor* colors[3] = {[UIColor redColor], [UIColor purpleColor], [UIColor blueColor]};
		
		TKSection* section = [TKSection sectionWithCells:nil];
		for(int i=0; i<1000; i++) // It might take some significant time
		{
			NSString* cellStr = [[NSString alloc] initWithFormat:@"Cell %d", i];
			TKStaticCell* cell = [[TKStaticCell alloc] initWithText:cellStr];
			cell.textLabel.textColor = colors[i%3];
			[section addCell:cell];
			[cell release];
			[cellStr release];
		}

		self.sections = [NSArray arrayWithObjects:section, nil];	
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end

