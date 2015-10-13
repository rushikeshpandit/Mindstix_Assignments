//
//  SignUpViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/10/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title=@"Loing";

	UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
		// add effect to an effect view
	_effect = [[UIVisualEffectView alloc]initWithEffect:blur];
	_effect.frame = self.view.frame;
	self.imgBackgroundImage.image = [UIImage imageNamed:@"wallpaper5.jpg"];
	[self.imgBackgroundImage addSubview:_effect];
	[[_txtAddress layer] setBorderWidth:1.0f];
	[[_txtAddress layer] setBorderColor:[UIColor lightGrayColor].CGColor];
	   // Do any additional setup after loading the view.
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
