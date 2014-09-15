//
//  STKWebKitViewController.h
//  STKWebKitViewController
//
//  Created by Marc on 03.09.14.
//  Copyright (c) 2014 sticksen. All rights reserved.
//
#import <WebKit/WebKit.h>
#import "STKWebKitModalViewController.h"

#ifndef __IPHONE_8_0
#warning "This project uses features only available in iOS SDK 8.0 and later."
#endif

@interface STKWebKitViewController : UIViewController <WKNavigationDelegate>

- (instancetype)initWithURL:(NSURL *)url;
- (instancetype)initWithURL:(NSURL *)url userScript:(WKUserScript *)script;

- (instancetype)initWithAddress:(NSString *)urlString;
- (instancetype)initWithAddress:(NSString *)string userScript:(WKUserScript *)script;

- (instancetype)initWithRequest:(NSURLRequest *)request;
- (instancetype)initWithRequest:(NSURLRequest *)request userScript:(WKUserScript *)script NS_DESIGNATED_INITIALIZER;

@property(nonatomic, readonly) WKWebView *webView;

@property(nonatomic) UIColor *toolbarTintColor;
@property(nonatomic) UIColor *navigationBarTintColor;

/** use this to customize the UIActivityViewController (aka Sharing-Dialog) */
@property (nonatomic) NSArray *applicationActivities;
@end
