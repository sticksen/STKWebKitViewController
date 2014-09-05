//
//  STKWebKitViewController.m
//  FOCUS
//
//  Created by stickbook  on 03.09.14.
//  Copyright (c) 2014 Finanzen100 GmbH. All rights reserved.
//

#import "STKWebKitModalViewController.h"
#import "STKWebKitViewController.h"

@interface STKWebKitModalViewController ()


@end

@implementation STKWebKitModalViewController

- (instancetype)init
{
    if (self = [self initWithURL:nil]) {
    }
    return self;
}

- (instancetype)initWithAddress:(NSString *)urlString
{
    if (self = [self initWithURL:[NSURL URLWithString:urlString]]) {
    }
    return self;
}

- (instancetype)initWithURL:(NSURL *)url
{
    return [self initWithURL:url userScript:nil];
}

- (instancetype)initWithAddress:(NSString *)string userScript:(WKUserScript *)script
{
    return [self initWithURL:[NSURL URLWithString:string] userScript:script];
}

- (instancetype)initWithURL:(NSURL *)url userScript:(WKUserScript *)script
{
    _webKitViewController = [[STKWebKitViewController alloc] initWithURL:url userScript:script];
    if (self = [super initWithRootViewController:self.webKitViewController]) {
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.webKitViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeController)];
}


- (void)closeController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
