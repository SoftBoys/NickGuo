//
//  UIButton+More.h
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (More)
/**
 *  初始化Button
 *
 *  @param title 标题
 */
+ (instancetype)buttonWithTitle:(NSString *)title;
/**
 *  初始化Button
 *
 *  @param title 标题
 *  @param image 图片
 */
+ (instancetype)buttonWithTitle:(NSString *)title Image:(UIImage *)image;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIImage *image;
@end
