//
//  BaseTabbarController.m
//  WGManager
//
//  Created by dfhb@rdd on 16/3/10.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavViewController.h"


@interface BaseTabBarController ()
@property (nonatomic, strong) UIViewController *message;
@property (nonatomic, strong) UIViewController *manage;
@property (nonatomic, strong) UIViewController *mine;
@end
@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}


- (void)setChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    // 1.设置控制器的标题
    childVC.title = title;
    // 设置图标
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    childVC.tabBarItem.title = title;
    
    // 2.包装一个导航控制器
    BaseNavViewController *nav = [[BaseNavViewController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

@end
