//
//  STKWebKitViewController.h
//  ***REMOVED***
//
//  Created by stickbook  on 03.09.14.
//  Copyright (c) 2014 ***REMOVED***. All rights reserved.
//
#import <WebKit/WebKit.h>
#import "STKWebKitModalViewController.h"

#ifndef __IPHONE_8_0
#warning "This project uses features only available in iOS SDK 8.0 and later."
#endif

@interface STKWebKitViewController : UIViewController

- (instancetype)initWithAddress:(NSString *)urlString;
- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

@property(nonatomic, readonly) WKWebView *webView;
@property(nonatomic) UIColor *toolbarTintColor;
@property(nonatomic) UIColor *navigationBarTintColor;

/** use this to customize the UIActivityViewController (aka Sharing-Dialog) */
@property (nonatomic) NSArray *applicationActivities;
@end
