//
//  UserDefinedCellView.m
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserDefinedCellView.h"

@interface UserDefinedCellView()
@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@end

@implementation UserDefinedCellView
@synthesize titleLabel;

+(UserDefinedCellView*) loadCellFromNib
{
	UIViewController* vc = [[[UIViewController alloc] initWithNibName:@"UserDefinedCellView" bundle:nil] autorelease];
	UserDefinedCellView* cellView = (UserDefinedCellView*)vc.view;
	cellView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paper.png"]];
	return cellView;
}

-(void) layoutSubviews
{
	[super layoutSubviews];
	
}

-(void) dealloc
{
	[titleLabel release];
	[super dealloc];
}

@end

@implementation CustomTheme(UserDefinedCellView)
-(UserDefinedCellView*) createUserDefinedCellView
{
	return [UserDefinedCellView loadCellFromNib];
}
@end


