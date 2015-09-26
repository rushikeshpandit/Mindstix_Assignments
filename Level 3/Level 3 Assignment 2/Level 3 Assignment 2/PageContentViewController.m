//
//  PageContentViewController.m
//  Level 3 Assignment 2
//
//  Created by Mindstix Software Labs on 9/26/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//


#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
			// Custom initialization
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
	self.titleLabel.text = self.titleText;

}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}

@end
