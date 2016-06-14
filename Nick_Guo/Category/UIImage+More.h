//
//  UIImage+More.h
//  自定义View
//
//  Created by dfhb@rdd on 16/3/17.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (More)
/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
/**
 *  设置图片的圆角（提高性能）
 *
 *  @param radius 圆角弧度
 */
- (UIImage *)imageWithCornerRadius:(CGFloat)radius;
@end
