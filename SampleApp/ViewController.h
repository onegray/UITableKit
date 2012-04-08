//
//  ViewController.h
//  TableKitSample
//
//  Created by Sergey Nikitenko on 4/5/12.
//  Copyright (c) 2012 Sergey Nikitenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKTableViewController.h"

@class TKStaticCell, TKTextFieldCell, TKSwitchCell, TKTextViewCell;

@interface ViewController : TKTableViewController
{
	TKStaticCell* staticCell;
	TKTextFieldCell* textFieldCell;
	TKSwitchCell* switchCell;
	TKTextViewCell* textViewCell;
}


@end
