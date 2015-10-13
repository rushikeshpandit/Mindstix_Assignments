//
//  SecondTableViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/6/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//
#import "SecondTableViewController.h"
#import "ThirdViewController.h"
#import "SecondTableViewCell.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController
{
	NSMutableArray *name;
	NSMutableArray *arrayOfName;
}


- (void)viewDidLoad
{
	NSMutableArray *array1 = [_selectedObject objectForKey:@"product"];
	NSDictionary *dic;
	NSString *title;
	name =[[NSMutableArray alloc]init];

	arrayOfName = [[NSMutableArray alloc]init];
	for (int i=0; i<array1.count; i++)
	{
		NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
		dic = [array1 objectAtIndex:i];
		title=[dic objectForKey:@"name"];
		[name addObject:title];
		[temp setValue:[dic objectForKey:@"name"] forKey:@"name"];
		[temp setValue:[dic objectForKey:@"image"] forKey:@"image"];
		[temp setValue:[dic objectForKey:@"price"] forKey:@"price"];
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
	SecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"second"];
	if(cell == nil)
	{
		cell = [[SecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"second"];
	}
	NSMutableDictionary *dataDict = [arrayOfName objectAtIndex:indexPath.row];
	cell.lblName.text=(NSString *)[dataDict valueForKey:@"name"];
	cell.lblPrice.text=(NSString *)[dataDict valueForKey:@"price"];
	cell.imgView.image=[UIImage imageNamed:[dataDict valueForKey:@"image"]];
	return cell;
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


#pragma mark - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
		// Get the new view controller using [segue destinationViewController].
		// Pass the selected object to the new view controller.
	if([segue.identifier isEqualToString:@"third"])
	{
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		ThirdViewController *detailsViewController = segue.destinationViewController;
		NSMutableArray *array1 = [_selectedObject objectForKey:@"product"];
		detailsViewController.selectedObject = [array1 objectAtIndex:indexPath.row];
		detailsViewController.title=[name objectAtIndex:indexPath.row];
	}
}

@end
