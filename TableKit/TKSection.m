//
//  TKSection.m
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

#import "TKSection.h"

@implementation TKSection
@synthesize headerHeight, headerTitle, headerView, footerHeight, footerTitle, footerView;

+(TKSection*) sectionWithCells: (id<TKCellProtocol>)cell, ...
{
	TKSection* section = [[[TKSection alloc] init] autorelease];
	
	if(cell)
	{
		[section addCell:cell];
        
		va_list args;
		va_start(args,cell);
        
		while( (cell = va_arg(args, id<TKCellProtocol>)) )
		{
			[section addCell:cell];
		}
        
		va_end(args);
	}
	return section;
}

-(id) init
{
    self = [super init];
    if(self)
	{
        cells = [[NSMutableArray alloc] init];
        headerHeight = 20;
        footerHeight = 20;
    }
    return self;
}

-(void) dealloc
{
    [cells release];
    [headerTitle release];
    [headerView release];
    [footerTitle release];
    [footerView release];
    [super dealloc];
}


-(void) addCell:(id<TKCellProtocol>)cell
{
    [cells addObject:cell];
}

-(void) removeCellAtIndex:(int)cellIndex
{
    [cells removeObjectAtIndex:cellIndex];
}

-(void) removeAllCells
{
	[cells removeAllObjects];
}

-(id<TKCellProtocol>) cellAtIndex:(int)cellIndex
{
    return [cells objectAtIndex:cellIndex];
}

-(void) insertCell:(id<TKCellProtocol>)cell atIndex:(int)cellIndex
{
    [cells insertObject:cell atIndex:cellIndex];
}

-(int) indexOfCell:(id<TKCellProtocol>)cell
{
	return [cells indexOfObject:cell];
}

-(int) cellCount
{
    return [cells count];
}

-(UITableViewCell*) cellWithIndex:(int)cellIndex forTableView:(UITableView*)tableView
{
    id<TKCellProtocol> cell = [cells objectAtIndex:cellIndex];
    return [cell cellForTableView:tableView];
}

-(void) tableView:(UITableView*)tableView didSelectCellWithIndex:(int)cellIndex
{
    id<TKCellProtocol> cell = [cells objectAtIndex:cellIndex];
	if([cell respondsToSelector:@selector(tableViewDidSelectCell:)]) {
		[cell tableViewDidSelectCell:tableView];
	}
}

-(void) tableView:(UITableView*)tableView accessoryButtonTappedForCellWithIndex:(int)cellIndex
{
    id<TKCellProtocol> cell = [cells objectAtIndex:cellIndex];
	if([cell respondsToSelector:@selector(tableViewAccessoryButtonTapped:)]) {
		[cell tableViewAccessoryButtonTapped:tableView];
	}
}

@end


@implementation TKMutableSection
@synthesize disableEditing, allowsReorderingDuringEditing, preventIndentationDuringEditing;

+(TKMutableSection*) sectionWithCells: (id<TKCellProtocol>)cell, ...
{
	TKMutableSection* section = [[[TKMutableSection alloc] init] autorelease];
	
	if(cell)
	{
		[section addCell:cell];
        
		va_list args;
		va_start(args,cell);
        
		while( (cell = va_arg(args, id<TKCellProtocol>)) )
		{
			[section addCell:cell];
		}
        
		va_end(args);
	}
	return section;
}

@end


@implementation TKSection (MutableSection)

-(BOOL) disableEditing
{
	return YES;
}

-(BOOL) allowsReorderingDuringEditing
{
	return NO;
}

-(BOOL) preventIndentationDuringEditing
{
	return NO;
}

@end

