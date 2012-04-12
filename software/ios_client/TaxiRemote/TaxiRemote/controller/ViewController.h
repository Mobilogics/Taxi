//
//  ViewController.h
//  OSDC2012
//
//  Created by mobilogics on 2/22/12.
//  Copyright (c) 2012 Mobilogics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpHelper.h"

@interface ViewController : UIViewController <UIWebViewDelegate> {
  HttpHelper *httpHelper;
}

@property (nonatomic, assign) IBOutlet UIWebView *webView;

- (IBAction)forwardStart:(id)sender;
- (IBAction)forwardStop:(id)sender;

- (IBAction)rightStart:(id)sender;
- (IBAction)rightStop:(id)sender;

- (IBAction)leftStart:(id)sender;
- (IBAction)leftStop:(id)sender;

- (IBAction)fire:(id)sender;

@end
