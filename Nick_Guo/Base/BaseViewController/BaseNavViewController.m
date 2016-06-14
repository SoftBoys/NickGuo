//
//  BaseNavViewController.m
//  WGManager
//
//  Created by dfhb@rdd on 16/1/28.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "BaseNavViewController.h"
#import "UIColor+More.h"

@implementation BaseNavViewController
+ (void)initialize
{
    //设置全局UINavigationBar
    if (self == [super class]) {
        // 1.取出
        UINavigationBar *navBar = [UINavigationBar appearance];
        
        // 2.设置title属性
        navBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
        //        navBar.titleTextAttributes = @{NSForegroundColorAttributeName:Color_NavTitle,NSFontAttributeName:[UIFont systemFontOfSize:18]};
        
        [navBar setTranslucent:YES];
        
//        navBar.barTintColor = [UIColor whiteColor];
    }
    
}
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    return self;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count == 1)//关闭主界面的右滑返回
    {
        return NO;
    }
    else
    {
        return YES;
    }
}
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if (!self.interactivePopGestureRecognizer.enabled) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
