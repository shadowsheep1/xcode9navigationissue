//
//  LeftMenuTableViewController.m
//  StoryboardTest1
//
//  Created by Fabio Bombardi on 27/09/2017.
//  Copyright © 2017 Fabio Bombardi. All rights reserved.
//

#import "LeftMenuTableViewController.h"
#import "Macros.h"

@interface LeftMenuTableViewController ()

@end

@implementation LeftMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"menuTestNavigationSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
#warning "Why?! ...guess what?! I really and actually do not know!"
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11") ) {
        // decomment the line below for the workaround...
        //[segue destinationViewController].modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
}


@end
