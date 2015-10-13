//
//  WishlistTableViewCell.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/8/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import "WishlistTableViewCell.h"

@implementation WishlistTableViewCell
@synthesize imgCartImage,imgRatingOne,imgRatingTwo,imgRatingThree,imgRatingFour,imgRatingFive;
@synthesize lblName,lblPrice,lblDescription;
@synthesize btnCancel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
