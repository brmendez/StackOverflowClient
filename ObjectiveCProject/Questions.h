//
//  Questions.h
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Questions : NSObject

@property (nonatomic, strong) NSString *questionTitle;
@property (nonatomic, strong) NSString *questionBody;

- (instancetype)init: (NSDictionary *)questionDictionary;
+ (NSMutableArray *)ParseJSONDataIntoQuestions: (NSData *)rawJSONData;

@end
