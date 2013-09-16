//
//  TKActionCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
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

#import "TKActionCell.h"
#import "TKCellView.h"
#import "TKTheme.h"

@implementation TKActionCell

+(id) cellWithText:(NSString*)aText target:(id)aTarget action:(SEL)selector
{
	return [[self alloc] initWithText:aText target:aTarget action:selector];
}

+(id) cellWithText:(NSString*)aText handler:(void(^)(id cell))handler
{
	return [[self alloc] initWithText:aText handler:handler];
}

+(id) cellWithStyle:(UITableViewCellStyle)cellStyle text:(NSString*)text detailText:(NSString*)detailText target:(id)aTarget action:(SEL)selector
{
	return [[self alloc] initWithStyle:cellStyle text:text detailText:detailText target:aTarget action:selector];
}

+(id) cellWithStyle:(UITableViewCellStyle)cellStyle text:(NSString*)text detailText:(NSString*)detailText handler:(void(^)(id cell))handler
{
	return [[self alloc] initWithStyle:cellStyle text:text detailText:detailText handler:handler];
}


-(id) initWithText:(NSString*)aText target:(id)aTarget action:(SEL)selector;
{
	self = [super initWithText:aText];
	if(self)
	{
		_target = aTarget;
		_action = selector;
	}
	return self;
}

-(id) initWithText:(NSString*)aText handler:(void(^)(id cell))handler
{
	self = [super initWithText:aText];
	if(self)
	{
		self.handler = handler;
	}
	return self;
}

-(id) initWithStyle:(UITableViewCellStyle)aCellStyle text:(NSString*)aText detailText:(NSString*)aDetailText target:(id)aTarget action:(SEL)selector
{
	self = [super initWithStyle:aCellStyle text:aText detailText:aDetailText];
	if(self)
	{
		_target = aTarget;
		_action = selector;
	}
	return self;
}

-(id) initWithStyle:(UITableViewCellStyle)aCellStyle text:(NSString*)aText detailText:(NSString*)aDetailText handler:(void(^)(id cell))handler
{
	self = [super initWithStyle:aCellStyle text:aText detailText:aDetailText];
	if(self)
	{
		self.handler = handler;
	}
	return self;
}


-(void) setTarget:(id)aTarget action:(SEL)selector
{
	_target = aTarget;
	_action = selector;
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
	TKGeneralCellView* cellView = [tableView.theme actionCellViewWithStyle:cellStyle];
	cellView.cellRef = (id)self;
	[cellView updateWithText:text detailText:detailText];
	[self applyAttributesToCellView:cellView];
	return cellView;
}

-(void) performCellAction
{
	if(_handler)
	{
		_handler(self);
	}
	
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
	if([_target respondsToSelector:_action])
	{
		NSMethodSignature* methodSignature = [_target methodSignatureForSelector:_action];
		if([methodSignature numberOfArguments]==2+1)
		{
			[_target performSelector:_action withObject:self];
		}
		else if([methodSignature numberOfArguments]==2)
		{
			[_target performSelector:_action];
		}
	}
#pragma clang diagnostic pop
}

-(void) tableViewDidSelectCell:(UITableView*) tableView
{
	[self performCellAction];
}

-(void) tableViewAccessoryButtonTapped:(UITableView *)tableView
{
	[self performCellAction];
}

@end
