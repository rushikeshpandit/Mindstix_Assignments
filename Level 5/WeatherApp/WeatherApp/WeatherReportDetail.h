//
//  View2.h
//  WeatherApp
//
//  Created by mindstix on 8/5/14.
//  Copyright (c) 2014 mindstix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherReportDetail : UIViewController<UITableViewDataSource,UITableViewDelegate,NSXMLParserDelegate>
//declare string properties
@property NSString *strCityName;
@property NSString *cityId;
@property NSString *cityName;
@property NSString *cityURL;
@property NSString *cityLongitude;
@property NSString *cityLattitude;
@property NSString *weatherImg;
@property NSMutableString *element;

//deaclare mutable dictionary property
@property NSMutableDictionary *temprature;

@property (strong, nonatomic) IBOutlet UITableView *deatailTableView;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewWeather;

@property (strong, nonatomic) IBOutlet UIButton *fbShareButton;

@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (nonatomic)UIImage *imgWeather;

@end
