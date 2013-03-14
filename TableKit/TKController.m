//
//  TKController.m
//  TableKitSample
//
//  Created by Sergey Nikitenko on 4/29/12.
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

#import "TKController.h"
#import "TKCellProtocol.h"
#import "TKCellView.h"
#import "TKSection.h"

@implementation TKController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if([_dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
		return [_dataSource numberOfSectionsInTableView:tableView];
	}
	return [_sections count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if([_delegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
		return [_delegate tableView:tableView heightForHeaderInSection:section];
	}
	return [[_sections objectAtIndex:section] headerHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
	if([_delegate respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
		return [_delegate tableView:tableView heightForFooterInSection:section];
	}
	return [[_sections objectAtIndex:section] footerHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if([_delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
		return [_delegate tableView:tableView viewForHeaderInSection:section];
	}
    return [[_sections objectAtIndex:section] headerView];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	if([_delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
		return [_delegate tableView:tableView viewForFooterInSection:section];
	}
    return [[_sections objectAtIndex:section] footerView];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if([_dataSource respondsToSelector:@selector(tableView:titleForHeaderInSection:)]) {
		return [_dataSource tableView:tableView titleForHeaderInSection:section];
	}
    return [[_sections objectAtIndex:section] headerTitle];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
	if([_dataSource respondsToSelector:@selector(tableView:titleForFooterInSection:)]) {
		return [_dataSource tableView:tableView titleForFooterInSection:section];
	}
    return [[_sections objectAtIndex:section] footerTitle];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if([_dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
		return [_dataSource tableView:tableView numberOfRowsInSection:section];
	}
    return [[_sections objectAtIndex:section] cellCount];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([_delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
		return [_delegate tableView:tableView heightForRowAtIndexPath:indexPath];
	}
    return [[[_sections objectAtIndex:indexPath.section] cellAtIndex:indexPath.row] cellHeightForTableView:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([_dataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
		return [_dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
	}
    return [[_sections objectAtIndex:indexPath.section] tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([_delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
		[_delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
		return;
	}
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    [[_sections objectAtIndex:indexPath.section] tableView:tableView didSelectCellWithIndex:indexPath.row];
}

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	if([_delegate respondsToSelector:@selector(tableView:accessoryButtonTappedForRowWithIndexPath:)]) {
		[_delegate tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
		return;
	}
    [[_sections objectAtIndex:indexPath.section] tableView:tableView accessoryButtonTappedForCellWithIndex:indexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([_dataSource respondsToSelector:@selector(tableView:canMoveRowAtIndexPath:)]) {
		return [_dataSource tableView:tableView canMoveRowAtIndexPath:indexPath];
	}
	return [[_sections objectAtIndex:indexPath.section] allowsReorderingDuringEditing];
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
	if([_delegate respondsToSelector:@selector(tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:)]) {
		return [_delegate tableView:tableView targetIndexPathForMoveFromRowAtIndexPath:sourceIndexPath toProposedIndexPath:proposedDestinationIndexPath];
	}
	
	if(![[_sections objectAtIndex:proposedDestinationIndexPath.section] allowsReorderingDuringEditing])
	{
		int dir = sourceIndexPath.section < proposedDestinationIndexPath.section ? -1 : 1; 
		int i = proposedDestinationIndexPath.section + dir;
		while ( i!=sourceIndexPath.section && [[_sections objectAtIndex:i] allowsReorderingDuringEditing] )
		{
			i+=dir;
		}
		int row = dir > 0 ? 0 : [[_sections objectAtIndex:i] cellCount]-1;
		return [NSIndexPath indexPathForRow:row inSection:i];
	}
	
    return proposedDestinationIndexPath;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
	if([_dataSource respondsToSelector:@selector(tableView:moveRowAtIndexPath:toIndexPath:)]) {
		[_dataSource tableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
		return;
	}
	
	TKSection* sourceSection = [_sections objectAtIndex:sourceIndexPath.section];
	id<TKCellProtocol> cell = [sourceSection cellAtIndex:sourceIndexPath.row];
	[sourceSection removeCellAtIndex:sourceIndexPath.row];
	TKSection* destinationSection = [_sections objectAtIndex:destinationIndexPath.section];
	[destinationSection insertCell:cell atIndex:destinationIndexPath.row];
}


- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([_delegate respondsToSelector:@selector(tableView:shouldIndentWhileEditingRowAtIndexPath:)]) {
		return [_delegate tableView:tableView shouldIndentWhileEditingRowAtIndexPath:indexPath];
	}
	return ![[_sections objectAtIndex:indexPath.section] preventIndentationDuringEditing];
}

-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([_dataSource respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)]) {
		return [_dataSource tableView:tableView canEditRowAtIndexPath:indexPath];
	}
	
	TKSection* section = [_sections objectAtIndex:indexPath.section];
	if(![(TKMutableSection*)section disableEditing])
	{
		TKCellView* cellView = (TKCellView*)[tableView cellForRowAtIndexPath:indexPath];
		return !cellView.preventEditing;
	}
	return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([_dataSource respondsToSelector:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)]) {
		[_dataSource tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
		return;
	}
	
    if(editingStyle==UITableViewCellEditingStyleDelete)
	{
        [[_sections objectAtIndex:indexPath.section] removeCellAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
