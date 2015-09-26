//
//  SecondTableViewController.m
//  NavigationDemo
//
//  Created by Mindstix Software Labs on 9/22/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "SecondTableViewController.h"
#import "ThirdViewController.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController
{
	NSString *idd;
	NSString *name;
	NSDictionary *json;
	NSMutableArray *arrayOfName;
}

- (void)viewDidLoad {
	arrayOfName=[[NSMutableArray alloc]init];
	NSMutableArray *array1 = [_selectedObject objectForKey:@"product"];
	NSDictionary *dic;
	arrayOfName = [[NSMutableArray alloc]init];
	for (int i=0; i<array1.count; i++) {
		dic = [array1 objectAtIndex:i];
		name = [dic objectForKey:@"name"];
		[arrayOfName addObject:name];
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" ];
	if(cell==nil)
		{
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
		}
	// Configure the cell...
	cell.textLabel.text=[arrayOfName objectAtIndex:indexPath.row];

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



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if([segue.identifier isEqualToString:@"showed"]) {
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		ThirdViewController *detailsViewController = segue.destinationViewController;
		NSMutableArray *array2 = [_selectedObject objectForKey:@"product"];
		detailsViewController.selectedObject = [array2 objectAtIndex:indexPath.row];
		detailsViewController.caterogrieName = [arrayOfName objectAtIndex:indexPath.row];
		detailsViewController.title = detailsViewController.caterogrieName;
	}

}


@end
