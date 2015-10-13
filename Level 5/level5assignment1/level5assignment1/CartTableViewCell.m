//
//  CartTableViewCell.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/7/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import "CartTableViewCell.h"

@implementation CartTableViewCell

@synthesize imgCartImage,imgRatingOne,imgRatingTwo,imgRatingThree,imgRatingFour,imgRatingFive;
@synthesize lblName,lblPrice,lblDescription;
@synthesize btnWishIt,btnCancel;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
