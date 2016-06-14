//
//  UIDevice+Extension.h
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extension)
/**
 *  获取设备大小（3.5  4  4.7  5.5）
 */
+ (CGFloat)currentDeviceScreenMeasurement;
@end
