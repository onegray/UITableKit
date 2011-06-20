//
//  TKTextFieldCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTextFieldCell.h"
#import "TKTheme.h"
#import "TKTextFieldCellView.h"

@implementation TKTextFieldCell
@synthesize delegate;
@synthesize text, placeholder;

+(TKTextFieldCell*) cellWithText:(NSString*)text placeholder:(NSString*)placeholder
{
    return [[[self alloc] initWithText:text placeholder:placeholder] autorelease];
}

-(id) initWithText:(NSString*)aText placeholder:(NSString*)aPlaceholder
{
    self = [super init];
    if(self)
	{
        self.text = aText; 
        self.placeholder = aPlaceholder;
    }
    return self;
}

-(void) dealloc
{
    [text release];
    [placeholder release];
    [super dealloc];
}

-(void) updateViewInTableView:(UITableView*)tableView
{
	TKTextFieldCellView* cell = (TKTextFieldCellView*)[self lookupCellViewInTableView:tableView];
	[cell updateWithText:text placeholder:placeholder];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKTextFieldCellId";
    
    TKTextFieldCellView* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
		TKTheme* theme = [TKTheme themeForTableView:tableView];
        cell = [theme textFieldCellViewWithReuseId:cellId];
    }

	cell.owner = self;
	cell.textField.delegate = (id)self;

	[cell updateWithText:text placeholder:placeholder];
	
    return cell;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self performSelector:@selector(textFieldUpdateCallback:) withObject:textField afterDelay:0];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void) textFieldUpdateCallback:(UITextField*)tf
{
    self.text = tf.text;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	if([delegate respondsToSelector:@selector(textFieldCellDidEndEditing:)])
	{
		[delegate textFieldCellDidEndEditing:self];
	}
}

@end
