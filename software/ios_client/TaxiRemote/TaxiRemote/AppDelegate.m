//
//  AppDelegate.m
//  TaxiRemote
//
//  Created by Mikimoto 莊志鴻 on 12/4/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  
  [self setViewController:[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil]];  
  [[self window] setRootViewController:[self viewController]];
  [[self window] makeKeyAndVisible];
  
  [[UIApplication sharedApplication] setStatusBarHidden:YES];  
  return YES;
}

@end
