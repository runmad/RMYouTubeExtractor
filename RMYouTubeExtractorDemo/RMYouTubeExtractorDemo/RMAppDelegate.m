//
//  RMAppDelegate.m
//  RMYouTubeExtractorDemo
//
//  Created by Rune Madsen on 2014-04-26.
//  Copyright (c) 2014 The App Boutique. All rights reserved.
//

#import "RMAppDelegate.h"
#import "RMYouTubeExtractorDemoTableViewController.h"

@implementation RMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    RMYouTubeExtractorDemoTableViewController *youTubeExtractorDemoTableViewController = [[RMYouTubeExtractorDemoTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:youTubeExtractorDemoTableViewController];
    self.window.rootViewController = navigationController;
    
    return YES;
}

@end
