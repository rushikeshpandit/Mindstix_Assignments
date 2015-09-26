//
//  ViewController.m
//  Level2problem2
//
//  Created by Mindstix Software Labs on 9/24/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "ViewController.h"
#import "MainBodyViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *showEmail;


@end

@implementation ViewController

-(IBAction)showWindow
{
	UIViewController *viewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"sendEmail"];
	UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:viewController];
	[self.navigationController pushViewController:navi animated:YES];
}
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
