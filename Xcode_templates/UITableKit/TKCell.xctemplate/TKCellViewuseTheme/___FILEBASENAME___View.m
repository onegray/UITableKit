//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

#import "___FILEBASENAME___View.h"

@implementation ___FILEBASENAME___View

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



@implementation ___VARIABLE_themeClass___(___FILEBASENAME___View)
-(___FILEBASENAME___View*) create___FILEBASENAME___View
{
	return [[___FILEBASENAME___View alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}
@end


