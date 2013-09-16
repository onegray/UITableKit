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

// TKTextView is a workaround to fix scrolling on iOS 4.x
@interface TKTextView : UITextView
@end
@implementation TKTextView
-(void) setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated
{
	[super setContentOffset:(self.scrollEnabled ? contentOffset : self.contentOffset) animated:animated];
}
@end


@implementation TKDefaultTextViewCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self)
	{
		_textView = [[TKTextView alloc] initWithFrame:CGRectZero];
		_textView.backgroundColor = [UIColor clearColor];
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidBeginEditing:)
													 name:UITextViewTextDidBeginEditingNotification object:_textView];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidEndEditing:)
													 name:UITextViewTextDidEndEditingNotification object:_textView];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChange:)
													 name:UITextViewTextDidChangeNotification object:_textView];
		_textView.delegate = (id)self;
		[self.contentView addSubview:_textView];
	}
	return self;
}

-(void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)textView:(UITextView *)tw shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)replacementText
{
	if ([replacementText isEqualToString:@"\n"])
	{
		[tw resignFirstResponder];
		return NO;
	}
	return YES;
}

-(void) textViewTextDidBeginEditing:(NSNotification*)notification
{
	if(_textView.textColor!=[UIColor blackColor])
	{
		_textView.textColor = [UIColor blackColor];
		_textView.text = nil;
	}
}

-(void) textViewTextDidEndEditing:(NSNotification*)notification
{
	if([_textView.text length]==0)
	{
		_textView.textColor = [UIColor lightGrayColor];
		_textView.text = _placeholder;
	}
}

-(void) textViewTextDidChange:(NSNotification*)notification
{
	if([self.cellRef respondsToSelector:@selector(onCellViewDidUpdate:)]) {
		[self.cellRef onCellViewDidUpdate:self];
	}
}

-(void) layoutSubviews
{
	[super layoutSubviews];
	CGSize boundsSize = self.contentView.bounds.size;
	CGFloat offset = self.imageView.frame.origin.x + self.imageView.frame.size.width;
	_textView.frame = CGRectMake(offset+2, 0, boundsSize.width-offset-4, boundsSize.height);
}

-(CGFloat) cellHeight
{
	return _textView.contentSize.height+2;
}

-(void) updateWithText:(NSString*)text placeholder:(NSString*)aPlaceholder;
{
	_textView.text = text;
	self.placeholder = aPlaceholder;

	if([text length]==0)
	{
		_textView.textColor = [UIColor lightGrayColor];
		_textView.text = _placeholder;
	}
}


@end
