//
//  LoginViewController.h
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/9/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
	IBOutlet UIImageView *imgView;
	NSTimer *myTime;
}
@property (strong, nonatomic) IBOutlet UIImageView *imgBackgroundImage;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *effect;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UITextField *txtEmailid;
@property (strong, nonatomic) IBOutlet UITextField *txtPasswrod;
@property (nonatomic,strong)NSArray *images;

@end
