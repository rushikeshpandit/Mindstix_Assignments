//
//  ViewController.h
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/6/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
	IBOutlet UIImageView *imgView;
	NSTimer *myTime;
}
@property (nonatomic,strong)NSArray *images;


@end

