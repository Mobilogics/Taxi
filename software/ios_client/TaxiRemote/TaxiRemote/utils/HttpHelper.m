//
//  HttpHelper.m
//  OSDC2012
//
//  Created by mobilogics on 4/11/12.
//  Copyright (c) 2012 Mobilogics. All rights reserved.
//

#import "HttpHelper.h"

@implementation HttpHelper

- (void)sendRequestWithURL: (NSURL *)aServerURL
         delegate: (id)aDelegate
     doneSelector: (SEL)aDoneSelector
    errorSelector: (SEL)anErrorSelector
{
  delegate = aDelegate;
  doneSelector = aDoneSelector;
  errorSelector = anErrorSelector;
  
  NSURLRequest *request=[NSURLRequest requestWithURL:aServerURL
                                         cachePolicy:NSURLRequestUseProtocolCachePolicy
                                     timeoutInterval:5.0];
  NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  
  if (!connection) {
    [delegate performSelector:anErrorSelector];
  }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  [delegate performSelector:doneSelector];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  [delegate performSelector:errorSelector];
}

@end
