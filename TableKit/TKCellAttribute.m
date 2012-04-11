//
//  TKCellAttribute.m
//
//  Created by Sergey Nikitenko on 9/25/11.
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


@implementation TKCellFloatAttribute

-(id) initWithSelector:(SEL)sel value:(CGFloat)value
{
	self = [super init];
	if(self) 
	{
		selector = sel;
		floatValue = value;
	}
	return self;
}

-(id) initWithAccessor:(SEL)acr selector:(SEL)sel value:(CGFloat)value
{
	self = [super init];
	if(self) 
	{
		accessor = acr;
		selector = sel;
		floatValue = value;
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
	[inv setArgument:&floatValue atIndex:2];
	[inv invoke];
}

@end