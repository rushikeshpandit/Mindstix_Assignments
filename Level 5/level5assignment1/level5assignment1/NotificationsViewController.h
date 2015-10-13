//
//  NotificationsViewController.h
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/9/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imgBackgroundImage;
@property (strong, nonatomic) IBOutlet UIView *viewBorderLine;

@property (nonatomic,strong) NSString *caterogrieName;
@property (strong, nonatomic) IBOutlet UILabel *lbltemp;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *effect;

@end
