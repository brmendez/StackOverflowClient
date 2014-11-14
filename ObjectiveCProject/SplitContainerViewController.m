//
//  SplitContainerViewController.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/12/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "SplitContainerViewController.h"

@interface SplitContainerViewController ()

@end

@implementation SplitContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISplitViewController *splitVC = self.childViewControllers[0];
    [splitVC setDelegate:self];
}



@end
