//
//  SecondSearchBar.m
//  level4assignment2
//
//  Created by Mindstix Software Labs on 9/30/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "SecondSearchBar.h"

@implementation SecondSearchBar

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
		// Drawing code
		//	UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wallpaper5.jpg"]];
		//	UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wallpaper5.jpg"]];
		//self.backgroundColor=nil;
		//	self.backgroundImage=nil;
	self.backgroundImage= [UIImage imageNamed:@"wallpaper5.jpg"];
	self.backgroundColor=[[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"wallpaper5.jpg"]];
}



@end
