//
//  WebViewController.m
//  ObjectiveCProject
//
//  Created by Brian Mendez on 11/13/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

#import "WebViewController.h"
#import "NetworkController.h"

@interface WebViewController ()

//@property (nonatomic, strong) NSString *clientSecret;
//self.clientSecret = @"AUVaPO*0p*ffbK2SiX4bFQ((";

@end

@implementation WebViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.webView.navigationDelegate = self;
    self.oAuthURL = @"https://stackexchange.com/oauth/dialog";
    self.clientID = @"3858";
    self.oAuthDomain = @"https://stackexchange.com/oauth/login_success";
    
//    self.publicKey = @"oFRiEbtUo24zYBn5mDzC0A((";
    
    
    NSString *loginURL = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@&scope=read_inbox", self.oAuthURL, self.clientID, self.oAuthDomain];
    NSURL *url = [[NSURL alloc] initWithString:loginURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
}

//programmatically instantiates a webview
- (void)loadView {
    
    self.webView = [[WKWebView alloc] init];
    self.view = self.webView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
//annoying code that is always here. hate it.
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {

    decisionHandler(WKNavigationActionPolicyAllow);
    
    //digs down, gets and sets token
    NSString *requestString = [[[navigationAction request] URL] absoluteString];
    if ([requestString containsString:@"access_token"]) {
        NSArray *components = [requestString componentsSeparatedByString:@"="];
        NSArray *tokenComponents = [components[1] componentsSeparatedByString:@"&"];
        NSString *token = tokenComponents [0];
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"oauth_token"];
        [[NetworkController sharedManager] setToken:token];
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}

@end
