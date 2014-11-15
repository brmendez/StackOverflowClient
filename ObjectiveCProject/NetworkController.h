//
//  NetworkController.h
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject

@property (nonatomic, retain) NSString *network;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSURLSession *urlSession;


- (void)fetchQuestions:(NSString *)urlWithSearchTerm searchSelector:(BOOL *)isQuestion completionHandler: (void(^)(NSError *error, NSMutableArray *response))completionHandler;
+ (id)sharedManager;
+ (void)setToken:(NSString *)token;

@end
