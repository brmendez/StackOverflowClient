//
//  NetworkController.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

NSString *londonWeatherUrl = @"http://api.openweathermap.org/data/2.5/weather?q=London,uk";

NSURLSession *session = [NSURLSession sharedSession];
[[session dataTaskWithURL:[NSURL URLWithString:londonWeatherUrl]
        completionHandler:^(NSData *data, NSURLResponse *response,
                            NSError *error) {
            // handle response
        }] resume];

@end
