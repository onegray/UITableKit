//
//  TKTextViewCell.m
//
//  Created by Sergey Nikitenko on 6/15/11.
//  Copyright 2011 Sergey Nikitenko. All rights reserved.
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

#import "TKTextViewCell.h"
#import "TKTheme.h"
#import "TKCellView.h"
#import "TKCellAttribute.h"

@implementation TKTextViewCell
@synthesize text;
@synthesize cellHeight;

+(TKTextViewCell*) cellWithText:(NSString*)text
{
    return [[[self alloc] initWithText:text] autorelease];
}

-(id) initWithText:(NSString*)aText
{
    self = [super init];
    if(self)
	{
        self.text = aText; 
        cellHeight = 120;
    }
    return self;
}

-(void) dealloc
{
    [text release];
    [super dealloc];
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	TKTextViewCellView* cellView = (TKTextViewCellView*)[self lookupCellViewInTableView:tableView];
	[cellView updateWithText:text];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKTextViewCellView* cellView = [tableView.theme textViewCellView];
    cellView.owner = self;
	cellView.textView.delegate = (id)self;
	[cellView updateWithText:text];
	[self applyAttributesToCellView:cellView];
    return cellView;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)replacementText
{
    if ([replacementText isEqualToString:@"\n"])
	{
        [textView resignFirstResponder];
        return FALSE;
    }
    return TRUE;    
}

- (void)textViewDidChange:(UITextView *)textView
{
    self.text = textView.text;
}


-(void) setKeyboardType:(UIKeyboardType)keyboardType
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithAccessor:@selector(textView) getter:@selector(keyboardType) setter:@selector(setKeyboardType:) value:&keyboardType];
	[self addAttribute:attr];
	[attr release];
}

-(void) setFont:(UIFont*)font
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textView) getter:@selector(font) setter:@selector(setFont:) value:font];
	[self addAttribute:attr];
	[attr release];
}

-(void) setTextColor:(UIColor*)color
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textView) getter:@selector(textColor) setter:@selector(setTextColor:) value:color];
	[self addAttribute:attr];
	[attr release];
}

-(void) setBackgroundColor:(UIColor*)color
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textView) getter:@selector(backgroundColor) setter:@selector(setBackgroundColor:) value:color];
	[self addAttribute:attr];
	[attr release];
}


@end
