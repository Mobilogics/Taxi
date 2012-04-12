//
//  ViewController.m
//  OSDC2012
//
//  Created by mobilogics on 2/22/12.
//  Copyright (c) 2012 Mobilogics. All rights reserved.
//

#import "ViewController.h"

#define URL @"http://192.168.88.166:8080/?action="

@interface ViewController()
- (void)sendRequest:(NSURL *)url;
- (void)httpFinished;
- (void)httpFailed;
- (void)loadWebPage;
@end

@implementation ViewController

@synthesize webView = _webView;

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad{
  [super viewDidLoad];
  [self loadWebPage];
}

- (void)viewDidUnload {
  [self setWebView:nil];
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationLandscapeRight) ? YES : NO;
}

#pragma mark - private

- (void)sendRequest:(NSURL *)url {
  if (!httpHelper) {
    httpHelper = [[HttpHelper alloc] init];
  }
  
  [httpHelper sendRequestWithURL:url delegate:self doneSelector:@selector(httpFinished) errorSelector:@selector(httpFailed)];
}

- (void)httpFinished {
  httpHelper = nil;
}

- (void)httpFailed {
  httpHelper = nil;
}

- (void)loadWebPage {
  NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@stream", URL]];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[self.webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
 	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - action

- (IBAction)forwardStart:(id)sender {
  [self sendRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@forward_on", URL]]];
}

- (IBAction)forwardStop:(id)sender {
  [self sendRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@forward_off", URL]]];
}

- (IBAction)rightStart:(id)sender {  
  [self sendRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@right_on", URL]]];
}

- (IBAction)rightStop:(id)sender {
  [self sendRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@right_off", URL]]];
}

- (IBAction)leftStart:(id)sender {  
  [self sendRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@left_on", URL]]];
}

- (IBAction)leftStop:(id)sender {
  [self sendRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@left_off", URL]]];
}

- (IBAction)fire:(id)sender {
  [self sendRequest:[NSURL URLWithString:[NSString stringWithFormat:@"%@fire", URL]]];
}

@end
