//
//  AccountViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/8/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import "AccountViewController.h"
#import "NotificationsViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"

@interface AccountViewController ()
{
	NSArray *preferences;
}
@property (strong, nonatomic) IBOutlet UIImageView *imgBackgroundImage;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *effect;
@property (strong, nonatomic) IBOutlet UILabel *lblMessage;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UISegmentedControl *btnTab;
	//@property (strong, nonatomic) IBOutlet UITableView *tblPreferenceView;

@end

@implementation AccountViewController

- (void)viewDidLoad
{
	[[btnSignUp layer] setBorderWidth:2.0f];
	[[btnSignUp layer] setBorderColor:[UIColor whiteColor].CGColor];
	[[btnLogIn layer] setBorderWidth:2.0f];
	[[btnLogIn layer] setBorderColor:[UIColor whiteColor].CGColor];
		//	self.title=@"My Account";
	self.navigationController.navigationItem.title=@"My Account";
	self.navigationItem.titleView.backgroundColor=[UIColor clearColor];
	self.navigationItem.titleView.tintColor=[UIColor clearColor];

	static BOOL countOfBlur =YES;
	[super viewDidLoad];
	preferences=[[NSArray alloc] initWithObjects:@"Notifications",@"Billing",@"Shipping",@"About",@"Terms and Conditions", nil];
	if(countOfBlur == YES)
	{
	/*	self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
		self.navigationController.navigationBar.backgroundColor=[UIColor clearColor];
		//	self.navigationController.navigationBar.
		[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];

		self.navigationController.navigationBar.translucent = YES;   */

	[self.navigationController.navigationBar setBackgroundImage:[UIImage new]
												  forBarMetrics:UIBarMetricsDefault]; //UIImageNamed:@"transparent.png"
	self.navigationController.navigationBar.shadowImage = [UIImage new];////UIImageNamed:@"transparent.png"
	self.navigationController.navigationBar.translucent = YES;
	self.navigationController.view.backgroundColor = [UIColor clearColor];



		UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
		// add effect to an effect view
		_effect = [[UIVisualEffectView alloc]initWithEffect:blur];
		_effect.frame = self.view.frame;
		self.imgBackgroundImage.image = [UIImage imageNamed:@"wallpaper5.jpg"];
		[self.imgBackgroundImage addSubview:_effect];
		countOfBlur= NO;
		self.lblTitle.text=@"Messages";
		self.lblMessage.text=@"Currently no any messages.";
		[tblPreferenceView setHidden:YES];
		[self.lblMessage setHidden:NO];
	}
}

-(IBAction)btnLogin:(id)sender
{
	LoginViewController *destinationvcname = [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
	[self.navigationController pushViewController:destinationvcname animated:YES];
	self.title=@"My Account";
}

-(IBAction)btnSignUp:(id)sender
{
	 SignUpViewController *destinationvcname = [self.storyboard  instantiateViewControllerWithIdentifier:@"SignUp"];
	[self  presentViewController:destinationvcname animated:YES completion:nil];
		self.title=@"My Account";
}


-(IBAction)btnTabCHanged:(id)sender
{
	if(_btnTab.selectedSegmentIndex==0)
		{
		self.lblTitle.text=@"Messages";
		self.lblMessage.text=@"Currently no any messages.";
		[tblPreferenceView setHidden:YES];
		[self.lblMessage setHidden:NO];
		[self viewDidLoad];
		}
	if(_btnTab.selectedSegmentIndex==1)
		{
		self.lblTitle.text=@"Order";
		self.lblMessage.text=@"No any order.";
		[tblPreferenceView setHidden:YES];
		[self.lblMessage setHidden:NO];
		[self viewDidLoad];
		}
	if(_btnTab.selectedSegmentIndex==2)
		{
		self.lblTitle.text=@"Edit your preferences";
		[self.lblMessage setHidden:YES];
		[tblPreferenceView setHidden:NO];
		[self viewDidLoad];
		}
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

/*
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	NotificationsViewController *detailViewController = [[NotificationsViewController alloc] initWithNibName:@"Notification" bundle:nil];

		// Pass the selected object to the new view controller.

		// Push the view controller.
	[self.navigationController pushViewController:detailViewController animated:YES];
}*/


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return preferences.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
	if(cell == nil)
		{
				cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
				reuseIdentifier:@"cell"];
		}
	cell.textLabel.text=[preferences objectAtIndex:indexPath.row];
	cell.textLabel.textColor=[UIColor whiteColor];
	return cell;
}

/*
- (void)MySegmentControlAction:(UISegmentedControl *)segment
{
	if(segment.selectedSegmentIndex == 0)
		{
			// code for the first button
		}
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	if([segue.identifier isEqualToString:@"detail"])
		{
		NSIndexPath *indexPath = [tblPreferenceView  indexPathForSelectedRow];
		NotificationsViewController *detailsViewController = segue.destinationViewController;

		NSString *str = [preferences objectAtIndex:indexPath.row ];
		detailsViewController.caterogrieName=str;
		}

}


@end
