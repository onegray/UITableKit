//
//  TKTextViewCell.m
//
//  Created by Sergey Nikitenko on 6/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTextViewCell.h"

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
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UITextView* tv = [[[UITextView alloc] initWithFrame:CGRectMake(30, 10, 270, cellHeight-20)] autorelease];
		tv.autocapitalizationType = UITextAutocapitalizationTypeNone;
		tv.keyboardType = UIKeyboardTypeDefault;
		tv.backgroundColor = [UIColor clearColor];
        tv.tag = 100;
        [cell addSubview:tv];
    }
    
    UITextView* tv = (UITextView*)[cell viewWithTag:100];
	tv.delegate = (id)self;
    tv.text = text;
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

@end
