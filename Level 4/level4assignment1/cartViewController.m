//
//  cartViewController.m
//  level4Assignment1(AddToCart)
//
//  Created by Mindstix Software on 28/09/15.
//  Copyright (c) 2015 Mindstix Software. All rights reserved.
//

#import "cartViewController.h"
#import "singletonClass.h"

@interface cartViewController ()
@property NSMutableArray *categoryArray;
@property NSMutableArray *priceArray;
@property UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sumLabel;
@property UILabel *priceLabel;
@property float sum;
@property (weak, nonatomic) IBOutlet UIButton *checkoutButton;
@end

@implementation cartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    singletonClass *sharedInstance = [singletonClass sharedInstance];
    NSDictionary *myDict=[[NSDictionary alloc]init];
    _categoryArray=[[NSMutableArray alloc]init];
    _priceArray = [[NSMutableArray alloc] init];
    _sum = 0;
    for (int i=0; i<sharedInstance.cartArray.count; i++) {
        myDict = [sharedInstance.cartArray objectAtIndex:i];
        [_priceArray addObject:[myDict objectForKey:@"price"]];
        [_categoryArray addObject:[myDict objectForKey:@"name"]];
        _sum = _sum + [[myDict objectForKey:@"price"] floatValue];
    }
    _sumLabel.text = [NSString stringWithFormat:@"%.2f",_sum];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.categoryArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"DetailsCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    _nameLabel= (UILabel *)[cell viewWithTag:1];
    _priceLabel = (UILabel *)[cell viewWithTag:2];
    
    _nameLabel.text = _categoryArray[indexPath.row];
    _priceLabel.text = _priceArray[indexPath.row];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"paymentSegue"])
    {
       
    }
}
*/
@end
