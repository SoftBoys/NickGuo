//
//  UIColor+More.m
//  自定义View
//
//  Created by dfhb@rdd on 16/3/17.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "UIColor+More.h"

@implementation UIColor (More)
+ (UIColor *)red:(float)red green:(float)green blue:(float)blue
{
    return [self red:red green:green blue:blue alpha:1];
}
+ (UIColor *)red:(float)red green:(float)green blue:(float)blue alpha:(float)alpha
{
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
    return color;
}

#pragma mark 根据十六进制颜色值返回UIColor
+ (UIColor *)convertHexColorToUIColor:(NSString *)inColorString
{
    NSString *cString = [[inColorString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
    
}
@end
