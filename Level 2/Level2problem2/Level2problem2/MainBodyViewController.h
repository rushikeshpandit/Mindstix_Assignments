//
//  MainBodyViewController.h
//  Level2problem2
//
//  Created by Mindstix Software Labs on 9/24/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MainBodyViewController : UIViewController <MFMailComposeViewControllerDelegate> // Add the delegate


-(IBAction)SendMail:(id)sender;

@end
