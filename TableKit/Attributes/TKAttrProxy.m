//
//  TKAttrProxy.m
//  TableKitSample
//
//  Created by Sergey Nikitenko on 4/21/12.
//  Copyright (c) 2012 Sergey Nikitenko. All rights reserved.
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

#import "TKAttrProxy.h"
#import "TKCellAttribute.h"

@implementation TKAttrProxy

SEL sel_getterFromSetter(SEL setter)
{
	char selName[64];
	strcpy(selName, sel_getName(setter));
	NSCAssert(strncmp(selName, "set", 3)==0, @"Unexpected property setter format: %s", selName);
	selName[3] |= 040; // making lowercase
	selName[strlen(selName)-1] = 0;
	return sel_getUid(selName+3);
}

-(TKAttrProxy*) initWithTargetClass:(Class)aTargetClass
{
	targetClass = aTargetClass;
	accessor = NULL;
	attributes = nil;
	preparedForSingleCall = NO;
	return self;
}

-(TKAttrProxy*) prepareWithAccessor:(SEL)anAccessor attributes:(NSMutableArray*)anAttributes
{
	accessor = anAccessor;
	attributes = anAttributes;
	preparedForSingleCall = YES;
	return self;
}

- (NSMethodSignature*) methodSignatureForSelector:(SEL)selector
{
	return [targetClass instanceMethodSignatureForSelector:selector];
}

- (void) forwardInvocation:(NSInvocation *)invocation
{
	NSAssert(preparedForSingleCall, @"Attempt to reuse shared proxy prepared for single call");
	NSAssert([invocation.methodSignature numberOfArguments]==3, @"Unsupported method: %s", sel_getName(invocation.selector));
	
	SEL setter = invocation.selector;
	SEL getter = sel_getterFromSetter(setter);
	TKCellAttribute* attr =	nil;
	const char* argType = [invocation.methodSignature getArgumentTypeAtIndex:2];
	if(argType[0]==@encode(int)[0] || argType[0]==@encode(float)[0] || argType[0]==@encode(BOOL)[0])
	{
		int arg = 0;
		[invocation getArgument:&arg atIndex:2];
		attr = [[TKCellScalarAttribute alloc] initWithAccessor:accessor getter:getter setter:setter value:&arg];
	} 
	else if(argType[0]==@encode(id)[0])
	{
		id arg = 0;
		[invocation getArgument:&arg atIndex:2];
		attr = [[TKCellObjectAttribute alloc] initWithAccessor:accessor getter:getter setter:setter value:arg];
	} 
	NSAssert(attr!=nil, @"Unsupported argument type: %s", argType);

	[attributes removeObject:attr];
	[attributes addObject:attr];
	[attr release];
	
	preparedForSingleCall = NO;
}

@end
