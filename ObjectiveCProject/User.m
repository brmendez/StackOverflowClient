//
//  User.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "User.h"

@interface User () 
//properties are put here in the interface

@property (nonatomic, strong) NSArray *userObjects;

@end

@implementation User


-(id)initUser: (NSDictionary *) user{
    
    if (self = [super init]) {
        self.displayName = user[@"display_name"];
    }
    return self;
}


+(NSMutableArray*) ParseJSONDataIntoUsers:(NSData *)rawJSONData {
    NSMutableArray *usersArray = [[NSMutableArray alloc] init];
    //needed to create this property for NSJSONSerialization
    NSError *error;
    
    NSDictionary *JSONDictionary;
    NSArray *JSONArray;
    
    JSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options:NSJSONReadingMutableContainers error:&error];

    JSONArray = (NSArray *)JSONDictionary[@"items"];
    for (NSDictionary *items in JSONArray) {
        User *newUser = [[User alloc] initUser:items];
        [usersArray addObject:(newUser)];
    }
    return usersArray;
}



@end