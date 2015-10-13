//
//  WishlistTableViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/8/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import "WishlistTableViewController.h"
#import "WishlistTableViewCell.h"

@interface WishlistTableViewController ()

@end

@implementation WishlistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

    // Return the number of sections.
	// return 0;
	singletonClass *sharedInstance = [singletonClass sharedInstance];
	if (sharedInstance.wishList.count > 0) {
		self.tableView.backgroundView = NULL;
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
	} else {

			// Display a message when the table is empty
		UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];

		messageLabel.text = @"Wishlist is Empty";
		messageLabel.textColor = [UIColor blackColor];
		messageLabel.numberOfLines = 0;
		messageLabel.textAlignment = NSTextAlignmentCenter;
		messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
		[messageLabel sizeToFit];

		self.tableView.backgroundView = messageLabel;
		self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	}
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
	//return 0;
	singletonClass *sharedInstance = [singletonClass sharedInstance];
		// Return the number of rows in the section.
	return [sharedInstance.wishList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	singletonClass *sharedInstance = [singletonClass sharedInstance];
	NSLog(@"cartarray := %@\n\n\n",sharedInstance.cartArray);
	WishlistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wishlist"];
	if(cell == nil)
		{
		cell = [[WishlistTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"wishlist"];
		}

	NSMutableDictionary *dataDict = [sharedInstance.wishList objectAtIndex:indexPath.row];
	cell.lblName.text=(NSString *)[dataDict valueForKey:@"name"];
	cell.lblDescription.text=(NSString *)[dataDict valueForKey:@"description"];
	cell.lblPrice.text=(NSString *)[dataDict valueForKey:@"price"];
	cell.imgCartImage.image=[UIImage imageNamed:[dataDict valueForKey:@"image"]];
	[cell.btnCancel setImage:[UIImage imageNamed:@"cancel2.png"] forState:UIControlStateNormal];
	cell.imgRatingOne.image=[UIImage imageNamed:@"selected_star@2x.png"];
	cell.imgRatingTwo.image=[UIImage imageNamed:@"selected_star@2x.png"];
	cell.imgRatingThree.image=[UIImage imageNamed:@"selected_star@2x.png"];
	cell.imgRatingFour.image=[UIImage imageNamed:@"not_selected_star@2x.png"];
	cell.imgRatingFive.image=[UIImage imageNamed:@"not_selected_star@2x.png"];
	if ([@"3.5" isEqualToString:[dataDict valueForKey:@"rating"]])
		{
		cell.imgRatingFour.image=[UIImage imageNamed:@"half_selected_star@2x.png"];
		cell.imgRatingFive.image=[UIImage imageNamed:@"not_selected_star@2x.png"];
		}
	if ([@"4" isEqualToString:[dataDict valueForKey:@"rating"]])
		{
		cell.imgRatingFour.image=[UIImage imageNamed:@"selected_star@2x.png"];
		cell.imgRatingFive.image=[UIImage imageNamed:@"not_selected_star@2x.png"];
		}
	if ([@"4.5" isEqualToString:[dataDict valueForKey:@"rating"]])
		{
		cell.imgRatingFour.image=[UIImage imageNamed:@"selected_star@2x.png"];
		cell.imgRatingFive.image=[UIImage imageNamed:@"half_selected_star@2x.png"];
		}
	if ([@"5" isEqualToString:[dataDict valueForKey:@"rating"]])
		{
		cell.imgRatingFour.image=[UIImage imageNamed:@"selected_star@2x.png"];
		cell.imgRatingFive.image=[UIImage imageNamed:@"selected_star@2x.png"];
		}
		// Configure the cell...

	return cell;
}
-(IBAction)removeFromWishlist:(id)sender
{
	CGPoint touchPoint = [sender convertPoint:CGPointZero toView:self.tableView];
	NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:touchPoint];
	singletonClass *sharedInstance = [singletonClass sharedInstance];
	NSMutableDictionary *dataDict = [sharedInstance.wishList objectAtIndex:indexPath.row];
	NSLog(@"indexpath.row := %ld",(long)indexPath.row);
	[sharedInstance.wishList removeObject:dataDict];
	NSLog(@"Removed successfully");
	NSLog(@"cart contains := \n\n%@\n\n",sharedInstance.wishList);
	[self.tableView reloadData];
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
