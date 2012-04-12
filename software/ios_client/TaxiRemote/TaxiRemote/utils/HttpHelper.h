//
//  HttpHelper.h
//  OSDC2012
//
//  Created by mobilogics on 4/11/12.
//  Copyright (c) 2012 Mobilogics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpHelper : NSObject {
  id delegate;
  SEL doneSelector;
  SEL errorSelector;
}

- (void)sendRequestWithURL: (NSURL *)aServerURL
         delegate: (id)aDelegate
     doneSelector: (SEL)aDoneSelector
    errorSelector: (SEL)anErrorSelector;

@end
