//
//  ViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/6/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;
@end

@implementation ViewController

- (void)viewDidLoad {

	[[_btnSignUp layer] setBorderWidth:2.0f];
	[[_btnSignUp layer] setBorderColor:[UIColor whiteColor].CGColor];
	imgView.image = [UIImage imageNamed:@"wallpaper9.jpg"];
		//  Do any additional setup after loading the view, typically from a nib.
	_images = @[@"wallpaper2.jpg",@"wallpaper3.jpg",@"wallpaper4.jpg", @"wallpaper5.jpg",@"wallpaper6.jpg",@"wallpaper7.jpg",@"wallpaper8.jpg",@"wallpaper9.jpg",@"wallpaper10.jpg",@"wallpaper1.jpg"];
	myTime = [NSTimer scheduledTimerWithTimeInterval:5.00 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
		[super viewDidLoad];

}
- (void)changeImage
{
	static int counter = 0;
	if([_images count] == counter+1)
		{
		counter = 0;
		}
	imgView.image = [UIImage imageNamed:[_images objectAtIndex:counter]];
	counter++;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
