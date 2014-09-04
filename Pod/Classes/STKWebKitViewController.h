//
//  STKWebKitViewController.h
//  FOCUS
//
//  Created by stickbook  on 03.09.14.
//  Copyright (c) 2014 Finanzen100 GmbH. All rights reserved.
//
#import <WebKit/WebKit.h>

@interface STKWebKitViewController : UIViewController

@property(nonatomic) WKWebView *webView;
@property(nonatomic) UIColor *toolbarTintColor;
@property(nonatomic) UIColor *navigationBarTintColor;

@end
