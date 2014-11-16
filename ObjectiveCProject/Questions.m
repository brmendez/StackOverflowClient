//
//  Questions.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "Questions.h"

@implementation Questions

- (instancetype)init: (NSDictionary *)questionDictionary {
    self = [super init];
    if (self) {
        self.questionTitle = questionDictionary[@"title"];
        self.questionBody = questionDictionary[@"body"];
    }
    return self;
}

//takes JSONData and returns it for NSMutableArray
+ (NSMutableArray *)ParseJSONDataIntoQuestions: (NSData *)rawJSONData {
    
    NSError *error = nil;
    NSDictionary *searchJSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options:0 error: &error];
        NSMutableArray *questions = [[NSMutableArray alloc] init];
    for (NSDictionary *questionsDictionary in searchJSONDictionary[@"items"]) {
        Questions *questionsObject = [[Questions alloc] init: questionsDictionary];
        [questions addObject:questionsObject];
    }
    
    return questions;

};

@end