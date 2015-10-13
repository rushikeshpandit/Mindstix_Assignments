	//
	//  RootTableViewController.m
	//  NavigationDemo
	//
	//  Created by Mindstix Software Labs on 9/22/15.
	//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
	//

#import "FirstTableViewController.h"


@interface FirstTableViewController ()
{
	NSDictionary *json;
	NSMutableArray *arrayOfName;
	NSMutableArray *arrayOfImage;
}

@end

@implementation FirstTableViewController

- (void)viewDidLoad {

		//	NSLog(@"In the begining of View Did Load");
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Category" ofType:@"json"];
	NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
		// Parse the string into JSON
	json = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
	arrayOfName=[[NSMutableArray alloc]init];
	arrayOfImage=[[NSMutableArray alloc]init];
	NSMutableArray *array1 = [json objectForKey:@"category"];
	NSDictionary *dic;
		//NSString *name;
		UILabel *naame = (UILabel *) [self.view viewWithTag:2];
		UIImage *img = (UIImage *)[self.view viewWithTag:1];
		//arrayOfName = [[NSMutableArray alloc]init];
	for (int i=0; i<array1.count; i++) {
		dic = [array1 objectAtIndex:i];
			naame = [dic objectForKey:@"name"];
				img=[dic objectForKey:@"image"];
		[arrayOfName addObject:naame];
		[arrayOfImage addObject:img];
	}


	[super viewDidLoad];
		//	NSLog(@"At the end of View Did Load");
		// Uncomment the following line to preserve selection between presentations.
		// self.clearsSelectionOnViewWillAppear = NO;

		// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
		// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

	return [arrayOfName count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

		//	NSLog(@"In the begining of cell creation");

	UITableViewCell *ce = [tableView dequeueReusableCellWithIdentifier:@"home"];

	if(ce == nil)
		{
		ce = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"home"];
		}
	UILabel *naame = (UILabel *) [self.view viewWithTag:2];
	UIImageView *img = (UIImageView *)[self.view viewWithTag:1];
	naame.text=[arrayOfName objectAtIndex:indexPath.row];
	img.image=[UIImage imageNamed:[arrayOfImage objectAtIndex:indexPath.row]];

		// Configure the cell...
		//NSLog(@"At the end of Cell creation");
	return ce;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
/*
	// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if([segue.identifier isEqualToString:@"showArray"]) {
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		SecondTableViewController *detailsViewController = segue.destinationViewController;
		NSMutableArray *array2 = [json objectForKey:@"category"];
		detailsViewController.selectedObject = [array2 objectAtIndex:indexPath.row];
		detailsViewController.caterogrieName = [arrayOfName objectAtIndex:indexPath.row];
			//NSLog(@"categoryName %@", json);
		detailsViewController.title = detailsViewController.caterogrieName;
	}

}*/


@end
