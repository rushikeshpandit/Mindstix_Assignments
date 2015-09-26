//
//  SecondTableViewController.m
//  NavigationDemo
//
//  Created by Mindstix Software Labs on 9/22/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController
{
	NSArray *fruits;
	NSArray *animals;
	NSArray *cars;
	NSArray *bikes;
	NSArray *laptop;
	NSArray *mobile;
}

- (void)viewDidLoad {
    [super viewDidLoad];

	fruits = [NSArray arrayWithObjects:@"Mango",@"Lemon",@"Lichi",@"Pineapple",@"Apple", nil];
	animals = [NSArray arrayWithObjects:@"Dog",@"Cat",@"Rat",@"Lion",@"Deer", nil];
	cars = [NSArray arrayWithObjects:@"Audi",@"BMW",@"Scoda",@"Maruti",@"Fiat", nil];
	bikes= [NSArray arrayWithObjects:@"Kawasaki",@"Hero",@"Ducati",@"Bajaj",@"TVS", nil];
	laptop= [NSArray arrayWithObjects:@"Apple",@"Dell",@"HP",@"Sony",@"Samsung", nil];
	mobile= [NSArray arrayWithObjects:@"Nokia",@"Micromax",@"Samsung",@"Motorola",@"Karbonn", nil];
    
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
	if([ _caterogrieName isEqualToString:@"fruits"])
		return [fruits count];
	if([ _caterogrieName isEqualToString:@"animals"])
		return [fruits count];
	if([ _caterogrieName isEqualToString:@"cars"])
		return [fruits count];
	if([ _caterogrieName isEqualToString:@"bikes"])
		return [fruits count];
	if([ _caterogrieName isEqualToString:@"laptop"])
		return [fruits count];
	if([ _caterogrieName isEqualToString:@"mobile"])
		return [fruits count];

	return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categories2cell" ];

	if(cell==nil)
		{
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"categories2cell"];
		}
	if([_caterogrieName isEqualToString:@"fruits"])
		{
		cell.textLabel.text=[fruits objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"animals"])
		{
		cell.textLabel.text=[animals objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"cars"])
		{
		cell.textLabel.text=[cars objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"bikes"])
		{
		cell.textLabel.text=[bikes objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"laptop"])
		{
		cell.textLabel.text=[laptop objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"mobile"])
		{
		cell.textLabel.text=[mobile objectAtIndex:indexPath.row];
		}
    // Configure the cell...

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
