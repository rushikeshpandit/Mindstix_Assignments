//
//  ThirdViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/6/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "ThirdViewController.h"
#include "singletonClass.h"

@interface ThirdViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imgBackgroundView;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *effect;
@property (strong, nonatomic) IBOutlet UIImageView *imgMainView;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UIButton *btnBuyNow;
@property (strong, nonatomic) IBOutlet UIButton *btnAddtoCart;
@property (strong, nonatomic) IBOutlet UIButton *btnWishlist;
@property(strong,nonatomic) NSString *imgName;


@end

@implementation ThirdViewController

- (void)viewDidLoad
{
	singletonClass *sharedInstance = [singletonClass sharedInstance];
	_lblName.text=(NSString *)[_selectedObject objectForKey:@"name"];
	_lblDescription.text=(NSString *)[_selectedObject objectForKey:@"description"];
	_lblPrice.text=(NSString *)[_selectedObject objectForKey:@"price"];
	// create effect
	UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
		// add effect to an effect view
	_effect = [[UIVisualEffectView alloc]initWithEffect:blur];
	_effect.frame = self.view.frame;
	self.imgBackgroundView.image = [UIImage imageNamed:[_selectedObject objectForKey:@"image"]];
	_imgMainView.image=[UIImage imageNamed:[_selectedObject objectForKey:@"image"]];
		// add the effect view to the image view
	[self.imgBackgroundView addSubview:_effect];
	if([sharedInstance.wishList containsObject:self.selectedObject])
	{
		[self.btnWishlist setImage:[UIImage imageNamed:@"wish_heart.png"]forState:UIControlStateNormal];
		self.imgName=@"wish_heart.png";
		if (![sharedInstance.wishList containsObject:self.selectedObject])
		{
			[sharedInstance.wishList addObject:self.selectedObject];
		}
	}
	else
	{
		[self.btnWishlist setImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
		self.imgName = @"love.png";
		[sharedInstance.wishList removeObject:self.selectedObject];

	}
	[super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToCart:(id)sender {
	singletonClass *sharedInstance = [singletonClass sharedInstance];
	if (![sharedInstance.cartArray containsObject:_selectedObject])
	{
		[sharedInstance.cartArray addObject:_selectedObject];
	NSLog(@"Added successfully");
	NSLog(@"Cart contains := \n\n%@\n\n",sharedInstance.cartArray);
	}

}

-(IBAction)addToWishlist:(id)sender
{
	singletonClass *sharedInstance = [singletonClass sharedInstance];
		//	[sharedInstance.wishList addObject:_selectedObject];
	if([self.imgName isEqualToString:@"love.png"])
		{
		[self.btnWishlist setImage:[UIImage imageNamed:@"wish_heart.png"]forState:UIControlStateNormal];
		self.imgName=@"wish_heart.png";
		if (![sharedInstance.wishList containsObject:self.selectedObject])
			{
			[sharedInstance.wishList addObject:self.selectedObject];
			}
		}
	else
		{
		[self.btnWishlist setImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
		self.imgName = @"love.png";
		[sharedInstance.wishList removeObject:self.selectedObject];

		}
	NSLog(@"Added successfully");
	NSLog(@"Wishlist contains := \n\n%@\n\n",sharedInstance.wishList);

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
