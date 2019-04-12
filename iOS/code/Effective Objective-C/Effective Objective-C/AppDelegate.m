//
//  AppDelegate.m
//  Effective Objective-C
//
//  Created by wtw on 2018/1/30.
//  Copyright © 2018年 rocedar. All rights reserved.
//

#import "AppDelegate.h"
#import "FHHFPSIndicator.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[FHHFPSIndicator sharedFPSIndicator] show];
    
    NSLog(@"======= %s ========",__func__);
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"======= %s ========",__func__);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"======= %s ========",__func__);

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"======= %s ========",__func__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"======= %s ========",__func__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"======= %s ========",__func__);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"======= %s ========",__func__);
}


@end
