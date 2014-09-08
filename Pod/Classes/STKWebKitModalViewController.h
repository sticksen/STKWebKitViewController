//
//  STKWebKitViewController.h
//  ***REMOVED***
//
//  Created by stickbook  on 03.09.14.
//  Copyright (c) 2014 ***REMOVED***. All rights reserved.
//
#import <WebKit/WebKit.h>
@class STKWebKitViewController;

@interface STKWebKitModalViewController : UINavigationController

- (instancetype)initWithURL:(NSURL *)url;
- (instancetype)initWithURL:(NSURL *)url userScript:(WKUserScript *)script;
- (instancetype)initWithAddress:(NSString *)urlString;
- (instancetype)initWithAddress:(NSString *)string userScript:(WKUserScript *)script;
- (instancetype)initWithRequest:(NSURLRequest *)request;
- (instancetype)initWithRequest:(NSURLRequest *)request userScript:(WKUserScript *)script NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) STKWebKitViewController *webKitViewController;
- (instancetype)initWithCustomWebKitControllerClass:(Class)pClass address:(NSString *)address;

@end
