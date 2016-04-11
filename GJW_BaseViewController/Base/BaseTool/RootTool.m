//
//  RootTool.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "RootTool.h"
#import "BaseNavViewController.h"
#import "RootTool.h"
#import "GuideViewController.h"
#import "ADViewController.h"
#import "MainTabBarController.h"
#import "MainViewController.h"

@implementation RootTool

+ (void)chooseRootController {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    id isFristOpen = [user objectForKey:@"isFristOpenApp"];
    // 第一次启动
    if (isFristOpen == nil) {
        
        window.rootViewController = [[GuideViewController alloc] init];
        
        [user setObject:@"isFristOpenApp" forKey:@"isFristOpenApp"];
       
    }
    // 加载广告页面
    else {
        ADViewController *adview = [ADViewController adviewWithCompleteBlock:^(UIImage *image) {
            // tabbar
            MainTabBarController *main = [[MainTabBarController alloc] init];
            // ViewController
//            MainViewController *main = [[MainViewController alloc] init];
//            BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:main];
            main.adImage = image;
            window.rootViewController = main;
        }];
        adview.imageName = @"http://img01.bqstatic.com/upload/activity/2016011111271995.jpg";
        window.rootViewController = adview;
    }
}
@end
