//
//  TKCellView.m
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2012 Sergey Nikitenko. All rights reserved.
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

#import "TKCellView.h"
#import "TKCellAttribute.h"

@implementation TKCellView
@synthesize owner;
@synthesize preventEditing;
@synthesize reuseIdentifier=tableViewCellReuseId;
@synthesize rollbackArribute;

-(void) dealloc 
{
	[tableViewCellReuseId release];
	[rollbackArribute release];
	[super dealloc];
}

-(BOOL) isEditing
{
	return !preventEditing && [super isEditing];
}

@end


@implementation UITableView (TKCellView)

-(TKCellView*) lookupCellViewForCell:(id<TKCellProtocol>)cell
{
	for(id cellView in self.visibleCells)
	{
		if([cellView isKindOfClass:[TKCellView class]] && [(TKCellView*)cellView owner] == self)
		{
			return (TKCellView*)cellView;
		}
	}
	return nil;
}

@end
