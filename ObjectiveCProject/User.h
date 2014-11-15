//
//  User.h
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSInteger reputation;

@property (nonatomic, strong) NSString *displayName;

+ (NSMutableArray *)ParseJSONDataIntoUsers: (NSData *)rawJSONData;

@end
