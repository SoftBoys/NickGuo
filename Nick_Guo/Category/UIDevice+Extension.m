//
//  UIDevice+Extension.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "UIDevice+Extension.h"

@implementation UIDevice (Extension)

+ (CGFloat)currentDeviceScreenMeasurement {
    CGFloat deviceScreen = 3.5;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    if ((width == 320&&height == 568)) {
        deviceScreen = 4;
    } else if ((width == 375&&height == 667)) {
        deviceScreen = 4.7;
    } else {
        deviceScreen = 5.5;
    }
    
    return deviceScreen;
}
@end
