//
//  UISegmentedControl+More.h
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SegmentClickBlock)(NSInteger selectedIndex, UISegmentedControl *segment);

@interface UISegmentedControl (More)
/**
 *  初始化Segment
 *
 *  @param items             标题数组
 *  @param textColorNotmal   标题颜色(默认)
 *  @param textColorSelected 标题颜色(选中)
 */
+ (instancetype)segmentWithItems:(NSArray *)items
                 textColorNotmal:(UIColor *)textColorNotmal
               textColorSelected:(UIColor *)textColorSelected;
/**
 *  初始化Segment
 *
 *  @param items             标题数组
 *  @param textColorNotmal   标题颜色(默认)
 *  @param textColorSelected 标题颜色(选中)
 *  @param block             点击的回调方法
 */
+ (instancetype)segmentWithItems:(NSArray *)items
                 textColorNotmal:(UIColor *)textColorNotmal
               textColorSelected:(UIColor *)textColorSelected
                 completionBlock:(SegmentClickBlock)block;

/**
 *  设置字体大小
 */
@property (nonatomic, strong) UIFont *font;
@end
