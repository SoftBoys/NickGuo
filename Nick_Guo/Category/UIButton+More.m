//
//  UIButton+More.m
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "UIButton+More.h"
#import <objc/runtime.h>

@implementation UIButton (More)
+ (instancetype)buttonWithTitle:(NSString *)title
{
    return [self buttonWithTitle:title Image:nil];
}
+ (instancetype)buttonWithTitle:(NSString *)title Image:(UIImage *)image
{
    UIButton *button = [[self class] buttonWithType:UIButtonTypeCustom];
    
    button.title = title;
    button.image = image;
    return button;
}
- (void)setTitle:(NSString *)title
{
    objc_setAssociatedObject(self, @selector(title), title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTitle:title forState:UIControlStateNormal];
}
- (NSString *)title
{
    return objc_getAssociatedObject(self, @selector(title));
}
- (void)setImage:(UIImage *)image
{
    objc_setAssociatedObject(self, @selector(image), image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setImage:image forState:UIControlStateNormal];
}
- (UIImage *)image
{
    return objc_getAssociatedObject(self, @selector(image));
}
@end
