//
//  AppDelegate.m
//  P2PQuizzer
//
//  Created by Udit Salwan on 27/04/14.
//  Copyright (c) 2014 NTEG. All rights reserved.
//

#import "AppDelegate.h"
#import "AppShared.h"
#import "MPCHandler.h"
#import "AppShared.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [AppShared sharedInstance].mpcHandler = [[MPCHandler alloc] init];
    NSString *data = @"This is some dummy data.";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fullPathToFile = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"demofile.squiz"];
    [data writeToFile:fullPathToFile atomically:NO encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"full path::%@",fullPathToFile);

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
//    [self saveContext];
}



@end
