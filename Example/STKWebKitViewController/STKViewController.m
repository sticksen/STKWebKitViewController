//
//  STKViewController.m
//  STKWebKitViewController
//
//  Created by Marc on 09/04/2014.
//  Copyright (c) 2014 Marc. All rights reserved.
//

#import "STKViewController.h"
#import <STKWebKitViewController/STKWebKitViewController.h>

@interface STKViewController ()

@end

@implementation STKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openModally:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"https://github.com/sticksen/STKWebKitViewController"];
    STKWebKitModalViewController *controller = [[STKWebKitModalViewController alloc] initWithURL:url];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)pushOnNavController:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"https://github.com/sticksen/STKWebKitViewController"];
    STKWebKitViewController *controller = [[STKWebKitViewController alloc] initWithURL:url];
    self.navigationController.hidesBarsOnSwipe = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)openWithCustomColors:(UIButton *)sender {
    NSURL *url = [NSURL URLWithString:@"https://github.com/sticksen/STKWebKitViewController"];
    STKWebKitModalViewController *controller = [[STKWebKitModalViewController alloc] initWithURL:url];
    controller.webKitViewController.navigationBarTintColor = [UIColor brownColor];
    controller.webKitViewController.toolbarTintColor = [UIColor brownColor];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
