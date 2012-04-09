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
@synthesize title;

+(TKActionCell*) cellWithTitle:(NSString*)aTitle target:(id)aTarget action:(SEL)actionSelector
{
    return [[[self alloc] initWithTitle:aTitle target:aTarget action:actionSelector] autorelease];
}

-(id) initWithTitle:(NSString*)aTitle target:(id)aTarget action:(SEL)actionSelector
{
    self = [super init];
    if(self)
	{
        self.title = aTitle;
        target = aTarget;
        action = actionSelector;
    }
    return self;
}

-(void) dealloc
{
    [title release];
    [super dealloc];
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	TKActionCellView* cellView = (TKActionCellView*)[self lookupCellViewInTableView:tableView];
    [cellView updateWithTitle:title];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKActionCellView* cellView = [tableView.theme actionCellView];
	cellView.owner = self;
    [cellView updateWithTitle:title];
	[self applyAttributesToCellView:cellView];
	return cellView;
}

-(void) tableViewDidSelectCell:(UITableView*) tableView
{
    if([target respondsToSelector:action])
	{
		NSMethodSignature* methodSignature = [target methodSignatureForSelector:action];
		if([methodSignature numberOfArguments]==2+1)
		{
            [target performSelector:action withObject:self];
		}
		else if([methodSignature numberOfArguments]==2)
		{
            [target performSelector:action];
		}
    }
}



@end
