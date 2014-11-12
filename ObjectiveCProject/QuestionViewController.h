//
//  QuestionViewController.h
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/11/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkController.h"
#import "Questions.h"

@interface QuestionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *questionArray;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end