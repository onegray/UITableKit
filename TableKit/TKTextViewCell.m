//
//  TKTextViewCell.m
//
//  Created by Sergey Nikitenko on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTextViewCell.h"
#import "TKTheme.h"
#import "TKCellView.h"
#import "TKCellAttribute.h"

@implementation TKTextViewCell
@synthesize text;
@synthesize cellHeight;

+(TKTextViewCell*) cellWithText:(NSString*)text
{
    return [[[self alloc] initWithText:text] autorelease];
}

-(id) initWithText:(NSString*)aText
{
    self = [super init];
    if(self)
	{
        self.text = aText; 
        cellHeight = 120;
    }
    return self;
}

-(void) dealloc
{
    [text release];
    [super dealloc];
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	TKTextViewCellView* cellView = (TKTextViewCellView*)[self lookupCellViewInTableView:tableView];
	[cellView updateWithText:text];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKTextViewCellView* cellView = [tableView.theme textViewCellViewWithReuseId:@"TKTextViewCellId"];
    cellView.owner = self;
	cellView.textView.delegate = (id)self;
	[cellView updateWithText:text];
	[self applyAttributesToCellView:cellView];
    return cellView;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)replacementText
{
    if ([replacementText isEqualToString:@"\n"])
	{
        [textView resignFirstResponder];
        return FALSE;
    }
    return TRUE;    
}

- (void)textViewDidChange:(UITextView *)textView
{
    self.text = textView.text;
}


-(void) setKeyboardType:(UIKeyboardType)keyboardType
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithAccessor:@selector(textView) selector:@selector(setKeyboardType:) value:keyboardType];
	[self addAttribute:attr];
	[attr release];
}

-(void) setFont:(UIFont*)font
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textView) selector:@selector(setFont:) value:font];
	[self addAttribute:attr];
	[attr release];
}

-(void) setTextColor:(UIColor*)color
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textView) selector:@selector(setTextColor:) value:color];
	[self addAttribute:attr];
	[attr release];
}

-(void) setBackgroundColor:(UIColor*)color
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textView) selector:@selector(setBackgroundColor:) value:color];
	[self addAttribute:attr];
	[attr release];
}


@end
