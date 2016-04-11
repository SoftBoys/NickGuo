//
//  UISegmentedControl+More.m
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "UISegmentedControl+More.h"
#import <objc/runtime.h>

@interface UISegmentedControl ()
@property (nonatomic, strong) SegmentClickBlock block;
@property (nonatomic, strong) NSMutableDictionary *attributesNormal;
@property (nonatomic, strong) NSMutableDictionary *attributesSelected;
@end
@implementation UISegmentedControl (More)
- (NSMutableDictionary *)attributesNormal
{
    return objc_getAssociatedObject(self, @selector(attributesNormal));
}
- (void)setAttributesNormal:(NSMutableDictionary *)attributesNormal
{
    objc_setAssociatedObject(self, @selector(attributesNormal), attributesNormal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSMutableDictionary *)attributesSelected
{
    return objc_getAssociatedObject(self, @selector(attributesSelected));
}
- (void)setAttributesSelected:(NSMutableDictionary *)attributesSelected
{
    objc_setAssociatedObject(self, @selector(attributesSelected), attributesSelected, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setBlock:(SegmentClickBlock)block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (SegmentClickBlock)block
{
    return objc_getAssociatedObject(self, @selector(block));
}
+ (instancetype)segmentWithItems:(NSArray *)items textColorNotmal:(UIColor *)textColorNotmal textColorSelected:(UIColor *)textColorSelected
{
    return [self segmentWithItems:items textColorNotmal:textColorNotmal textColorSelected:textColorSelected completionBlock:nil];
}
+ (instancetype)segmentWithItems:(NSArray *)items textColorNotmal:(UIColor *)textColorNotmal textColorSelected:(UIColor *)textColorSelected completionBlock:(SegmentClickBlock)block
{
    if (items == nil) {
        return nil;
    }
    UISegmentedControl *segment = [[[self class] alloc] initWithItems:items];
    segment.attributesNormal = [NSMutableDictionary dictionary];
    segment.attributesSelected = [NSMutableDictionary dictionary];
    segment.attributesNormal[NSForegroundColorAttributeName] = textColorNotmal;
    segment.attributesSelected[NSForegroundColorAttributeName] = textColorSelected;
    segment.font = [UIFont systemFontOfSize:16];
    segment.selectedSegmentIndex = 0;
    segment.block = block;
    [segment addTarget:segment action:@selector(segmentClick) forControlEvents:UIControlEventValueChanged];
    return segment;
}
- (void)segmentClick
{
    __weak typeof(self) weakself = self;
    if (self.block) {
        self.block(weakself.selectedSegmentIndex, weakself);
    }
}
#pragma mark 设置字体
- (void)setFont:(UIFont *)font
{
    objc_setAssociatedObject(self, @selector(font), font, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addAttributeWithFont:font];
}
- (void)addAttributeWithFont:(UIFont *)font
{
    self.attributesNormal[NSFontAttributeName] = font;
    self.attributesSelected[NSFontAttributeName] = font;
    [self setTitleTextAttributes:self.attributesNormal forState:UIControlStateNormal];
    [self setTitleTextAttributes:self.attributesSelected forState:UIControlStateSelected];
}
@end
