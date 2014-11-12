//
//  NetworkController.h
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject

@property (nonatomic, strong) NSOperationQueue *imageQueue;
+ (NetworkController *)sharedManager;


- (void)fetchQuestions:(NSString *)searchString completionHandler: (void(^)(NSError *error, NSMutableArray *response))completionHandler;


@end
