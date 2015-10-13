//
//  NotificationsViewController.m
//  level5assignment1
//
//  Created by Mindstix Software Labs on 10/9/15.
//  Copyright (c) 2015 Mindstix Software Labs. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[_lbltemp setHidden:YES];
	UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
		// add effect to an effect view
	_effect = [[UIVisualEffectView alloc]initWithEffect:blur];
	_effect.frame = self.view.frame;
	self.imgBackgroundImage.image = [UIImage imageNamed:@"wallpaper5.jpg"];
	[self.imgBackgroundImage addSubview:_effect];
	self.title=@"My Account";
	[self.navigationController.navigationBar setTitleTextAttributes:
	 @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
	self.navigationController.navigationBar.topItem.title = @"";

    // Do any additional setup after loading the view.

	if([_caterogrieName isEqualToString:@"Notifications"])
	{
		UILabel *lblPush = [[UILabel alloc]initWithFrame:CGRectMake(15, 125, 200, 15)];
		[lblPush setText:@"PUSH NOTIFICATION"];
		[lblPush setBackgroundColor:[UIColor clearColor]];
		[lblPush setFont:[UIFont systemFontOfSize:12]];
		[lblPush setTextColor:[UIColor lightGrayColor]];
		[[self view] addSubview:lblPush];


		UIView *viewBorderOne = [[UIView alloc]initWithFrame:CGRectMake(0, 145, 320, 1)];
		[viewBorderOne setBackgroundColor:[UIColor lightGrayColor]];
		[[self view] addSubview:viewBorderOne];


		UILabel *lblOrderStatus = [[UILabel alloc]initWithFrame:CGRectMake(18, 170, 150, 15)];
		[lblOrderStatus setText:@"Order status"];
		[lblOrderStatus setBackgroundColor:[UIColor clearColor]];
		[lblOrderStatus setFont:[UIFont systemFontOfSize:12]];
		[lblOrderStatus setTextColor:[UIColor whiteColor]];
		[[self view] addSubview:lblOrderStatus];


		UISwitch *swtchOredrStatus = [[UISwitch alloc] initWithFrame: CGRectMake(225, 165, 50, 25)];
		[swtchOredrStatus setOn:YES animated:YES];
		[self.view addSubview: swtchOredrStatus];


		UIView *viewBorderTwo = [[UIView alloc]initWithFrame:CGRectMake(0, 205, 320, 1)];
		[viewBorderTwo setBackgroundColor:[UIColor lightGrayColor]];
		[[self view] addSubview:viewBorderTwo];

		UILabel *lblSpecialOffer = [[UILabel alloc]initWithFrame:CGRectMake(18, 221, 150, 15)];
		[lblSpecialOffer setText:@"Special Offer"];
		[lblSpecialOffer setBackgroundColor:[UIColor clearColor]];
		[lblSpecialOffer setFont:[UIFont systemFontOfSize:12]];
		[lblSpecialOffer setTextColor:[UIColor whiteColor]];
		[[self view] addSubview:lblSpecialOffer];


		UISwitch *swtchSpecialOffer = [[UISwitch alloc] initWithFrame: CGRectMake(225, 215, 50, 25)];
		[swtchSpecialOffer setOn:YES animated:YES];
		[self.view addSubview: swtchSpecialOffer];


		UIView *viewBorderThree = [[UIView alloc]initWithFrame:CGRectMake(0, 255, 320, 1)];
		[viewBorderThree setBackgroundColor:[UIColor lightGrayColor]];
		[[self view] addSubview:viewBorderThree];

		UILabel *lblEmail = [[UILabel alloc]initWithFrame:CGRectMake(15, 270, 200, 15)];
		[lblEmail setText:@"EMAIL NOTIFICATION"];
		[lblEmail setBackgroundColor:[UIColor clearColor]];
		[lblEmail setFont:[UIFont systemFontOfSize:12]];
		[lblEmail setTextColor:[UIColor lightGrayColor]];
		[[self view] addSubview:lblEmail];


		UIView *viewBorderFour = [[UIView alloc]initWithFrame:CGRectMake(0, 290, 320, 1)];
		[viewBorderFour setBackgroundColor:[UIColor lightGrayColor]];
		[[self view] addSubview:viewBorderFour];

		UILabel *lblOrderConfirmation = [[UILabel alloc]initWithFrame:CGRectMake(18, 310, 150, 15)];
		[lblOrderConfirmation setText:@"Order confirmation"];
		[lblOrderConfirmation setBackgroundColor:[UIColor clearColor]];
		[lblOrderConfirmation setFont:[UIFont systemFontOfSize:12]];
		[lblOrderConfirmation setTextColor:[UIColor whiteColor]];
		[[self view] addSubview:lblOrderConfirmation];


		UISwitch *swtchOrderConfirmation = [[UISwitch alloc] initWithFrame: CGRectMake(225, 300, 50, 25)];
		[swtchOrderConfirmation setOn:YES animated:YES];
		[self.view addSubview: swtchOrderConfirmation];

		UIView *viewBorderFive = [[UIView alloc]initWithFrame:CGRectMake(0, 340, 320, 1)];
		[viewBorderFive setBackgroundColor:[UIColor lightGrayColor]];
		[[self view] addSubview:viewBorderFive];

		UILabel *lblEmailAddress = [[UILabel alloc]initWithFrame:CGRectMake(15, 350, 200, 15)];
		[lblEmailAddress setText:@"EMAIL ADDRESS"];
		[lblEmailAddress setBackgroundColor:[UIColor clearColor]];
		[lblEmailAddress setFont:[UIFont systemFontOfSize:12]];
		[lblEmailAddress setTextColor:[UIColor lightGrayColor]];
		[[self view] addSubview:lblEmailAddress];


		UIView *viewBorderSix = [[UIView alloc]initWithFrame:CGRectMake(0, 370, 320, 1)];
		[viewBorderSix setBackgroundColor:[UIColor lightGrayColor]];
		[[self view] addSubview:viewBorderSix];


		UILabel *lblEmailId = [[UILabel alloc]initWithFrame:CGRectMake(18, 380, 200, 15)];
		[lblEmailId setText:@"amrutahokedev@mindstix.com"];
		[lblEmailId setBackgroundColor:[UIColor clearColor]];
		[lblEmailId setFont:[UIFont systemFontOfSize:12]];
		[lblEmailId setTextColor:[UIColor whiteColor]];
		[[self view] addSubview:lblEmailId];


		UIView *viewBorderSeven = [[UIView alloc]initWithFrame:CGRectMake(0, 410, 320, 1)];
		[viewBorderSeven setBackgroundColor:[UIColor lightGrayColor]];
		[[self view] addSubview:viewBorderSeven];

	}
	if ([_caterogrieName isEqualToString:@"Billing"])
	{
		_lbltemp.text=_caterogrieName;
		[_lbltemp setTextColor:[UIColor whiteColor]];
		[_lbltemp setHidden:NO];

		UITextField *txtFirstName = [[UITextField alloc]initWithFrame:CGRectMake(18, 135, 140, 28)];
		[txtFirstName setPlaceholder:@"First Name"];
		[txtFirstName setBackgroundColor:[UIColor clearColor]];
		[txtFirstName setTextColor:[UIColor whiteColor]];
		[txtFirstName setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtFirstName];


		UITextField *txtLastName = [[UITextField alloc]initWithFrame:CGRectMake(165, 135, 140, 28)];
		[txtLastName setPlaceholder:@"Last Name"];
		[txtLastName setBackgroundColor:[UIColor clearColor]];
		[txtLastName setTextColor:[UIColor whiteColor]];
		[txtLastName setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtLastName];

		UITextField *txtMobileNo = [[UITextField alloc]initWithFrame:CGRectMake(18, 173, 288, 28)];
		[txtMobileNo setPlaceholder:@"Mobile No"];
		[txtMobileNo setBackgroundColor:[UIColor clearColor]];
		[txtMobileNo setTextColor:[UIColor whiteColor]];
		[txtMobileNo setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtMobileNo];

		UITextField *txtStreet = [[UITextField alloc]initWithFrame:CGRectMake(18, 210, 288, 28)];
		[txtStreet setPlaceholder:@"Street"];
		[txtStreet setBackgroundColor:[UIColor clearColor]];
		[txtStreet setTextColor:[UIColor whiteColor]];
		[txtStreet setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtStreet];


		UITextField *txtApt = [[UITextField alloc]initWithFrame:CGRectMake(18, 247, 288, 28)];
		[txtApt setPlaceholder:@"Apt/Suite"];
		[txtApt setBackgroundColor:[UIColor clearColor]];
		[txtApt setTextColor:[UIColor whiteColor]];
		[txtApt setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtApt];

		UITextField *txtState = [[UITextField alloc]initWithFrame:CGRectMake(18, 283, 140, 28)];
		[txtState setPlaceholder:@"State"];
		[txtState setBackgroundColor:[UIColor clearColor]];
		[txtState setTextColor:[UIColor whiteColor]];
		[txtState setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtState];


		UITextField *txtZip = [[UITextField alloc]initWithFrame:CGRectMake(165, 283, 140, 28)];
		[txtZip setPlaceholder:@"Zip"];
		[txtZip setBackgroundColor:[UIColor clearColor]];
		[txtZip setTextColor:[UIColor whiteColor]];
		[txtZip setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtZip];

	}
	if ([_caterogrieName isEqualToString:@"Shipping"])
	{
		_lbltemp.text=_caterogrieName;
		[_lbltemp setTextColor:[UIColor whiteColor]];
		[_lbltemp setHidden:NO];
		UITextField *txtFirstName = [[UITextField alloc]initWithFrame:CGRectMake(18, 135, 140, 28)];
		[txtFirstName setPlaceholder:@"First Name"];
		[txtFirstName setBackgroundColor:[UIColor clearColor]];
		[txtFirstName setTextColor:[UIColor whiteColor]];
		[txtFirstName setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtFirstName];


		UITextField *txtLastName = [[UITextField alloc]initWithFrame:CGRectMake(165, 135, 140, 28)];
		[txtLastName setPlaceholder:@"Last Name"];
		[txtLastName setBackgroundColor:[UIColor clearColor]];
		[txtLastName setTextColor:[UIColor whiteColor]];
		[txtLastName setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtLastName];

		UITextField *txtMobileNo = [[UITextField alloc]initWithFrame:CGRectMake(18, 173, 288, 28)];
		[txtMobileNo setPlaceholder:@"Mobile No"];
		[txtMobileNo setBackgroundColor:[UIColor clearColor]];
		[txtMobileNo setTextColor:[UIColor whiteColor]];
		[txtMobileNo setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtMobileNo];

		UITextField *txtStreet = [[UITextField alloc]initWithFrame:CGRectMake(18, 210, 288, 28)];
		[txtStreet setPlaceholder:@"Street"];
		[txtStreet setBackgroundColor:[UIColor clearColor]];
		[txtStreet setTextColor:[UIColor whiteColor]];
		[txtStreet setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtStreet];


		UITextField *txtApt = [[UITextField alloc]initWithFrame:CGRectMake(18, 247, 288, 28)];
		[txtApt setPlaceholder:@"Apt/Suite"];
		[txtApt setBackgroundColor:[UIColor clearColor]];
		[txtApt setTextColor:[UIColor whiteColor]];
		[txtApt setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtApt];

		UITextField *txtState = [[UITextField alloc]initWithFrame:CGRectMake(18, 283, 140, 28)];
		[txtState setPlaceholder:@"State"];
		[txtState setBackgroundColor:[UIColor clearColor]];
		[txtState setTextColor:[UIColor whiteColor]];
		[txtState setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtState];


		UITextField *txtZip = [[UITextField alloc]initWithFrame:CGRectMake(165, 283, 140, 28)];
		[txtZip setPlaceholder:@"Zip"];
		[txtZip setBackgroundColor:[UIColor clearColor]];
		[txtZip setTextColor:[UIColor whiteColor]];
		[txtZip setBorderStyle:UITextBorderStyleRoundedRect];
		[[self view] addSubview:txtZip];
	}
	if ([_caterogrieName isEqualToString:@"About"])
	{

	}
	if ([_caterogrieName isEqualToString:@"Terms and Conditions"])
	{

	}

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
