//
//  SecondViewTableViewController.m
//  StoryboardTest1
//
//  Created by Fabio Bombardi on 28/09/2017.
//  Copyright © 2017 Fabio Bombardi. All rights reserved.
//

#import "SecondViewTableViewController.h"

@interface SecondViewTableViewController ()

@end

@implementation SecondViewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.navigationController == nil) {
        UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
        [self.view addSubview:myNav];
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                       style:UIBarButtonItemStyleDone
                                                                      target:self
                                                                      action:nil];
        
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                     style:UIBarButtonItemStyleDone
                                                                    target:self action:@selector(dissmissModal:)];
        
        
        UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Navigation Title"];
        navigItem.rightBarButtonItem = doneItem;
        navigItem.leftBarButtonItem = cancelItem;
        [navigItem setLeftItemsSupplementBackButton: YES];
        myNav.items = [NSArray arrayWithObjects: navigItem,nil];
        
        [UIBarButtonItem appearance].tintColor = [UIColor blueColor];    }
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
    return 3;
}

-(void)dissmissModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@: %ld", NSStringFromClass(self.class), indexPath.row);
}

@end
