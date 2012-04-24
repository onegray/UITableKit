//
//  TKTextFieldCell.m
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

#import "TKTextFieldCell.h"
#import "TKTheme.h"
#import "TKCellView.h"

@interface TKAttrTextFieldProxyInterface(private)
+(TKAttrTextFieldProxyInterface*) sharedProxyWithAccesor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end


@implementation TKTextFieldCell
@synthesize title, text, cellStyle, placeholder;

+(TKTextFieldCell*) cellWithText:(NSString*)text placeholder:(NSString*)placeholder
{
    return [[[self alloc] initWithText:text placeholder:placeholder] autorelease];
}

+(id) cellWithStyle:(UITableViewCellStyle)style title:(NSString*)title placeholder:(NSString*)placeholder
{
	return [[[self alloc] initWithStyle:style title:title text:nil placeholder:placeholder] autorelease];
}

+(id) cellWithStyle:(UITableViewCellStyle)style title:(NSString*)title text:(NSString*)text placeholder:(NSString*)placeholder;
{
	return [[[self alloc] initWithStyle:style title:title text:text placeholder:placeholder] autorelease];
}

-(id) initWithText:(NSString*)aText placeholder:(NSString*)aPlaceholder
{
    return [self initWithStyle:UITableViewCellStyleDefault title:nil text:aText placeholder:aPlaceholder];
}

-(id) initWithStyle:(UITableViewCellStyle)aStyle title:(NSString*)aTitle placeholder:(NSString*)aPlaceholder
{
    return [self initWithStyle:aStyle title:aTitle text:nil placeholder:aPlaceholder];	
}

-(id) initWithStyle:(UITableViewCellStyle)aStyle title:(NSString*)aTitle text:(NSString*)aText placeholder:(NSString*)aPlaceholder
{
    self = [super init];
    if(self)
	{
		cellStyle = aStyle;
        self.title = aTitle; 
        self.text = aText; 
        self.placeholder = aPlaceholder;
    }
    return self;	
}

-(void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[title release];
    [text release];
    [placeholder release];
    [super dealloc];
}

-(void) updateCellViewInTableView:(UITableView*)tableView
{
	TKTextFieldCellView* cellView = (TKTextFieldCellView*)[self lookupCellViewInTableView:tableView];
	[cellView updateWithTitle:title text:text placeholder:placeholder];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKTextFieldCellView* cellView = [tableView.theme textFieldCellViewWithStyle:cellStyle];
	cellView.owner = self;
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChange:) 
												 name:UITextFieldTextDidChangeNotification object:cellView.textField];
	
	[cellView updateWithTitle:title text:text placeholder:placeholder];

	[self applyAttributesToCellView:cellView];
    return cellView;
}

-(void) textFieldTextDidChange:(NSNotification*)notification
{
    self.text = [[notification object] text];
}

-(TKAttrTextFieldProxyInterface*) textField
{
	attributes = attributes ? attributes : [[NSMutableArray alloc] initWithCapacity:1];
	return [TKAttrTextFieldProxyInterface sharedProxyWithAccesor:@selector(textField) attributes:attributes];
}

@end





