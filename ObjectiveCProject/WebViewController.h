//
//  WebViewController.h
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/13/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebViewController : UIViewController <WKNavigationDelegate>;

@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSString *oAuthDomain;
@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *oAuthURL;

@property (nonatomic, strong) WKWebView *webView;

@end
