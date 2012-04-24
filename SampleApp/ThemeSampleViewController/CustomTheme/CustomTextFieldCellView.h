//
//  CustomTextFieldCellView.h
//  TableKitSample
//
//  Created by onegray on 4/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"
#import "TKDefaultTextFieldCellView.h"

@interface CustomTextFieldCellView : TKDefaultTextFieldCellView
{

}

-(void) updateWithTitle:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder;

@end
