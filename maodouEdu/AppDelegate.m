//
//  AppDelegate.m
//  maodouEdu
//
//  Created by zhukeshuai on 15/9/28.
//  Copyright © 2015年 zks. All rights reserved.
//

#import "AppDelegate.h"
#import "MDYHomeViewController.h"
#import "MDYPersonViewController.h"
#import "MDYDownloadViewController.h"
#import "MDYSideMenuTableViewController.h"
#import <RESideMenu/RESideMenu.h>
#import "UIColor+Util.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.tabBar.translucent = NO;
    tab.tabBar.barTintColor = [UIColor titleBarColor];
    [[UINavigationBar appearance] setBarTintColor:[UIColor navigationbarColor]];
    //改变UITabBarItem 字体颜色
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor titleBarColor],  NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:                                                         [NSDictionary dictionaryWithObjectsAndKeys:[UIColor titleBarColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    MDYHomeViewController *homeVC = [[MDYHomeViewController alloc] init];
    homeVC.view.backgroundColor =[UIColor orangeColor];
    MDYDownloadViewController *downloadVC = [[MDYDownloadViewController alloc] init];
    downloadVC.view.backgroundColor = [UIColor blueColor];
    MDYPersonViewController *persionVC = [[MDYPersonViewController alloc] init];
    
    UINavigationController *homeNav = [self addNavigationItemForViewController:homeVC];
    UINavigationController *downloadNav = [self addNavigationItemForViewController:downloadVC];
    UINavigationController *persionNav = [self addNavigationItemForViewController:persionVC];
    
    UIImage * homeImg = [[UIImage imageNamed:@"tabbar-news"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * homeImgSelected = [[UIImage imageNamed:@"tabbar-news-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:homeImg selectedImage:homeImgSelected];

    
    UIImage *downloadImg = [[UIImage imageNamed:@"tabbar-discover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *downloadImgSelected = [[UIImage imageNamed:@"tabbar-discover-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    downloadNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"下载" image:downloadImg selectedImage:downloadImgSelected];
    
    
    UIImage *persionImg = [[UIImage imageNamed:@"tabbar-me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *persionImgSelected = [[UIImage  imageNamed:@"tabbar-me-selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    persionNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人" image:persionImg selectedImage:persionImgSelected];
    
    tab.viewControllers = @[homeNav,downloadNav,persionNav];
    tab.delegate = self;
    

    /************ 控件外观设置 **************/
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    NSDictionary *navbarTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithHex:0x15A230]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHex:0x15A230]} forState:UIControlStateSelected];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor navigationbarColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor titleBarColor]];
    
    [UISearchBar appearance].tintColor = [UIColor colorWithHex:0x15A230];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setAlpha:0.6];
    

    
    RESideMenu *sideMenuVC = [[RESideMenu alloc] initWithContentViewController:tab leftMenuViewController:[[MDYSideMenuTableViewController alloc] init]  rightMenuViewController:nil];
    sideMenuVC.scaleContentView = YES;
    sideMenuVC.contentViewScaleValue = 0.95;
    sideMenuVC.scaleMenuView = NO;
    sideMenuVC.contentViewShadowEnabled = YES;
    sideMenuVC.contentViewShadowRadius = 4.5;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = sideMenuVC;
    
    
    
    return YES;
}

- (UINavigationController *)addNavigationItemForViewController:(UIViewController *)viewController{
    UINavigationController *nav = [[UINavigationController alloc] init];
    
    nav.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-sidebar"] style:UIBarButtonItemStylePlain target:self action:@selector(onClickMenuButton)];
    nav.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar-search"] style:UIBarButtonItemStylePlain target:self action:@selector(pushSearchViewController)];
    [nav addChildViewController:viewController];
    return nav;
}

- (void)onClickMenuButton{
    NSLog(@"左侧按钮");

}
- (void)pushSearchViewController
{
    NSLog(@"右侧按钮");
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
