//
//  PageContentViewController.h
//  Level 3 Assignment 2
//
//  Created by Mindstix Software Labs on 9/26/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@end
