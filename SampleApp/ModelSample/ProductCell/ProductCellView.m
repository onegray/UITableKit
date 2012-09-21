//
//  ProductCellView.m
//  TableKitSample
//
//  Created by onegray on 9/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductCellView.h"
#import "ProductModel.h"

#define STAR_BUTTON_COUNT 5

@interface ProductCellView()
{
	UIButton* starButtons[STAR_BUTTON_COUNT];
	ProductModel* productWeakRef;
}
@end


@implementation ProductCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
	{
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
		for(int i=0; i<STAR_BUTTON_COUNT; i++) {
			UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
			btn.tag = i;
			[btn addTarget:self action:@selector(onStarBtn:) forControlEvents:UIControlEventTouchDown];
			[btn setTitle:@"*" forState:UIControlStateNormal];
			[btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
			[btn setTitleColor:[UIColor colorWithRed:1.0 green:0.8 blue:0.0 alpha:1.0] forState:UIControlStateSelected];
			[btn.titleLabel setFont:[UIFont boldSystemFontOfSize:56]];
			[self.contentView addSubview:btn];
			starButtons[i] = btn;
		}
    }
    return self;
}

-(void) layoutSubviews
{
	[super layoutSubviews];
	CGSize boundsSize = self.contentView.bounds.size;
	
	CGRect r = CGRectMake(boundsSize.width, 5, 28, 40);
	for(int i=STAR_BUTTON_COUNT-1; i>=0; i--) {
		r.origin.x -= r.size.width;
		starButtons[i].frame = r;
	}
}

-(void) updateRating:(int)raiting
{
	for(int i=0; i<STAR_BUTTON_COUNT; i++) {
		starButtons[i].selected = i < raiting; 
	}	
}

-(void) onStarBtn:(UIButton*)btn
{
	int rating = btn.selected ? btn.tag : btn.tag+1;
	productWeakRef.rating = rating;
	[self updateRating:rating];
}

-(void) setProduct:(ProductModel*)product
{
	productWeakRef = product;
	self.textLabel.text = product.title;
	self.detailTextLabel.text = product.description;
	[self updateRating:product.rating];
}


@end

