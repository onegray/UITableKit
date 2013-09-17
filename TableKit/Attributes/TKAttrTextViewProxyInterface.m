//
//  TKAttrTextViewProxyInterface.m
//  TableKitSample
//
//  Created by Sergey Nikitenko on 4/22/12.
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

#import "TKAttrTextViewProxyInterface.h"
#import "TKAttrProxy.h"

@interface TKAttrProxy(TKAttrTextViewProxyInterface)
+(TKAttrTextViewProxyInterface*) sharedTextViewProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes;
@end

@implementation TKAttrProxy(TKAttrTextViewProxyInterface)

+(TKAttrTextViewProxyInterface*) sharedTextViewProxyWithAccessor:(SEL)accessor attributes:(NSMutableArray*)attributes
{
	static TKAttrProxy* sharedProxy = nil;
	if(!sharedProxy)
	{
		sharedProxy = [[TKAttrProxy alloc] initWithTargetClass:[UITextView class]];
	}
	return (TKAttrTextViewProxyInterface*)[sharedProxy prepareWithAccessor:accessor attributes:attributes];
}

@end


@implementation TKAttrTextViewProxyInterface

@dynamic delegate;
@dynamic font;
@dynamic textColor;
@dynamic textAlignment;
@dynamic editable;
@dynamic dataDetectorTypes;
@dynamic inputView;
@dynamic inputAccessoryView;

@dynamic autocapitalizationType;
@dynamic autocorrectionType;
@dynamic spellCheckingType;
@dynamic keyboardType;
@dynamic keyboardAppearance;
@dynamic returnKeyType;
@dynamic enablesReturnKeyAutomatically;

@dynamic onDidBeginEditingHandler;
@dynamic onDidEndEditingHandler;
@dynamic onDidChangeHandler;

@end


@implementation UITextView(standard_getters)

-(BOOL) editable 
{
	return [self isEditable];
}

@end


#import <objc/runtime.h>

@implementation UITextView(handlers)

-(void) setOnDidBeginEditingHandler:(id)handler
{
	objc_setAssociatedObject(self, @selector(onDidBeginEditingHandler), handler, OBJC_ASSOCIATION_RETAIN);
}

-(id) onDidBeginEditingHandler
{
	return objc_getAssociatedObject(self, @selector(onDidBeginEditingHandler));
}

-(void) setOnDidEndEditingHandler:(id)handler
{
	objc_setAssociatedObject(self, @selector(onDidEndEditingHandler), handler, OBJC_ASSOCIATION_RETAIN);
}

-(id) onDidEndEditingHandler
{
	return objc_getAssociatedObject(self, @selector(onDidEndEditingHandler));
}

-(void) setOnDidChangeHandler:(id)handler
{
	objc_setAssociatedObject(self, @selector(onDidChangeHandler), handler, OBJC_ASSOCIATION_RETAIN);
}

-(id) onDidChangeHandler
{
	return objc_getAssociatedObject(self, @selector(onDidChangeHandler));
}

@end

