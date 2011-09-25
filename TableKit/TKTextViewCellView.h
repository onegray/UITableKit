//
//  TKTextViewCellView.h
//
//  Created by Sergey Nikitenko on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKCellView.h"

@interface TKTextViewCellView : TKCellView
{
	UITextView* textView;
}
@property (nonatomic, readonly) UITextView* textView;

-(void) updateWithText:(NSString*)text;

@end
