//
//  UIViewController+BackButton.h
//  WGManager
//
//  Created by dfhb@rdd on 16/1/28.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BackButton)
/**
 *  添加自定义返回按钮
 */
- (void)addBackButton;
/**
 *  添加点击空白区域收键盘
 */
- (void)addTapGesture;
@end
