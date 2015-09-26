//
//  ViewController.h
//  Level 3 Assignment 2
//
//  Created by Mindstix Software Labs on 9/26/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@end

