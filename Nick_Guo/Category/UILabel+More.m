//
//  UILabel+More.m
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "UILabel+More.h"

@implementation UILabel (More)
+ (instancetype)label
{
    return [self labelWithText:nil];
}
+ (instancetype)labelWithFont:(UIFont *)font
{
    return [self labelWithText:nil TextColor:nil Font:font];
}
+ (instancetype)labelWithText:(NSString *)text
{
    return [self labelWithText:text TextColor:nil Font:nil];
}
+ (instancetype)labelWithText:(NSString *)text TextColor:(UIColor *)textColor
{
    return [self labelWithText:text TextColor:textColor Font:nil];
}
+ (instancetype)labelWithText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font
{
    UILabel *label = [[[self class] alloc] init];
    
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    return label;
}
@end
