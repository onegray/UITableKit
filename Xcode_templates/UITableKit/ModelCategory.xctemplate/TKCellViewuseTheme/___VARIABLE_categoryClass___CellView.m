//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___VARIABLE_categoryClass___CellView.h"

@implementation ___VARIABLE_categoryClass:identifier___CellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
    }
    return self;
}

-(void) layoutSubviews
{
	[super layoutSubviews];
	
}

@end



@implementation ___VARIABLE_themeClass___(___VARIABLE_categoryClass:identifier___CellView)
-(___VARIABLE_categoryClass:identifier___CellView*) create___VARIABLE_categoryClass:identifier___CellView
{
	return [[[___VARIABLE_categoryClass:identifier___CellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
}
@end


