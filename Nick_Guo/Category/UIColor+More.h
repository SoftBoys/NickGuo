//
//  UIColor+More.h
//  自定义View
//
//  Created by dfhb@rdd on 16/3/17.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (More)
+ (UIColor *)red:(float)red green:(float)green blue:(float)blue;

+ (UIColor *)red:(float)red green:(float)green blue:(float)blue alpha:(float)alpha;
/**
 *  根据十六进制颜色值返回UIColor。
 *  @param  hexColor:十六进制颜色值。
 *  return  UIColor。
 */
+ (UIColor *)convertHexColorToUIColor:(NSString *)inColorString;
@end
