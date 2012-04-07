//
//  TKDefaultTextViewCellView.m
//  TableKitSample
//
//  Created by onegray on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKDefaultTextViewCellView.h"

@implementation TKDefaultTextViewCellView

@synthesize textView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
        textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 5, 280, 110)];
		textView.backgroundColor = [UIColor clearColor];
        [self addSubview:textView];
		[textView release];
    }
    return self;
}

-(void) updateWithText:(NSString*)text
{
    textView.text = text;
}


@end
