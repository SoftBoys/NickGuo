//
//  UILabel+More.h
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (More)
/**
 *  初始化Label
 */
+ (instancetype)label;
/**
 *  初始化Label
 *
 *  @param text 文本
 */
+ (instancetype)labelWithText:(NSString *)text;
/**
 *  初始化Label
 *
 *  @param font 字体大小
 */
+ (instancetype)labelWithFont:(UIFont *)font;
/**
 *  初始化Label
 *
 *  @param text      文本
 *  @param textColor 文本颜色
 */
+ (instancetype)labelWithText:(NSString *)text TextColor:(UIColor *)textColor;
/**
 *  初始化Label
 *
 *  @param text      文本
 *  @param textColor 文本颜色
 *  @param font      字体大小
 */
+ (instancetype)labelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font;
@end
