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
#import "TKAttrProxy.h"

@interface TKAttrProxy(TKAttrTextViewProxyInterface)
+(TKAttrTextViewProxyInterface*) sharedTextViewProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end


@implementation TKTextViewCell

+(TKTextViewCell*) cellWithText:(NSString*)text
{
	return [[self alloc] initWithText:text placeholder:nil];
}

+(id) cellWithText:(NSString*)text placeholder:(NSString*)placeholder
{
	return [[self alloc] initWithText:text placeholder:placeholder];
}

-(id) initWithText:(NSString*)aText
{
	return [self initWithText:aText placeholder:nil];
}

-(id) initWithText:(NSString*)aText placeholder:(NSString*)aPlaceholder
{
	self = [super init];
	if(self)
	{
		self.text = aText;
		self.placeholder = aPlaceholder;
		self.cellHeight = 120;
	}
	return self;
}

-(void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) updateCellViewInTableView:(UITableView*)tableView
{
	TKTextViewCellView* cellView = (TKTextViewCellView*)[tableView lookupCellViewForCell:self];
	[cellView updateWithText:_text placeholder:_placeholder];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
	TKTextViewCellView* cellView = [tableView.theme textViewCellView];
	cellView.cellRef = (id)self;
	[cellView updateWithText:_text placeholder:_placeholder];
	[self applyAttributesToCellView:cellView];
	return cellView;
}

-(CGFloat) cellHeightForTableView:(UITableView *)tableView
{
	if(self.cellHeight==0)
	{
		TKTextViewCellView* cellView = (id)[tableView.theme cachedCellForSelector:@selector(textViewCellView) style:0];
		[cellView updateWithText:_text placeholder:_placeholder];
		[self applyAttributesToCellView:cellView];
		
		[tableView addSubview:cellView];
		cellView.frame = tableView.bounds;
		CGFloat height = [cellView cellHeight];
		[cellView removeFromSuperview];
		
		return height;
	}
	return self.cellHeight;
}

-(void) onCellViewDidUpdate:(TKTextViewCellView*)cellView
{
	self.text = cellView.textView.text;
}

-(TKAttrTextViewProxyInterface*) textView
{
	return [TKAttrProxy sharedTextViewProxyWithAccessor:@selector(textView) attributes:self.attributes];
}

@end
