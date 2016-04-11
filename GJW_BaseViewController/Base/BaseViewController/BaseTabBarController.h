//
//  BaseTabbarController.h
//  WGManager
//
//  Created by dfhb@rdd on 16/3/10.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController
/**
 *  设置ChildViewControllers
 *
 *  @param childVC           子视图控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中图标
 */
- (void)setChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end
