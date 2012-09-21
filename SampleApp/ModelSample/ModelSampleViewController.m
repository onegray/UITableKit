//
//  ModelSampleViewController.m
//  TableKitSample
//
//  Created by onegray on 9/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModelSampleViewController.h"
#import "ProductModel.h"
#import "ProductModel+Cell.h"

#import "TKSection.h"

@interface ModelSampleViewController ()
@property (nonatomic, retain) NSArray* products;
-(void) loadProducts;
-(void) saveProducts;
@end

@implementation ModelSampleViewController
@synthesize products;

-(id) initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	if(self) {
		[self loadProducts];
	}
	return self;
}

-(void) dealloc
{
	[products release];
	[super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
																							target:self action:@selector(onSaveBtn:)] autorelease];
	if(self.sections==nil)
	{
		TKSection* section = [[[TKSection alloc] initWithArrayOfCells:self.products] autorelease];
		section.footerTitle = @"Hint: rate the products and save";
		self.sections = [NSArray arrayWithObjects:section, nil];	
	}
}

-(void) onSaveBtn:(id)sender
{
	[self saveProducts];
	[self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void) loadProducts
{
	NSString* documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	NSArray* productsArray = [NSArray arrayWithContentsOfFile:[documentPath stringByAppendingPathComponent:@"products.plist"]];
	if(!productsArray) {
		productsArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"products" ofType:@"plist"]];
	}
	NSMutableArray* loadedProducts = [NSMutableArray arrayWithCapacity:[productsArray count]];
	for(NSDictionary* productDictionary in productsArray) {
		ProductModel* product = [[ProductModel alloc] initWithDictionary:productDictionary];
		[loadedProducts addObject:product];
		[product release];
	}
	self.products = loadedProducts;
}

-(void) saveProducts
{
	NSMutableArray* productsToSave = [NSMutableArray arrayWithCapacity:[self.products count]];
	for(ProductModel* product in self.products) {
		[productsToSave addObject:[product serializeToDictionary]];
	}
	NSString* documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
	[productsToSave writeToFile:[documentPath stringByAppendingPathComponent:@"products.plist"] atomically:YES];
}


@end
