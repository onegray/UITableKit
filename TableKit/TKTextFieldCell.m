//
//  TKTextFieldCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTextFieldCell.h"
#import "TKTheme.h"
#import "TKCellView.h"
#import "TKCellAttribute.h"

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
	TKTextFieldCellView* cellView = (TKTextFieldCellView*)[self lookupCellViewInTableView:tableView];
	[cellView updateWithText:text placeholder:placeholder];
}

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    TKTextFieldCellView* cellView = [tableView.theme textFieldCellViewWithReuseId:@"TKTextFieldCellId"];
	cellView.owner = self;
	cellView.textField.delegate = (id)self;
	[cellView updateWithText:text placeholder:placeholder];
	[self applyAttributesToCellView:cellView];
    return cellView;
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


-(void) setKeyboardType:(UIKeyboardType)keyboardType
{
	TKCellAttribute* attr = [[TKCellScalarAttribute alloc] initWithAccessor:@selector(textField) selector:@selector(setKeyboardType:) value:keyboardType];
	[self addAttribute:attr];
	[attr release];
}

-(void) setFont:(UIFont*)font
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textField) selector:@selector(setFont:) value:font];
	[self addAttribute:attr];
	[attr release];
}

-(void) setTextColor:(UIColor*)color
{
	TKCellAttribute* attr = [[TKCellObjectAttribute alloc] initWithAccessor:@selector(textField) selector:@selector(setTextColor:) value:color];
	[self addAttribute:attr];
	[attr release];
}


@end





