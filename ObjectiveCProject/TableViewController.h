//
//  TableViewController.h
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/11/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) NSArray *people;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end
