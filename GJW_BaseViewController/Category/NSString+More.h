//
//  NSString+More.h
//  自定义View
//
//  Created by dfhb@rdd on 16/3/17.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (More)
/**
 *  md5加密
 */
- (NSString *)md5;
/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
/**
 *  返回字符串所占用的尺寸
 *
 *  @param font    字体
 *  @param maxSize 最大尺寸
 *  @param space   字体之间的间距
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize Space:(float)space;


/**
 *  是否为手机号
 */
- (BOOL)isPhone;
/**
 *  是否为身份证号码
 */
- (BOOL)isIdentify;
/**
 *  是否为邮箱
 */
- (BOOL)isEmail;
/**
 *  最多有两位小数
 */
- (BOOL)isPayPrice;

/**
 *  获取图片的Url
 */
- (NSURL *)imageUrl;
@end
