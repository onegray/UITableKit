//
//  TKActionCell.h
//
//  Created by Sergey Nikitenko on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TKCell.h"

@interface TKActionCell : TKCell
{
    NSString* title;
    id target;
    SEL action;
}

+(TKActionCell*) cellWithTitle:(NSString*)title target:(id)target action:(SEL)action;
-(id) initWithTitle:(NSString*)title target:(id)target action:(SEL)action;

@property(nonatomic, retain) NSString* title;

@end
