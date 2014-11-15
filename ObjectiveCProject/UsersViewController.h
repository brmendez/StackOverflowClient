//
//  UsersViewController.h
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/14/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>



@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *userArray;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;


@end