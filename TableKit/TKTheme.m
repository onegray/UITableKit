//
//  TKTheme.m
//
//  Created by Sergey Nikitenko on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKTheme.h"
#import "TKCellView.h"
#import "TKStaticCellView.h"
#import "TKActionCellView.h"
#import "TKTextFieldCellView.h"
#import "TKSwitchCellView.h"

@implementation TKTheme

+(TKTheme*) themeForTableView:(UITableView*)tableView
{
	static TKTheme* instance = nil;
	if(!instance) 
	{
		instance = [[TKTheme alloc] init];
	}
	return instance;
}


-(TKStaticCellView*) staticCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKStaticCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}

-(TKActionCellView*) actionCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKActionCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}

-(TKTextFieldCellView*) textFieldCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKTextFieldCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}

-(TKSwitchCellView*) switchCellViewWithReuseId:(NSString*)reuseId
{
	return [[[TKSwitchCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId] autorelease];
}


@end
