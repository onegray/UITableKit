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
	TKSection* section = [[TKSection alloc] init];
	
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
		headerHeight = 20;
		footerHeight = 20;
    }
    return self;
}

-(id) initWithArrayOfCells:(NSArray*)cellArray
{
    self = [super init];
    if(self)
	{
		headerHeight = 20;
		footerHeight = 20;
		cells = [cellArray copy];
    }
    return self;
}

-(id) initWithMutableArrayOfCells:(NSMutableArray*)cellMutableArray
{
    self = [super init];
    if(self)
	{
		headerHeight = 20;
		footerHeight = 20;
		cells = cellMutableArray;
    }
    return self;
}

-(NSArray*)cells
{
	return cells;
}

-(void) addCellsFromArray:(NSArray *)cellArray
{
	if(![cells respondsToSelector:@selector(addObjectsFromArray:)]) {
		NSMutableArray* mutableCells = [NSMutableArray arrayWithCapacity:cells.count+cellArray.count];
		[mutableCells addObjectsFromArray:cells];
		cells = mutableCells;
	}
	[(NSMutableArray*)cells addObjectsFromArray:cellArray];
}

-(void) addCell:(id<TKCellProtocol>)cell
{
	if(![cells respondsToSelector:@selector(addObject:)]) {
		NSMutableArray* mutableCells = [NSMutableArray arrayWithCapacity:cells.count+1];
		[mutableCells addObjectsFromArray:cells];
		cells = mutableCells;
	}
	[(NSMutableArray*)cells addObject:cell];
}

-(void) insertCell:(id<TKCellProtocol>)cell atIndex:(int)cellIndex
{
	if(![cells respondsToSelector:@selector(insertObject:atIndex:)]) {
		NSMutableArray* mutableCells = [NSMutableArray arrayWithCapacity:cells.count+1];
		[mutableCells addObjectsFromArray:cells];
		cells = mutableCells;
	}
    [(NSMutableArray*)cells insertObject:cell atIndex:cellIndex];
}

-(void) removeCellAtIndex:(int)cellIndex
{
	if(![cells respondsToSelector:@selector(removeObjectAtIndex:)]) {
		NSMutableArray* mutableCells = [NSMutableArray arrayWithArray:cells];
		cells = mutableCells;
	}
    [(NSMutableArray*)cells removeObjectAtIndex:cellIndex];
}

-(void) removeAllCells
{
	cells = nil;
}

-(id<TKCellProtocol>) cellAtIndex:(int)cellIndex
{
    return [cells objectAtIndex:cellIndex];
}

-(int) indexOfCell:(id<TKCellProtocol>)cell
{
	return [cells indexOfObject:cell];
}

-(int) cellCount
{
    return [cells count];
}



-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<TKCellProtocol> cell = [cells objectAtIndex:indexPath.row];
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
	TKMutableSection* section = [[TKMutableSection alloc] init];
	
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



