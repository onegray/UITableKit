//
//  TKSwitchCell.m
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

#import "TKSwitchCell.h"
#import "TKTheme.h"
#import "TKCellView.h"
#import "TKCellAttribute.h"


@implementation TKSwitchCell

+(id) cellWithText:(NSString*)text state:(BOOL)state
{
	return [[self alloc] initWithText:text state:state target:nil action:NULL];
}

+(id) cellWithText:(NSString*)text state:(BOOL)state target:(id)target action:(SEL)selector
{
	return [[self alloc] initWithText:text state:state target:target action:selector];
}

+(id) cellWithText:(NSString*)text state:(BOOL)state handler:(void(^)(id cell))handler
{
	return [[self alloc] initWithText:text state:state handler:handler];
}

+(id) cellWithStyle:(UITableViewCellStyle)aCellStyle text:(NSString*)aText detailText:(NSString*)aDetailText state:(BOOL)aState
{
	return [[self alloc] initWithStyle:aCellStyle text:aText detailText:aDetailText state:aState];
}

-(id) initWithText:(NSString*)aText state:(BOOL)aState
{
	return [self initWithText:aText state:aState target:nil action:NULL];
}

-(id) initWithText:(NSString*)aText state:(BOOL)aState target:(id)aTarget action:(SEL)selector
{
	self = [super initWithText:aText target:aTarget action:selector];
	if(self)
	{
		_state = aState;
	}
	return self;
}

-(id) initWithText:(NSString*)aText state:(BOOL)aState handler:(void(^)(id cell))handler
{
	self = [super initWithText:aText handler:handler];
	if(self)
	{
		_state = aState;
	}
	return self;
}

-(id) initWithStyle:(UITableViewCellStyle)aCellStyle text:(NSString*)aText detailText:(NSString*)aDetailText state:(BOOL)aState;
{
	self = [super initWithStyle:aCellStyle text:aText detailText:aDetailText];
	if(self)
	{
		_state = aState;
	}
	return self;
}

-(void) updateCellViewInTableView:(UITableView*)tableView
{
	TKSwitchCellView* cellView = (TKSwitchCellView*)[tableView lookupCellViewForCell:self];
	[cellView updateWithText:text detailText:detailText state:_state];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
	TKSwitchCellView* cellView = [tableView.theme switchCellViewWithStyle:cellStyle];
	cellView.cellRef = (id)self;
	[cellView updateWithText:text detailText:detailText state:_state];
	[self applyAttributesToCellView:cellView];
	return cellView;
}

-(void) onCellViewDidUpdate:(TKSwitchCellView*)cellView
{
	_state = [cellView.switchButton isOn];
	[self performCellAction];
}

-(void) tableViewDidSelectCell:(UITableView*)tableView
{
}

-(void) tableViewAccessoryButtonTapped:(UITableView*)tableView
{
}

-(void) performCellAction
{
	if(self.handler)
	{
		self.handler(self);
	}

	NSMethodSignature* methodSignature = [self.target methodSignatureForSelector:self.action];
	if(methodSignature)
	{
		NSInvocation* inv = [NSInvocation invocationWithMethodSignature:methodSignature];
		[inv setTarget:self.target];
		[inv setSelector:self.action];
		if([methodSignature numberOfArguments]==2)
		{
			[inv invoke];
		}
		else if([methodSignature numberOfArguments]==2+1)
		{
			const char* argType = [methodSignature getArgumentTypeAtIndex:2];
			if(argType[0]==@encode(BOOL)[0]) {
				[inv setArgument:&_state atIndex:2];
				[inv invoke];
			} else if(argType[0]==@encode(id)[0]) {
				__unsafe_unretained id unsafeSelf = self;
				[inv setArgument:&unsafeSelf atIndex:2];
				[inv invoke];
			}
		}
	}
}

@end
