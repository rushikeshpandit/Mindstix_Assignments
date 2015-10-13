//
//  SearchViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/7/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (strong, nonatomic) IBOutlet UIVisualEffectView *effect;
@property (strong, nonatomic) IBOutlet UIImageView *imgBackgroundView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIButton *btnHideKeyboard;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
		// add effect to an effect view
	_effect = [[UIVisualEffectView alloc]initWithEffect:blur];
	_effect.frame = self.view.frame;
	self.imgBackgroundView.image = [UIImage imageNamed:@"wallpaper5.jpg"];
	[self.imgBackgroundView addSubview:_effect];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)hideKeyboard:(id)sender
{
	[self.searchBar resignFirstResponder];
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
