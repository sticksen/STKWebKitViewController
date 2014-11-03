# STKWebKitViewController

![Version](https://img.shields.io/cocoapods/v/STKWebKitViewController.svg?style=flat)
![License](https://img.shields.io/cocoapods/l/STKWebKitViewController.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/STKWebKitViewController.svg?style=flat)

![STKWebKitViewController](http://sticki.de/github/STKWebKitViewController/1.png) 
![STKWebKitViewController](http://sticki.de/github/STKWebKitViewController/2.png)

## Description

This project provides a wrapping [`UIViewController`][UIViewController] around Apple´s new [`WKWebView`][WKWebView], available as of iOS8 in [`WebKit`][WebKit]. Also included is a wrapping [`UINavigationController`][UINavigationController] to present the [`WKWebView`][WKWebView] modally.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

To push a [`WKWebView`][WKWebView] onto your [`UINavigationController`][UINavigationController], do:

```objc	
NSURL *url = [NSURL URLWithString:@"https://github.com/sticksen/STKWebKitViewController"];
STKWebKitViewController *controller = [[STKWebKitViewController alloc] initWithURL:url];
[self.navigationController pushViewController:controller animated:YES];
```

To open it modally:

```objective-c
NSURL *url = [NSURL URLWithString:@"https://github.com/sticksen/STKWebKitViewController"];
STKWebKitModalViewController *controller = [[STKWebKitModalViewController alloc] initWithURL:url];
[self presentViewController:controller animated:YES completion:nil];
```

It is possible to change the behaviour how the WKWebView opens links that would trigger a new tab opening on desktop browsers (aka. target=_blank - links).
To change the behaviour, adjust `newTabOpenMode` to your desired choice.

It´s also possible to customize the NavigationBar and Toolbar colors.

To use the new `UINavigationBar` and `UIToolbar` hiding features of iOS8, set your navigationController to:

```objective-c
self.navigationController.hidesBarsOnSwipe = YES;
```

## Requirements

[`WebKit`][WebKit], [`UIKit`][UIKit]

## Installation

STKWebKitViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "STKWebKitViewController"
	
Then include the Header somewhere in your project:

```objc
#import <STKWebKitViewController/STKWebKitViewController.h>
```
		
## Author

Marc, sticki@sticki.de

## License

STKWebKitViewController is available under the MIT license. See the LICENSE file for more info.

[UIKit]: https://developer.apple.com/library/ios/documentation/uikit/reference/uikit_framework/_index.html
[WebKit]: https://developer.apple.com/library/prerelease/ios/documentation/Cocoa/Reference/WebKit/ObjC_classic/
[WKWebView]: https://developer.apple.com/library/prerelease/ios/documentation/WebKit/Reference/WKWebView_Ref/index.html#//apple_ref/occ/cl/WKWebView
[UIViewController]: https://developer.apple.com/library/ios/documentation/uikit/reference/UIViewController_Class/Reference/Reference.html
[UINavigationController]: https://developer.apple.com/library/ios/documentation/uikit/reference/UINavigationController_Class/Reference/Reference.html
