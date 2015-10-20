//
//  weatherDetails.m
//  WeatherApp
//
//  Created by mindstix on 8/5/14.
//  Copyright (c) 2014 mindstix. All rights reserved.
//

#import "WeatherReport.h"
#import "WeatherReportDetail.h"
#import <CFNetwork/CFNetwork.h>
#import <MapKit/MapKit.h>

@interface WeatherReport()
//declare properties Locally
@property (nonatomic)NSArray *imgArray;
@property(nonatomic)NSOperationQueue *parseQueue;
@end

//implementation of class weatherDetails
@implementation WeatherReport
//synthesize declared properties
@synthesize site,sites,element;
@synthesize  siteArray,filteredArray;
@synthesize tblView;
@synthesize name,feature_id,primary_lattitude,primary_longitude,url;

NSUInteger cnt;
static UIImage *img;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"WeatherReport" bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

-(id)initWtihData:(NSData *)parseData{

    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
    //initialize cnt variable
    cnt=0;
    
    //initialize sites array
    sites = [[NSMutableArray alloc] init];
    
    //set Navigation back button propeties
    self.navigationItem.backBarButtonItem.title =@"WeatherRepot";
    [ self.navigationItem.backBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                    [UIFont fontWithName:@"times new roman" size:15],NSFontAttributeName,nil]
                                                          forState:UIControlStateNormal];

    //set row height of searchResultTableView
    self.searchDisplayController.searchResultsTableView.rowHeight = tblView.rowHeight;
    
    //initialize Image array with objects
    self.imgArray = [[NSArray alloc]initWithObjects:@"partly_cloudy_rain-512.png",@"sun-512.png",@"partly_cloudy_day-512.png",@"storm-512.png",@"downpour-512.png", nil];
    
    //arrange tableview for ios7
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7){
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.tblView.contentInset = UIEdgeInsetsZero;
    }
    
    //To refresh TableView by pull down it
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.enabled=YES;

    //calls refresh mehtod to refresh all data from URL
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tblView addSubview:refreshControl];
    refreshControl.backgroundColor = [UIColor colorWithRed:219.0/255.0 green:225.0/255 blue:233.0/255.0 alpha:1];
    refreshControl.tintColor = [UIColor whiteColor];
    NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    refreshControl.attributedTitle = attributedTitle;
    
    //call reLoadData method for getting data from URL
    [self reLoadData];
}

//defenation of refresh method
-(void)refresh:(UIRefreshControl *)refreshControl{
    [refreshControl endRefreshing];
    //call reLoadData method for getting data from URL
    [self reLoadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//for handle error
-(void)handleError:(NSError *)error{
    
    NSString *errorMsg = [error localizedDescription];
    
    NSString *alertTitle = NSLocalizedString(@"Error", @"Download or Parse Error");
    
    NSString *okTitle = NSLocalizedString(@"OK", @"OK title for alert displayed when download or parser error occurs");
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle message:errorMsg delegate:nil cancelButtonTitle:okTitle otherButtonTitles:nil, nil];

    [alertView show];

}

//TableView method to count no of rows
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return [filteredArray count];
    }
    else
    {
        return  [sites count];
    }
}

//Assign data each cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableId = @"cellID";
    
    UITableViewCell *cell = [self.tblView dequeueReusableCellWithIdentifier:tableId ];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableId];
    }
    
    //declare Labels and imageView with proper tag
    UIImageView *imgView = (UIImageView*)[cell viewWithTag:11];
    UILabel *lblName = (UILabel*)[cell viewWithTag:13];
    UILabel *lblID = (UILabel*)[cell viewWithTag:12];
    UILabel *lblURL = (UILabel*)[cell viewWithTag:14];
    UILabel *lblLogitue = (UILabel*)[cell viewWithTag:15];
    UILabel *lblLatitude = (UILabel*)[cell viewWithTag:16];
    
    //set font to labels
    lblName.font = [UIFont boldSystemFontOfSize:21];
    lblID.font = [UIFont boldSystemFontOfSize:21];
    
    //hide labels
    lblLogitue.hidden = YES;
    lblLatitude.hidden = YES;
    

    //check for search result
    if(tableView==self.searchDisplayController.searchResultsTableView){
        self.searchDisplayController.searchResultsTableView.rowHeight = tblView.rowHeight;
        //declare dectionary object
        NSMutableDictionary *tempDictFiltered = (NSMutableDictionary*)[filteredArray objectAtIndex:indexPath.row];
        
        if(cnt == 5){
            cnt = 0;
        }
        imgView.image=[UIImage imageNamed:[self.imgArray objectAtIndex:cnt]];
        cnt++;
        
        //set dictionary values to label through key
        lblID.text = [tempDictFiltered objectForKey:@"feature_id"];
        lblName.text = [tempDictFiltered objectForKey:@"name"];
        lblURL.text = [tempDictFiltered objectForKey:@"url"];
        lblLatitude.text = [tempDictFiltered objectForKey:@"primary_latitude"];
        lblLogitue.text = [tempDictFiltered objectForKey:@"primary_longitude"];
        
    }
    else{
        //declare dectionary object
        NSMutableDictionary *tempDict = (NSMutableDictionary*)[self.sites objectAtIndex:indexPath.row];
     
        if(cnt == 5){
            cnt = 0;
        }
        imgView.image=[UIImage imageNamed:[self.imgArray objectAtIndex:cnt]];
        cnt++;
        
       //set dictionary values to label through key
        lblID.text = [tempDict objectForKey:@"feature_id"];
        lblName.text = [tempDict objectForKey:@"name"];
        lblURL.text = [tempDict objectForKey:@"url"];
        lblLatitude.text = [tempDict objectForKey:@"primary_latitude"];
        lblLogitue.text = [tempDict objectForKey:@"primary_longitude"];
    }
    return  cell;
}

//TableView method to remove selection of cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//for Search Data from TableView
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope{
  
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[c] %@",searchText];
 
    filteredArray = (NSMutableArray*)[sites filteredArrayUsingPredicate:predicate];
    
    [self.tblView reloadData];
    
    NSLog(@"%@",filteredArray);
    
}

//for getting complete entered search string
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
    [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:
    [self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
    
}

//NSXMLParser hits the start of an element
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
                                        namespaceURI:(NSString *)namespaceURI
                                        qualifiedName:(NSString *)qName
                                        attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"site"]){
        // site element found - create new instance of site class
        site=[[NSMutableDictionary alloc] init];
        
    }
}

//NSXMLParser hits an element value
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if(!element){
        // init the element with string value
        element=[[NSMutableString alloc] initWithString:string];
    }else{
        // append value to the element
        [element appendString:string];
    }
}

//NSXMLParser hits the end of an element
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
                                    namespaceURI:(NSString *)namespaceURI
                                    qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"sites"]){
        
        return;
    }
    
    if([elementName isEqualToString:@"site"]){
        //add site obeject in sites array
        [sites addObject:site];
        site = nil;
    } else{
        //add values for elementName into site dictionay
        [site setValue:element forKey:elementName];
    }
    //make element nil
    element = nil;
}

 //reLoadData method for getting data from URL
-(void)reLoadData {
    
    static NSString *urlCity = @"http://api.sba.gov/geodata/city_links_for_state_of/ca.xml";
    NSURLRequest *weatherURLRequest =
    [NSURLRequest requestWithURL:[NSURL URLWithString:urlCity]];
    
    //NSURLConnection to asynchronously download the data
    [NSURLConnection sendAsynchronousRequest:weatherURLRequest queue:[NSOperationQueue mainQueue]
                        // the NSOperationQueue upon which the handler block will be dispatched:
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
   //check for any returned NSError from the server
        if(error!=nil){
            [self handleError:error];
        }
        else
        {
            // check for any response errors
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            NSLog(@"Status code : %ld : %@", (long)[httpResponse statusCode], [response MIMEType]);
            if ((([httpResponse statusCode]/100) == 2) && [[response MIMEType]isEqual:@"text/xml"]) {
                
                //create and init NSXMLParser
                NSXMLParser *nsXMLParser=[[NSXMLParser alloc] initWithData:data];
                
                //set delegate
                [nsXMLParser setDelegate:self];
                
                //call parse method
                [nsXMLParser parse];
                
                //reload parsed data in tableView
                [self.tblView reloadData];
                
                //hide the activity indicator in the status bar
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                
            }
            
            else{
                NSString *errorString = NSLocalizedString(@"HTTP Error", @"Error message displayed when receving a connetopn error.");
                NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorString};
                
                NSError *reportError = [NSError errorWithDomain:@"HTTP" code:[httpResponse statusCode] userInfo:userInfo];
                [self handleError:reportError];
                
            }
        }
        
        
    }];
    
    //shows the activity indicator in the status bar
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    self.parseQueue = [NSOperationQueue new];
  }

//set TableView row height after search
- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{
       self.searchDisplayController.searchResultsTableView.rowHeight = tblView.rowHeight;
}

//pass data to next View 
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if([segue.identifier isEqualToString:@"segueDetailView"]){
        
        WeatherReportDetail *destinationController=segue.destinationViewController;
        
        //check for search view is active or not
        if (self.searchDisplayController.active) {
            
            //take indexpath of searchResultTableView
            NSIndexPath *indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            
            NSMutableDictionary *tempDict = (NSMutableDictionary*)[filteredArray objectAtIndex:indexPath.row];
            
            destinationController.cityName = [tempDict objectForKey:@"name"];
            destinationController.cityId = [tempDict objectForKey:@"feature_id"];
            destinationController.cityURL = [tempDict objectForKey:@"url"];
            destinationController.cityLongitude = [tempDict objectForKey:@"primary_longitude"];
            destinationController.cityLattitude = [tempDict objectForKey:@"primary_latitude"];
          
            //take image from search result & set it to detail view
            UITableViewCell *cell = [self.searchDisplayController.searchResultsTableView cellForRowAtIndexPath:indexPath];
            UIImageView *imgView1 = (UIImageView*)[cell viewWithTag:11];
            destinationController.imgWeather = imgView1.image;
            NSLog(@"img in Segue :%@ ",destinationController.imgWeather);
        }
        else{
            //take indexPath of tableView
            NSIndexPath *indexPath=[tblView indexPathForSelectedRow];
            
            NSMutableDictionary *tempDict = (NSMutableDictionary*)[sites objectAtIndex:indexPath.row];
            
            destinationController.cityName = [tempDict objectForKey:@"name"];
            destinationController.cityId=[tempDict objectForKey:@"feature_id"];
            destinationController.cityURL=[tempDict objectForKey:@"url"];
            destinationController.cityLongitude=[tempDict objectForKey:@"primary_longitude"];
            destinationController.cityLattitude=[tempDict objectForKey:@"primary_latitude"];

            //take image from selected row of tableView
            UITableViewCell *cell = [tblView cellForRowAtIndexPath:indexPath];
            UIImageView *imgView = (UIImageView*)[cell viewWithTag:11];
            destinationController.imgWeather = imgView.image;
            NSLog(@"img in Segue :%@",img);
        }
 }
}


@end
