//
//  AccountViewController.h
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/8/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
	IBOutlet UITableView *tblPreferenceView;
	IBOutlet UIButton *btnSignUp;
	IBOutlet UIButton *btnLogIn;
}


@end
