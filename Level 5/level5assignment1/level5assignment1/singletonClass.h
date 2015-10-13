//
//  singletonClass.h
//  level4Assignment1(AddToCart)
//
//  Created by Mindstix Software on 28/09/15.
//  Copyright (c) 2015 Mindstix Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singletonClass : NSObject{
    NSMutableArray *cartArray;
	NSMutableArray *wishList;
}

@property (strong, nonatomic) NSMutableArray *cartArray;
@property(strong,nonatomic) NSMutableArray *wishList;
+ (id) sharedInstance;

@end
