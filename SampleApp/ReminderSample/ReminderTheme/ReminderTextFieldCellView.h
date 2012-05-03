//
//  ReminderTextFieldCellView.h
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"
#import "TKDefaultTextFieldCellView.h"

@interface ReminderTextFieldCellView : TKDefaultTextFieldCellView
{

}

-(void) updateWithTitle:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder;

@end
