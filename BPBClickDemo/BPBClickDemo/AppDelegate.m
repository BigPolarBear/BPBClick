//
//  AppDelegate.m
//  BPBClickDemo
//
//  Created by BigPolarBear on 13-10-15.
//  Copyright (c) 2013年 bigpolarbear.com. All rights reserved.
//

#import "AppDelegate.h"
#import "BPBClick.h"

#import "BPBClickServiceUmeng.h"
#import "BPBClickServiceTalkingData.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 1. 创建需要的统计服务
    id<IBPBClickService> serviceUmeng = [[BPBClickServiceUmeng alloc] initWithAppKey:@"525d62a956240b4bce01789c"];
    id<IBPBClickService> serviceTalkingData = [[BPBClickServiceTalkingData alloc] initWithAppKey:@"B083E38FCCA43F368148464F2CEFE91E"];

    // 2. 添加统计服务到BPBClick
    [BPBClick addClickService:serviceUmeng];
    [BPBClick addClickService:serviceTalkingData];
    // 3. 设置渠道
#ifdef DEBUG
    [BPBClick setChannelId:@"Debug"];
#else
    [BPBClick setChannelId:@"App Store"];
#endif
    // 4. 启动服务
    [BPBClick start];

    // Override point for customization after application launch.
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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
