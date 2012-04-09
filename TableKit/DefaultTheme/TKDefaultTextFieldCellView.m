//
//  TKDefaultTextFieldCellView.m
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

#import <UIKit/UIKit.h>
#import "TKDefaultTextFieldCellView.h"

@implementation TKDefaultTextFieldCellView
@synthesize textField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		textField = [[UITextField alloc] initWithFrame:CGRectZero];
		textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		[self.contentView addSubview:textField];
		[textField release];
    }
    return self;
}

-(void) layoutSubviews
{
	[super layoutSubviews];
	CGSize boundsSize = self.bounds.size;
	CGFloat accessoryWidth = self.accessoryType==UITableViewCellAccessoryNone ? 0 : self.accessoryView ? self.accessoryView.frame.size.width : 30;
	CGFloat offset = self.imageView.frame.origin.x + self.imageView.frame.size.width + 10;
	CGFloat width = boundsSize.width-offset-accessoryWidth-30;
	textField.frame = CGRectMake(offset, 0, width, boundsSize.height);
}

-(void) updateWithText:(NSString*)text placeholder:(NSString*)placeholder
{
    textField.text = text;
    textField.placeholder = placeholder;
}

@end
