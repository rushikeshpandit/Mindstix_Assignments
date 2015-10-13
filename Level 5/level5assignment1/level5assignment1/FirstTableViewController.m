//
//  FirstTableViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/6/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "FirstTableViewController.h"
#import "SecondTableViewController.h"
#import "FirstTableViewCell.h"


@interface FirstTableViewController ()

@end

@implementation FirstTableViewController
{
	NSDictionary *json;
	NSMutableArray *arrayOfName;
	NSMutableArray *name;
}
- (void)viewDidLoad {
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Category" ofType:@"json"];
	NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
	json = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
	arrayOfName = [[NSMutableArray alloc]init];
		//arrayOfImage = [[NSMutableArray alloc]init];
	NSMutableArray *array1 = [json objectForKey:@"category"];
	NSString *title;
	name =[[NSMutableArray alloc]init];
	NSDictionary *dic;
		//self.title=@"Product";
	for (int i=0; i<array1.count; i++)
		{
			NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
			dic = [array1 objectAtIndex:i];
			title=[dic objectForKey:@"name"];
			[name addObject:title];
			[temp setValue:[dic objectForKey:@"name"] forKey:@"name"];
			[temp setValue:[dic objectForKey:@"image"] forKey:@"image"];
			[arrayOfName addObject:temp];
		}
	[super viewDidLoad];
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home"];
	if(cell == nil)
	{
		cell = [[FirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"home"];
	}
	NSMutableDictionary *dataDict = [arrayOfName objectAtIndex:indexPath.row];
	cell.lblName.text=(NSString *)[dataDict valueForKey:@"name"];
	cell.imgView.image = [UIImage imageNamed:[dataDict valueForKey:@"image"]];
	return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 140;
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

	// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if([segue.identifier isEqualToString:@"first"])
	{
		NSIndexPath *indexPath = [self.tableView  indexPathForSelectedRow];
		SecondTableViewController *detailsViewController = segue.destinationViewController;
		NSMutableArray *array2 = [json objectForKey:@"category"];
		detailsViewController.selectedObject = [array2 objectAtIndex:indexPath.row];
		detailsViewController.title=[name objectAtIndex:indexPath.row];
	}
}
@end
