//
//  AppDelegate.m
//  清楚缓存
//
//  Created by 高国辉 on 16/4/7.
//  Copyright © 2016年 🈳♌️♻️➤🎄一直在努力. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TwoViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *vc=[[ViewController alloc]init];
    UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:vc];
    UITabBarItem *item=[[UITabBarItem alloc]initWithTitle:@"第一个" image:[UIImage imageNamed:@"333"] selectedImage:nil];
   
    nvc.tabBarItem = item;
    TwoViewController *vc1=[[TwoViewController alloc]init];
    UINavigationController *nvc1=[[UINavigationController alloc]initWithRootViewController:vc1];
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:@"第二个" image:[UIImage imageNamed:@"333"]  selectedImage:nil];
    nvc1.tabBarItem = item1;

    UITabBarController *tab=[[UITabBarController alloc]init];
    tab.viewControllers =@[nvc,nvc1];
    self.window.rootViewController = tab;
        // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
