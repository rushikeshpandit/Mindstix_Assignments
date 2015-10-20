//
//  ViewController.m
//  WeatherApp
//
//  Created by mindstix on 8/4/14.
//  Copyright (c) 2014 mindstix. All rights reserved.
//

#import "FrontViewController.h"
#import "WeatherReport.h"

@interface FrontViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imgSwipe;
@end

@implementation FrontViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //load image for showing swipe
    self.imgSwipe.image = [UIImage imageNamed:@"1407779615_one_finger_flick_gestureworks.png"];
  
    //set Navigation back button propeties to change font and size
    self.navigationItem.backBarButtonItem.title =@"Weather";
    [self.navigationItem.backBarButtonItem setTitleTextAttributes:
                        [NSDictionary dictionaryWithObjectsAndKeys:
                        [UIFont fontWithName:@"times new roman" size:15],NSFontAttributeName,nil]
                        forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
