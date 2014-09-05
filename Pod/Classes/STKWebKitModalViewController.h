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

- (instancetype)initWithAddress:(NSString *)urlString;
- (instancetype)initWithURL:(NSURL *)url NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) STKWebKitViewController *webKitViewController;

@end
