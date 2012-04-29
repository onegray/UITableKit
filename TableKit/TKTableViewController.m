//
//  TKTableViewController.m
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

#import "TKTableViewController.h"
#import "TKController.h"

@interface TKTableViewController()
@property (nonatomic, retain) TKController* controller;
@end

@implementation TKTableViewController
@synthesize controller;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
	{
		controller = [[TKController alloc] init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if(self)
	{
		controller = [[TKController alloc] init];
	}
	return self;
}

- (void)dealloc
{
    [controller release];
    [super dealloc];
}

-(void) setSections:(NSArray *)sections
{
	[controller setSections:sections];
}

-(NSArray*) sections 
{
	return [controller sections];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return [controller numberOfSectionsInTableView:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return [controller tableView:tableView heightForHeaderInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
	return [controller tableView:tableView heightForFooterInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [controller tableView:tableView viewForHeaderInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [controller tableView:tableView viewForFooterInSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [controller tableView:tableView titleForHeaderInSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [controller tableView:tableView titleForFooterInSection:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [controller tableView:tableView numberOfRowsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [controller tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [controller tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [controller tableView:tableView didSelectRowAtIndexPath:indexPath];
}

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return [controller tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [controller tableView:tableView canMoveRowAtIndexPath:indexPath];
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)src toProposedIndexPath:(NSIndexPath *)dst
{
    return [controller tableView:tableView targetIndexPathForMoveFromRowAtIndexPath:src toProposedIndexPath:dst];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    return [controller tableView:tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [controller tableView:tableView shouldIndentWhileEditingRowAtIndexPath:indexPath];
}

-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [controller tableView:tableView canEditRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [controller tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
}

@end
