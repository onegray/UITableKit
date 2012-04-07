//
//  TKDefaultTextViewCellView.h
//  TableKitSample
//
//  Created by onegray on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"

@interface TKDefaultTextViewCellView : TKTextViewCellView
{
	UITextView* textView;
}
@property (nonatomic, readonly) UITextView* textView;

-(void) updateWithText:(NSString*)text;

@end
