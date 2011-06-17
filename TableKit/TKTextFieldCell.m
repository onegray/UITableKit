//
//  TKTextFieldCell.m
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTextFieldCell.h"

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

-(UITableViewCell*) cellForTableView:(UITableView*)tableView
{
    static NSString* cellId = @"TKTextFieldCellId";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UITextField* tf = [[[UITextField alloc] initWithFrame:CGRectMake(30, 12, 270, 40)] autorelease];
        tf.tag = 100;
        [cell addSubview:tf];
    }

    UITextField* tf = (UITextField*)[cell viewWithTag:100];
	tf.delegate = (id)self;
    tf.text = text;
    tf.placeholder = placeholder;
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
