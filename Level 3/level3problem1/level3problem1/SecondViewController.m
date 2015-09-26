//
//  SecondViewController.m
//  level3problem1
//
//  Created by Mindstix Software Labs on 9/25/15.
//  Copyright © 2015 Mindstix Software Labs. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()


@end

@implementation SecondViewController

- (IBAction)takePhoto:(UIButton *)sender {
	if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {

		UIAlertController *myAlertView = [UIAlertController alertControllerWithTitle:@"Error" message:@"Device has no camera" preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction* ok = [UIAlertAction
							 actionWithTitle:@"OK"
							 style:UIAlertActionStyleDefault
							 handler:^(UIAlertAction * action)
							 {
							 [myAlertView dismissViewControllerAnimated:YES completion:nil];

							 }];
		UIAlertAction* cancel = [UIAlertAction
								 actionWithTitle:@"Cancel"
								 style:UIAlertActionStyleDefault
								 handler:^(UIAlertAction * action)
								 {
								 [myAlertView dismissViewControllerAnimated:YES completion:nil];

								 }];

		[myAlertView addAction:ok];
		[myAlertView addAction:cancel];

		[self presentViewController:myAlertView animated:YES completion:nil];

	}


	/*UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;

	[self presentViewController:picker animated:YES completion:NULL];*/

}

- (IBAction)selectPhoto:(UIButton *)sender {
	[_imgSecondayView setHidden:NO];

	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
	picker.allowsEditing = YES;
	picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

	[self presentViewController:picker animated:YES completion:NULL];


}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

	UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
	self.imgSecondayView.image = chosenImage;

	[picker dismissViewControllerAnimated:YES completion:NULL];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {

	[picker dismissViewControllerAnimated:YES completion:NULL];

}


- (void)viewDidLoad {
	[_imgSecondayView setHidden:YES];
	/*if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {

		UIAlertController *myAlertView = [UIAlertController alertControllerWithTitle:@"Error" message:@"Device has no camera" preferredStyle:UIAlertControllerStyleAlert];

		[self presentViewController:myAlertView animated:YES completion:nil];

	}*/
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
