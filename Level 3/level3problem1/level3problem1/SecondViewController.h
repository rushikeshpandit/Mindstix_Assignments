//
//  SecondViewController.h
//  level3problem1
//
//  Created by Mindstix Software Labs on 9/25/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgSecondayView;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;
@end
