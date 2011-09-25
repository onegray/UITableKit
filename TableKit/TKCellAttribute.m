//
//  TKCellAttribute.m
//
//  Created by Sergey Nikitenko on 9/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TKCellAttribute.h"

@implementation TKCellAttribute
@synthesize  selector, accessor;

-(void) apply:(id)target
{
	if(accessor)
	{
		NSAssert([target respondsToSelector:accessor], @"Unresponded TKCellAttribute accessor");
		target = [target performSelector:accessor];
	}
	NSAssert([target respondsToSelector:selector], @"Unresponded TKCellAttribute selector");
	[target performSelector:selector];
}

-(BOOL) isEqual:(TKCellAttribute*)object
{
	return selector == object.selector && accessor==object.accessor;
}

@end



@implementation TKCellObjectAttribute

-(id) initWithSelector:(SEL)sel value:(NSObject*)value
{
	self = [super init];
	if(self) 
	{
		selector = sel;
		objectValue = [value retain];
	}
	return self;
}

-(id) initWithAccessor:(SEL)acr selector:(SEL)sel value:(NSObject*)value
{
	self = [super init];
	if(self) 
	{
		accessor = acr;
		selector = sel;
		objectValue = [value retain];
	}
	return self;
}


-(void) dealloc
{
	[objectValue release];
	[super dealloc];
}

-(void) apply:(id)target
{
	if(accessor)
	{
		NSAssert([target respondsToSelector:accessor], @"Unresponded TKCellAttribute accessor");
		target = [target performSelector:accessor];
	}
	
	NSAssert([target respondsToSelector:selector], @"Unresponded TKCellAttribute selector");
	[target performSelector:selector withObject:objectValue];
}

@end

@implementation TKCellScalarAttribute

-(id) initWithSelector:(SEL)sel value:(int)value
{
	self = [super init];
	if(self) 
	{
		selector = sel;
		scalarValue = value;
	}
	return self;
}

-(id) initWithAccessor:(SEL)acr selector:(SEL)sel value:(int)value
{
	self = [super init];
	if(self) 
	{
		accessor = acr;
		selector = sel;
		scalarValue = value;
	}
	return self;
}

-(void) apply:(id)target
{
	if(accessor)
	{
		NSAssert([target respondsToSelector:accessor], @"Unresponded TKCellAttribute accessor");
		target = [target performSelector:accessor];
	}
	
	NSAssert([target respondsToSelector:selector], @"Unresponded TKCellAttribute selector");
	NSMethodSignature* sig = [target methodSignatureForSelector:selector];
	NSAssert([sig numberOfArguments]==3, @"Invalid TKCellAttribute selector signature");
	NSInvocation* inv = [NSInvocation invocationWithMethodSignature:sig];
	[inv setTarget:target];
	[inv setSelector:selector];
	[inv setArgument:&scalarValue atIndex:2];
	[inv invoke];
}

@end