//
//  TableViewController.m
//  StoryboardTest1
//
//  Created by Fabio Bombardi on 27/09/2017.
//  Copyright © 2017 Fabio Bombardi. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
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
    return 3;
}

#pragma mark - Navigation

- (IBAction)menuButtonClick:(id)sender {
    //*
    _leftMenuTable = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    UIView *v = _leftMenuTable.view;
    v.frame = [[[IS_SlideMenu_View sharedInstance] menuContainerV] bounds];
    [[[IS_SlideMenu_View sharedInstance] menuContainerV] addSubview:v];
    [v updateConstraintsIfNeeded];
    [[IS_SlideMenu_View sharedInstance] showSlideMenu];
    //*/
}

@end
