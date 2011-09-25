//
//  TKTextViewCell.m
//
//  Created by Sergey Nikitenko on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTextViewCell.h"
#import "TKTheme.h"
#import "TKCellView.h"
#import "TKTextViewCellView.h"
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

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKTextViewCellId";
    
    TKTextViewCellView* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
		TKTheme* theme = [TKTheme themeForTableView:tableView];
		cell = [theme textViewCellViewWithReuseId:cellId];
    }

    cell.owner = self;
	cell.textView.delegate = (id)self;
	
	[cell updateWithText:text];
	[self applyAttributesToCellView:cell];

    return cell;
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
