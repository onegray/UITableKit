//
//  TKTextViewCellView.m
//
//  Created by Sergey Nikitenko on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTextViewCellView.h"

@implementation TKTextViewCellView
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
