//
//  ThirdTableViewController.m
//  level4assignment2
//
//  Created by Mindstix Software Labs on 9/30/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "ThirdTableViewController.h"
#import "FourthTableViewController.h"

@interface ThirdTableViewController ()
{
	NSArray *categories;
}

@end

@implementation ThirdTableViewController

- (void)viewDidLoad {
	self.title=@"Edit your preferences";
	self.tableView.opaque = NO;
	self.tableView.backgroundView = nil;
	[self.tableView setBackgroundColor:[UIColor clearColor]];
	[self.tableView setFrame: self.tableView.frame];
	UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"wallpaper5.jpg"]];
	self.tableView.backgroundColor = background;
    [super viewDidLoad];
    categories = [[NSArray alloc] initWithObjects:@"Notifications",@"Billing",@"Shipping",@"About",@"Terms and Conditions",nil];

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
	return [categories count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *ce = [tableView dequeueReusableCellWithIdentifier:@"third"];

	if(ce == nil)
		{
		ce = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"third"];
		}
	[[ce contentView] setBackgroundColor:[UIColor clearColor]];
	[[ce backgroundView] setBackgroundColor:[UIColor clearColor]];
	[ce setBackgroundColor:[UIColor clearColor]];
	ce.textLabel.text=[categories objectAtIndex:indexPath.row];

		// Configure the cell...

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


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

	if([segue.identifier isEqualToString:@"fourth"])
		{

		NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
		FourthTableViewController *dest = segue.destinationViewController;
		dest.caterogrieName = [categories objectAtIndex:indexPath.row];
		dest.title=@"Edit your preferences";


		}

}


@end
