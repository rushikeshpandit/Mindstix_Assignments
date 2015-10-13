//
//  FourthTableViewController.m
//  level4assignment2
//
//  Created by Mindstix Software Labs on 9/30/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "FourthTableViewController.h"

@interface FourthTableViewController ()
{
	NSArray *Notifications;
	NSArray *Billing;
	NSArray *Shipping;
	NSArray *About;
	NSArray *TermsandConditions;
	
}

@end

@implementation FourthTableViewController

- (void)viewDidLoad {
	self.tableView.opaque = NO;
	self.tableView.backgroundView = nil;
	[self.tableView setBackgroundColor:[UIColor clearColor]];
	[self.tableView setFrame: self.tableView.frame];
	UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wallpaper5.jpg"]];
	self.tableView.backgroundColor = background;
    [super viewDidLoad];

    Notifications=[NSArray arrayWithObjects:@"Preference 1",@"Preference 2",@"Preference 3", nil];
	Billing=[NSArray arrayWithObjects:@"Preference 1",@"Preference 2",@"Preference 3", nil];
	Shipping=[NSArray arrayWithObjects:@"Preference 1",@"Preference 2",@"Preference 3", nil];
	About=[NSArray arrayWithObjects:@"Preference 1",@"Preference 2",@"Preference 3", nil];
	TermsandConditions=[NSArray arrayWithObjects:@"Preference 1",@"Preference 2",@"Preference 3", nil];
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


	if([ _caterogrieName isEqualToString:@"Notifications"])
		return [Notifications count];
	if([ _caterogrieName isEqualToString:@"Billing"])
		return [Billing count];
	if([ _caterogrieName isEqualToString:@"Shipping"])
		return [Shipping count];
	if([ _caterogrieName isEqualToString:@"About"])
		return [About count];
	if([ _caterogrieName isEqualToString:@"Terms and Conditions"])
		return [TermsandConditions count];

	return 0;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourth" forIndexPath:indexPath];

	if([_caterogrieName isEqualToString:@"Notifications"])
		{
		cell.textLabel.text=[Notifications objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"Billing"])
		{
		cell.textLabel.text=[Billing objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"Shipping"])
		{
		cell.textLabel.text=[Shipping objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"About"])
		{
		cell.textLabel.text=[About objectAtIndex:indexPath.row];
		}
	if([_caterogrieName isEqualToString:@"Terms and Conditions"])
		{
		cell.textLabel.text=[TermsandConditions objectAtIndex:indexPath.row];
		}
	[[cell contentView] setBackgroundColor:[UIColor clearColor]];
	[[cell backgroundView] setBackgroundColor:[UIColor clearColor]];
	[cell setBackgroundColor:[UIColor clearColor]];

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
