//
//  RootTableViewController.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/16/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "RootTableViewController.h"

@interface RootTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionsLabel;
@property (strong, nonatomic) IBOutlet UILabel *usersLabel;
//@property (strong, nonatomic) IBOutlet UIButton *oAuthLabel;
@property (weak, nonatomic) IBOutlet UIButton *oAuthLabel;


@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questionsLabel.text = NSLocalizedString(@"Question Search", @"Search for questions in database");
    self.usersLabel.text = NSLocalizedString(@"User Search", @"Search for user in database");
    [self.oAuthLabel setTitle:NSLocalizedString(@"OAuth 2.0", @"OAuth Certification") forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
