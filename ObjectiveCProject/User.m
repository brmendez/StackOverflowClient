//
//  User.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/10/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "User.h"
#import "ViewController.h"

@interface User () 


@property (nonatomic, strong) NSArray *JSONArray;

@end

@implementation User

- (id)initWithUser:(NSString *)userId_ displayName:(NSString *)displayName_ profileName:(NSString *)profileName_ reputation:(NSInteger *)reputation_
{
    self = [super init];
    if (self) {
        self.userId = userId_;
        self.displayName = displayName_;
        self.profileImage = profileName_;
        self.reputation = reputation_;
        
    }
    return self;
}

- (void)parseJSONDataIntoUsers:(NSData*)rawJSONData
{
    NSError *error = nil;
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:rawJSONData options:NSJSONReadingAllowFragments error:&error];
    
    if (!error) {
        
        NSLog(@"json data = %@", jsonDict);
        
        self.JSONArray = [NSArray arrayWithArray:jsonDict[@"user_id"]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }
}

@end

///////////////////////////////////////////////////////////////////////

//+ (NSArray *) parseJSONDataIntoUsers:(NSData *)rawJSONData {
//    return
//}





//class func parseJSONDataIntoUser(rawJSONData : NSData) -> [User]? {
//    var error : NSError?
//    
//    var userArray = [User]()
//    
//    if let JSONDictionary = NSJSONSerialization.JSONObjectWithData(rawJSONData, options: nil, error: &error) as? NSDictionary {
//        
//        if let itemsArray = JSONDictionary["items"] as? NSArray {
//            
//            for objectInArray in itemsArray {
//                if let userDictionary = objectInArray as? NSDictionary {
//                    
//                    var userName = objectInArray["login"] as String
//                    var userImage = objectInArray["avatar_url"] as String
//                    
//                    var newUserObject = User(name: userName, imageURL: userImage)
//                    userArray.append(newUserObject)
//                }
//            }
//        }
//        return userArray
//    }
//    return nil
//    }
