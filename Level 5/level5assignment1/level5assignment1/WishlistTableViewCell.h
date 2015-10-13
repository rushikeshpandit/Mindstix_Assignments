//
//  WishlistTableViewCell.h
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/8/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WishlistTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgCartImage;
@property (strong, nonatomic) IBOutlet UIImageView *imgRatingOne;
@property (strong, nonatomic) IBOutlet UIImageView *imgRatingTwo;
@property (strong, nonatomic) IBOutlet UIImageView *imgRatingThree;
@property (strong, nonatomic) IBOutlet UIImageView *imgRatingFour;
@property (strong, nonatomic) IBOutlet UIImageView *imgRatingFive;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;
@end
