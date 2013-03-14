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

@interface TKDefaultTextFieldCellView ()
{
	UITableViewCellStyle _cellStyle;
}
@end

@implementation TKDefaultTextFieldCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		_cellStyle = style;
		_textField = [[UITextField alloc] initWithFrame:CGRectZero];
		_textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		_textField.textAlignment = style==UITableViewCellStyleValue1 ? UITextAlignmentRight : UITextAlignmentLeft;
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		_textField.delegate = (id)self;
		[self.contentView addSubview:_textField];
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)tf
{
    [tf resignFirstResponder];
    return YES;
}

-(void) layoutSubviews
{
	[super layoutSubviews];
	CGSize boundsSize = self.contentView.bounds.size;
	CGFloat offset = 0;
	
	if(_cellStyle == UITableViewCellStyleValue1)
	{
		offset = CGRectGetMaxX(self.textLabel.frame);
		if(offset==0) {
			offset = CGRectGetMaxX(self.imageView.frame);
		}
	}
	else if(_cellStyle == UITableViewCellStyleValue2)
	{
		offset = CGRectGetMaxX(self.textLabel.frame)-4;
	}
	else
	{
		offset = CGRectGetMaxX(self.imageView.frame);
	}
	_textField.frame = CGRectMake(offset+10, 0, boundsSize.width-offset-20, boundsSize.height);
	
	[self.contentView bringSubviewToFront:_textField];
}

-(void) updateWithTitle:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder
{
	self.textLabel.text = title;
    _textField.text = text;
    _textField.placeholder = placeholder;
}

@end
