//
//  UsersViewController.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/14/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "UsersViewController.h"
#import "User.h"
#import "NetworkController.h"

@interface UsersViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation UsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = NSLocalizedString(@"Enter Search Here", @"Search database here");

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    User *selectedUser = self.userArray[indexPath.row];
    cell.textLabel.text = selectedUser.displayName;
    
    return cell;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [[NetworkController sharedManager] fetchQuestions:self.searchBar.text searchSelector:false completionHandler:^(NSError *error, NSMutableArray *response) {
        self.userArray = response;
        [self.tableView reloadData];
    }];
}


@end