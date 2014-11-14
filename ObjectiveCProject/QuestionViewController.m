//
//  QuestionViewController.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/11/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "QuestionViewController.h"
#import "Questions.h"
#import "NetworkController.h"
@interface QuestionViewController ()

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.searchBar.delegate = self;

    self.searchBar.placeholder = @"Enter Search Here";
    
//    [[NetworkController sharedManager] fetchQuestions:self.searchBar.text completionHandler:^(NSError *error, NSMutableArray *response) {
//        
//        self.questionArray = response;
//       
//        [self.tableView reloadData];
//    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return self.questionArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    
    Questions *selectedQuestion = self.questionArray[indexPath.row];
    
    cell.textLabel.text = selectedQuestion.questionTitle;
    
    return cell;
}

- (void) searchBarButtonClicked : (UISearchBar *)searchBar {
    [[NetworkController sharedManager] fetchQuestions:self.searchBar.text completionHandler:^(NSError *error, NSMutableArray *response) {

        self.questionArray = response;
        [self.tableView reloadData];
    }];
}

@end