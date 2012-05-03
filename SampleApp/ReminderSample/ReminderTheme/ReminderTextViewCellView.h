//
//  ReminderTextViewCellView.h
//  TableKitSample
//
//  Created by onegray on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"
#import "TKDefaultTextViewCellView.h"

@interface ReminderTextViewCellView : TKDefaultTextViewCellView
{

}

-(void) updateWithText:(NSString*)text placeholder:(NSString*)placeholder;

@end
