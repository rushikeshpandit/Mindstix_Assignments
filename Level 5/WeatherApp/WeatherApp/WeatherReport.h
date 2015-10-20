//
//  weatherDetails.h
//  WeatherApp
//
//  Created by mindstix on 8/5/14.
//  Copyright (c) 2014 mindstix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherReport : UIViewController<UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate,UISearchDisplayDelegate,UIGestureRecognizerDelegate>

//declare properties for TableView
@property (strong, nonatomic) IBOutlet UITableView *tblView;

//declare NSMutable Arrays properties
@property (nonatomic) NSMutableArray *siteArray;
@property (nonatomic) NSMutableArray *filteredArray;
@property (nonatomic) NSMutableArray *sites;

//declare Dictionary property
@property NSDictionary *site;

//declare NSString Properties
@property NSMutableString *element;
@property NSString *strWeather;
@property (nonatomic) NSString *county_name;
@property (nonatomic) NSString *feature_id;
@property (nonatomic) NSString *name;

@property (nonatomic) double primary_longitude;
@property (nonatomic) double primary_lattitude;

//declare NSURL properties
@property (nonatomic) NSURL *url;

//declare required methods
-(void)reLoadData;
-(id)initWtihData:(NSData *)parseData;


@end
