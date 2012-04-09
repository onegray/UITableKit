//
//  TKDefaultTextViewCellView.m
//  TableKitSample
//
//  Created by Sergey Nikitenko on 4/7/12.
//  Copyright (c) 2012 Sergey Nikitenko. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "TKDefaultTextViewCellView.h"

@implementation TKDefaultTextViewCellView

@synthesize textView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
        textView = [[UITextView alloc] initWithFrame:CGRectZero];
		textView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:textView];
		[textView release];
    }
    return self;
}

-(void) layoutSubviews
{
	[super layoutSubviews];
	CGSize boundsSize = self.bounds.size;
	CGFloat accessoryWidth = self.accessoryType==UITableViewCellAccessoryNone ? 0 : self.accessoryView ? self.accessoryView.frame.size.width : 30;
	CGFloat offset = self.imageView.frame.origin.x + self.imageView.frame.size.width+3;
	CGFloat width = boundsSize.width-offset-accessoryWidth-20;
	textView.frame = CGRectMake(offset, 5, width, boundsSize.height-10);
}

-(void) updateWithText:(NSString*)text
{
    textView.text = text;
}


@end
