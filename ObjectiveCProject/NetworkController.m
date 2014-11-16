//
//  NetworkController.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "NetworkController.h"
#import "Questions.h"
#import "User.h"

@interface NetworkController()

@property(nonatomic, strong) NSURLSession *URLSession;

@end

@implementation NetworkController

+ (NetworkController *)sharedManager {
    static NetworkController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init {
    if (self.urlSession == nil) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.urlSession = [NSURLSession sessionWithConfiguration:configuration];
        NSString *authToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"oauth_token"];
        if (authToken) {
            self.token = authToken;
            NSLog(@"Token: %@", authToken);
        }
    }
    return self;
}

+ (void)setToken:(NSString *)token {
    [[self sharedManager] setToken:token];
}

- (void)fetchQuestions:(NSString *)searchTerm searchSelector:(BOOL *)isQuestion completionHandler: (void(^)(NSError *error, NSMutableArray *response))completionHandler {
    NSString *urlWithSearchTerm = [[NSString alloc] init];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.URLSession = [NSURLSession sessionWithConfiguration:configuration];
//    need URL, pass URL in to session dataTask, gets data, put data into parse
    if (isQuestion) {
        urlWithSearchTerm = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=%@&site=stackoverflow", searchTerm];
    } else {
        urlWithSearchTerm = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/users?order=desc&sort=reputation&inname=%@&site=stackoverflow", searchTerm];    }
    
    NSURL *url = [[NSURL alloc] initWithString:urlWithSearchTerm];
    
    NSString *authKey = [[NSUserDefaults standardUserDefaults] valueForKey:@"oauth_token"];
    if (authKey) {
        [url URLByAppendingPathComponent:authKey];
    }

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *dataTask = [self.URLSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            if ([response isKindOfClass: [NSHTTPURLResponse class]]) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;
            NSInteger statusCode = [httpResponse statusCode];
            
            if (statusCode >= 200 && statusCode <= 299) {
                if (isQuestion) {
                    NSMutableArray *questions = [Questions ParseJSONDataIntoQuestions:data];
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{completionHandler(nil,questions);
                    }];
                } else {
                NSMutableArray *users = [User ParseJSONDataIntoUsers:data];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{completionHandler(nil,users);
                }];
                }
            } else if (statusCode >= 400 && statusCode <= 499) {
                NSLog(@"Error! Status code is: %lu", statusCode);
                NSLog(@"This is the clients fault");
            } else if (statusCode >= 500 && statusCode <= 599) {
                NSLog(@"Error! Status code is: %lu", statusCode);
                NSLog(@"This is the server's fault");
            } else {
                NSLog(@"Error! Status code is: %lu", statusCode);
                NSLog(@"Bad Response");
            }
        }
        }
    }];
    [dataTask resume];
    }

@end