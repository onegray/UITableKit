//
//  TKDefaultTextFieldCellView.h
//  TableKitSample
//
//  Created by onegray on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"

@interface TKDefaultTextFieldCellView : TKTextFieldCellView
{
	UITextField* textField;
}

@property (nonatomic, readonly) UITextField* textField;

-(void) updateWithText:(NSString*)text placeholder:(NSString*)placeholder;

@end
