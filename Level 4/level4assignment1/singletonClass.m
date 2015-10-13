//
//  singletonClass.m
//  level4Assignment1(AddToCart)
//
//  Created by Mindstix Software on 28/09/15.
//  Copyright (c) 2015 Mindstix Software. All rights reserved.
//

#import "singletonClass.h"

@implementation singletonClass

@synthesize cartArray;

+ (id)sharedInstance {
    static singletonClass *sharedMyInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyInstance = [[self alloc] init];
    });
    return sharedMyInstance;
}

- (id)init {
    if (self = [super init]) {
        cartArray = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
