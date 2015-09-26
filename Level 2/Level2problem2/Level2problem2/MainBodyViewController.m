//
//  MainBodyViewController.m
//  Level2problem2
//
//  Created by Mindstix Software Labs on 9/24/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "MainBodyViewController.h"

@interface MainBodyViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtTo;
@property (weak, nonatomic) IBOutlet UITextField *txtSubject;
@property (weak, nonatomic) IBOutlet UITextView *txtBody;
@property(strong,nonatomic) MFMailComposeViewController *mc;

@end

@implementation MainBodyViewController


-(IBAction)SendMail:(id)sender
{
		// Email Subject
	NSString *emailTitle = _txtSubject.text;
		// Email Content
	NSString *messageBody = _txtBody.text;
		// To address
	NSArray *toRecipents = @[_txtTo.text];
	NSLog(@"EMAIL TITLE :=  %@",emailTitle);
	NSLog(@"EMAIL BODY :=  %@",messageBody);
	NSLog(@"EMAIL TO :=  %@",toRecipents);
    _mc = [[MFMailComposeViewController alloc] init];
	_mc.mailComposeDelegate = self;
	[_mc setSubject:emailTitle];
	[_mc setMessageBody:messageBody isHTML:NO];
	[_mc setToRecipients:toRecipents];

		// Present mail view controller on screen

	[self presentViewController:_mc animated:YES completion:NULL];

}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
	switch (result)
	{
		case MFMailComposeResultCancelled:
		NSLog(@"Mail cancelled");
		break;
		case MFMailComposeResultSaved:
		NSLog(@"Mail saved");
		break;
		case MFMailComposeResultSent:
		NSLog(@"Mail sent");
		break;
		case MFMailComposeResultFailed:
		NSLog(@"Mail sent failure: %@", [error localizedDescription]);
		break;
		default:
		break;
	}

		// Close the Mail Interface
	[self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
