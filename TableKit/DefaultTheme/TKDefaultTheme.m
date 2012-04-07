//
//  TKDefaultTheme.m
//  TableKitSample
//
//  Created by onegray on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TKDefaultTheme.h"

#import "TKDefaultStaticCellView.h"
#import "TKDefaultActionCellView.h"
#import "TKDefaultTextFieldCellView.h"
#import "TKDefaultSwitchCellView.h"
#import "TKDefaultTextViewCellView.h"


@implementation TKDefaultTheme

-(TKDefaultStaticCellView*) staticCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKDefaultStaticCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}

-(TKDefaultActionCellView*) actionCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKDefaultActionCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}

-(TKDefaultTextFieldCellView*) textFieldCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKDefaultTextFieldCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}

-(TKDefaultSwitchCellView*) switchCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKDefaultSwitchCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}

-(TKDefaultTextViewCellView*) textViewCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKDefaultTextViewCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}



@end
