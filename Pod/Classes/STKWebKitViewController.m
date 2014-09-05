//
//  STKWebKitViewController.m
//  ***REMOVED***
//
//  Created by stickbook  on 03.09.14.
//  Copyright (c) 2014 ***REMOVED***. All rights reserved.
//

#import "STKWebKitViewController.h"

@interface STKWebKitViewController ()

@property(nonatomic) NSMutableArray *viewConstraints;
@property(nonatomic) UIColor *savedNavigationbarTintColor;
@property(nonatomic) UIColor *savedToolbarTintColor;

@property(nonatomic) NSURL *url;

@property (nonatomic) BOOL toolbarWasHidden;
@end

@implementation STKWebKitViewController

- (instancetype)init
{
    if (self = [self initWithURL:nil]) {
    }
    return self;
}

- (instancetype)initWithAddress:(NSString *)urlString
{
    return [self initWithURL:[NSURL URLWithString:urlString]];
}

- (instancetype)initWithURL:(NSURL *)url
{
    self.url = url;
    if (self = [super init]) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:self.webView];
    }
    return self;}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSAssert(self.navigationController, @"STKWebKitViewController needs to be contained in a UINavigationController. If you are presenting STKWebKitViewController modally, use STKModalWebKitViewController instead.");

    [self.view setNeedsUpdateConstraints];
    self.toolbarWasHidden = self.navigationController.isToolbarHidden;
    [self.navigationController setToolbarHidden:NO animated:YES];
    [self fillToolbar];
    
    self.savedNavigationbarTintColor = self.navigationController.navigationBar.barTintColor;
    self.savedToolbarTintColor = self.navigationController.toolbar.barTintColor;
    
    if (self.toolbarTintColor) {
        self.navigationController.toolbar.barTintColor = self.toolbarTintColor;
        self.navigationController.toolbar.backgroundColor = self.toolbarTintColor;
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
    }
    if (self.navigationBarTintColor) {
        self.navigationController.navigationBar.barTintColor = self.navigationBarTintColor;
    }
    
    [self addObserver:self forKeyPath:@"webView.title" options:NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:@"webView.loading" options:NSKeyValueObservingOptionNew context:NULL];

    if (self.url) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.barTintColor = self.savedNavigationbarTintColor;
    [self.navigationController setToolbarHidden:self.toolbarWasHidden];
    
    [self removeObserver:self forKeyPath:@"webView.title"];
    [self removeObserver:self forKeyPath:@"webView.loading"];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.navigationController.toolbar.barTintColor = self.savedToolbarTintColor;
}

- (void)fillToolbar
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backTapped:)];
    if (self.webView.canGoBack) {
        backItem.tintColor = nil;
    } else {
        backItem.tintColor = [UIColor lightGrayColor];
    }
    
    UIBarButtonItem *forwardItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"forward"] style:UIBarButtonItemStylePlain target:self action:@selector(forwardTapped:)];
    if (self.webView.canGoForward) {
        forwardItem.tintColor = nil;
    } else {
        forwardItem.tintColor = [UIColor lightGrayColor];
    }
    
    UIBarButtonItem *reloadItem;
    if (self.webView.isLoading) {
        reloadItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"stop"] style:UIBarButtonItemStylePlain target:self action:@selector(stopTapped:)];
    } else {
        reloadItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh"] style:UIBarButtonItemStylePlain target:self action:@selector(reloadTapped:)];
    }
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareTapped:)];
    UIBarButtonItem *flexibleSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    [self setToolbarItems:@[flexibleSpaceItem, backItem, flexibleSpaceItem, forwardItem, flexibleSpaceItem, reloadItem, flexibleSpaceItem, shareItem, flexibleSpaceItem] animated:NO];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"webView.title"]) {
        self.title = change[@"new"];
    } else if ([keyPath isEqualToString:@"webView.loading"]) {
        [self fillToolbar];
    }
}

- (void)viewDidLayoutSubviews
{
    self.webView.frame = self.view.bounds;
}

//- (void)updateViewConstraints
//{
//    if (self.viewConstraints) {
//        [self.view removeConstraints:self.viewConstraints];
//    }
//    self.viewConstraints = [NSMutableArray array];
//    
//    [self.view addConstraints:self.viewConstraints];
//    [super updateViewConstraints];
//}

- (void)backTapped:(UIBarButtonItem *)button
{
    [self.webView goBack];
}

- (void)forwardTapped:(UIBarButtonItem *)button
{
    [self.webView goForward];
}

- (void)reloadTapped:(UIBarButtonItem *)button
{
    [self.webView reload];
}

- (void)stopTapped:(UIBarButtonItem *)button
{
    [self.webView stopLoading];
}

- (void)shareTapped:(UIBarButtonItem *)button
{
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:@[self.url, self.title] applicationActivities:self.applicationActivities];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
