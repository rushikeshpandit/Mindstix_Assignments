//
//  LoginViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/9/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title=@"Login";
	[self.navigationController.navigationBar setTitleTextAttributes:
	 @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
	self.navigationController.navigationBar.topItem.title = @"";
	UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
		// add effect to an effect view
	_effect = [[UIVisualEffectView alloc]initWithEffect:blur];
	_effect.frame = self.view.frame;
		//	self.imgBackgroundImage.image = [UIImage imageNamed:@"wallpaper5.jpg"];

	[[_btnLogin layer] setBorderWidth:2.0f];
	[[_btnLogin layer] setBorderColor:[UIColor whiteColor].CGColor];
	[[_txtEmailid layer] setBorderWidth:2.0f];
	[[_txtEmailid layer] setBorderColor:[UIColor whiteColor].CGColor];
	[[_txtPasswrod layer] setBorderWidth:2.0f];
	[[_txtPasswrod layer] setBorderColor:[UIColor whiteColor].CGColor];

	_imgBackgroundImage.image = [UIImage imageNamed:@"wallpaper9.jpg"];
		//  Do any additional setup after loading the view, typically from a nib.
	_images = @[@"wallpaper2.jpg",@"wallpaper3.jpg",@"wallpaper4.jpg", @"wallpaper5.jpg",@"wallpaper6.jpg",@"wallpaper7.jpg",@"wallpaper8.jpg",@"wallpaper9.jpg",@"wallpaper10.jpg",@"wallpaper1.jpg"];
	myTime = [NSTimer scheduledTimerWithTimeInterval:5.00 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
	[self.imgBackgroundImage addSubview:_effect];

		// Do any additional setup after loading the view.
}

- (void)changeImage
{
	static int counter = 0;
	if([_images count] == counter+1)
		{
		counter = 0;
		}
	_imgBackgroundImage.image = [UIImage imageNamed:[_images objectAtIndex:counter]];
	counter++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
