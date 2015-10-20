//
//  View2.m
//  WeatherApp
//
//  Created by mindstix on 8/5/14.
//  Copyright (c) 2014 mindstix. All rights reserved.
//

#import "WeatherReportDetail.h"
#import "WeatherReport.h"
#import <CFNetwork/CFNetwork.h>
#import <MapKit/MapKit.h>

@interface WeatherReportDetail ()
@property(nonatomic)NSArray *weatherArray;
@property(nonatomic)NSOperationQueue *parseQueue;
@property NSString *maxMinVar;
@property NSString *url;
@property UIImage *captureImage;
@end

@implementation WeatherReportDetail
//synthesize declared properties
@synthesize cityLattitude,cityLongitude,cityName,cityId,cityURL,weatherImg;
@synthesize temprature ,element;
@synthesize deatailTableView,webview;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
           }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    temprature = [[NSMutableDictionary alloc] init];
    
    //set Navigation back button propeties
    self.navigationItem.backBarButtonItem.title =@"WeatherRepot";
    [ self.navigationItem.backBarButtonItem setTitleTextAttributes:
                        [NSDictionary dictionaryWithObjectsAndKeys:
                        [UIFont fontWithName:@"times new roman" size:15],NSFontAttributeName,nil]
                        forState:UIControlStateNormal];
    //call reLaodData method
   [self reLoadData];
    
    //set Keys and Values to temprature dictionary
    [temprature setObject:cityId forKey:@"City ID"];
    [temprature setObject:cityName forKey:@"City Name"];
    [temprature setObject:cityURL forKey:@"City URL"];
    [temprature setObject:cityLattitude forKey:@"Latitude"];
    [temprature setObject:cityLongitude forKey:@"Longitude"];
    
    
    // Set Image.
    [_imgViewWeather setImage:_imgWeather];
    
    NSLog(@"img in DetailView :%@ ",self.imgWeather);
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//reLoadData Method does connection with given URL & Parsed XML data
-(void)reLoadData{
    
    double latitude,longitude;
    latitude = [cityLattitude doubleValue];
    longitude = [cityLongitude doubleValue];
    
    //get today's date
    NSDate *currDate = [NSDate date];
    
    //format date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    
    // Initialize NSURLRequest
    NSString *strUrl =  [NSString stringWithFormat:@"http://graphical.weather.gov/xml/sample_products/browser_interface/ndfdBrowserClientByDay.php?lat=%f&lon=%f&format=24+hourly&startDate=%@&numDays=1",latitude,longitude,dateString];
    
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSLog(@"URL : %@", url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
     //NSURLConnection to asynchronously download the data
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        //check for any returned NSError from the server
        if(error!=nil){
            //if there is error occured during establising connection with URL call handleError method
            [self handleError:error];
        }
        else
        {
            NSHTTPURLResponse *httpResponse=(NSHTTPURLResponse *)response;
            
            if ((([httpResponse statusCode]/100) == 2) && [[response MIMEType]isEqual:@"text/xml"]) {
                
                //create and init NSXMLParser
                NSXMLParser *nsXMLParser = [[NSXMLParser alloc] initWithData:data];
                
                //set delegate
                [nsXMLParser setDelegate:self];
                
                //call parse method
                [nsXMLParser parse];
                
                 //hide the activity indicator in the status bar
                [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
            }
            
            else{
                NSString *errorString = NSLocalizedString(@"HTTP Error", @"Error message displayed when receving a connetopn error.");
                NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorString};
                
                NSError *reportError = [NSError errorWithDomain:@"HTTP" code:[httpResponse statusCode] userInfo:userInfo];
                [self handleError:reportError];
                
            }
        }
    }];
    
     //show the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    self.parseQueue=[NSOperationQueue new];
}

//Method to handle Error
-(void)handleError:(NSError *)error{
    
    NSString *errorMsg = [error localizedDescription];
    
    NSString *alertTitle = NSLocalizedString(@"Error", @"Download or Parse Error");
    
    NSString *okTitle = NSLocalizedString(@"OK", @"OK title for alert displayed when download or parser error occurs");
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle message:errorMsg delegate:nil cancelButtonTitle:okTitle otherButtonTitles:nil, nil];
    
    [alertView show];
    
}

//count the no. of rows 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  [temprature count];
}

//Assign data each cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *tableId = @"cellID";

    UITableViewCell *cell = [deatailTableView dequeueReusableCellWithIdentifier:tableId ];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableId];
    }
    
    //declare Labels with proper tag
    UILabel *lblCommonHeader = (UILabel*)[cell viewWithTag:21];
    UILabel *lblCommonDesc = (UILabel*)[cell viewWithTag:22];
    
    //sort dictionary keys
    NSMutableArray *sortedArray = [NSMutableArray arrayWithArray:temprature.allKeys];
    [sortedArray sortUsingSelector:@selector(localizedStandardCompare:)];
    
    NSString *key = [sortedArray objectAtIndex:indexPath.row];
   
    //assign keys to header label and values to description label from dictionary
    lblCommonHeader.text = [sortedArray objectAtIndex:indexPath.row];
    lblCommonDesc.text = [temprature objectForKey:[sortedArray objectAtIndex:indexPath.row]];

    //for URL give text color blue and on single tap it will open URL
    if ([key isEqualToString:@"City URL"]) {
            
        self.url=[temprature objectForKey:[sortedArray objectAtIndex:indexPath.row]];
        lblCommonDesc.textColor = [UIColor blueColor];
        lblCommonDesc.userInteractionEnabled = YES;
        
        //on single tap call tapAction method
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [lblCommonDesc addGestureRecognizer:tapGestureRecognizer];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        tapGestureRecognizer.cancelsTouchesInView = NO;
    }
 
    return cell;
}

//TableView method to remove selection of cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//method to open URL
-(void) tapAction: (UITapGestureRecognizer *)gestureRecognizer{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.url]];

}

//NSXMLParser hits the start of an element
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{

    if([elementName isEqualToString:@"temperature"]) {
        NSString *tempAttribute = [attributeDict valueForKey:@"type"];
        
        if([tempAttribute isEqualToString:@"maximum"]){
            self.maxMinVar = @"MAX";
            
        }else if([tempAttribute isEqualToString:@"minimum"])
        {
            self.maxMinVar = @"MIN";
        }
    }
}

//NSXMLParser hits an element value
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
   element = [[NSMutableString alloc] initWithString:string];
}

//NSXMLParser hits the end of an element
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"parameters"]){
        
        return;
    }
    
    //add Min temp and Max temp into dictionary
   if([elementName isEqualToString:@"value"] && [self.maxMinVar isEqual:@"MIN"]){
       [temprature setObject:element forKey:@"Min Temp"];
       self.maxMinVar = nil;
   }else if([elementName isEqualToString:@"value"] && [self.maxMinVar isEqual:@"MAX"]) {
       [temprature setObject:element forKey:@"Max Temp"];
       self.maxMinVar = nil;
   }
    [deatailTableView reloadData];

    element = nil;
}


#pragma mark - Code to share data on Facebook

//captue ScreenShot of View
-(void)captureView{
    
    self.fbShareButton.hidden = YES;
    UIGraphicsBeginImageContext(webview.frame.size);
	[self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    
    self.captureImage = viewImage;
    self.fbShareButton.hidden = NO;

}

@end
