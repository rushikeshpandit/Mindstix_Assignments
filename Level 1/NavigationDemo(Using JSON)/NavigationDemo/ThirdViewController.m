//
//  ThirdViewController.m
//  NavigationDemo
//
//  Created by Mindstix Software Labs on 9/24/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *lblNamee;
@property (weak, nonatomic) IBOutlet UILabel *price;


@end

@implementation ThirdViewController
{
	NSString *disc;
	NSString *name;
	NSDictionary *json;
	NSMutableArray *arrayOfName;
}

- (void)viewDidLoad {
	_lblNamee.text=[_selectedObject objectForKey:@"name"];
	_desc.text=[_selectedObject objectForKey:@"description"];
	_price.text=[_selectedObject objectForKey:@"price"];
	_rating.text=[_selectedObject objectForKey:@"rating"];
	_img.image=[UIImage imageNamed:[_selectedObject objectForKey:@"image"]];
	
	[super viewDidLoad];
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
