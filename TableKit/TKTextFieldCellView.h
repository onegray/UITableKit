//
//  TKTextFieldCellView.h
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"

@interface TKTextFieldCellView : TKCellView
{
	UITextField* textField;
}

@property (nonatomic, readonly) UITextField* textField;

-(void) updateWithText:(NSString*)text placeholder:(NSString*)placeholder;

@end
