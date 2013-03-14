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
	UIViewController* vc = [[UIViewController alloc] initWithNibName:@"UserDefinedCellView" bundle:nil];
	return (UserDefinedCellView*)vc.view;
}

-(void) layoutSubviews
{
	[super layoutSubviews];
}

@end

@implementation CustomTheme(UserDefinedCellView)
-(UserDefinedCellView*) createUserDefinedCellView
{
	UserDefinedCellView* cellView = [UserDefinedCellView loadCellFromNib];
	cellView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"paper.png"]];
	return cellView;
}
@end


@implementation TKDefaultTheme(UserDefinedCellView)
-(UserDefinedCellView*) createUserDefinedCellView
{
	UserDefinedCellView* cellView = [UserDefinedCellView loadCellFromNib];
	for(UIView* v in cellView.contentView.subviews) {
		if([v isKindOfClass:[UILabel class]]) {
			[(UILabel*)v setFont:[UIFont systemFontOfSize:17]];
		}
	}
	return cellView;
}
@end

