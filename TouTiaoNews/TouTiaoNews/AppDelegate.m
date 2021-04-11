//
//  AppDelegate.m
//  TouTiaoNews
//
//  Created by 梁华建 on 2019/5/29.
//  Copyright © 2019 梁华建. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "MineViewController.h"
#import "RecommendViewController.h"
#import "NetworkManager.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "DemoVideoViewController.h"
#import "VViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NewsViewController *newsViewController = [[NewsViewController alloc] init];
   
    VideoViewController *videoController = [[VideoViewController alloc]init];
    
    RecommendViewController *recommendController = [[RecommendViewController alloc]init];
    
    // 我的界面的设置
    UIViewController *mineViewController = [[UIViewController alloc]init];
    
    mineViewController.view.backgroundColor = [UIColor lightGrayColor];
    mineViewController.tabBarItem.title = @"我的";
    mineViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    mineViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    // 设置 demo video view controller
    DemoVideoViewController *demoVideoViewController = [[DemoVideoViewController alloc] init];
    demoVideoViewController.view.backgroundColor = [UIColor redColor];
    demoVideoViewController.tabBarItem.title = @"DemoV";
    demoVideoViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    demoVideoViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    // 重构后的第二版
    VViewController *vViewController = [[VViewController alloc]init];
    vViewController.tabBarItem.title = @"DemoV";
    vViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    vViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    
    
    // 设置 tabbar controller
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    
    [tabbarController setViewControllers:@[newsViewController,videoController,recommendController,vViewController]];
    
    // 设置 navigation controller
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  
}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
  
}


@end
