//
//  UIAlertView+More.m
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "UIAlertView+More.h"
#import <objc/runtime.h>

@implementation UIAlertView (More)

+ (instancetype)showAlertWithTitle:(NSString *)title message:(NSString *)message completionBlock:(ButtonBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle sureButtonTitle:(NSString *)sureButtonTitle
{
    if (cancelButtonTitle == nil&&sureButtonTitle == nil) {
        return nil;
    }
    UIAlertView *alert = [[[self class] alloc] init];
    alert.title = title;
    alert.message = message;
    alert.block = block;
    alert.delegate = alert;
    if (cancelButtonTitle) {
        [alert addButtonWithTitle:cancelButtonTitle];
    }
    if (sureButtonTitle) {
        [alert addButtonWithTitle:sureButtonTitle];
        
    }
    [alert show];
    return alert;
}

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    __weak typeof(self) weakself = self;
    if (self.block) {
        self.block(buttonIndex, weakself);
    }
}
- (void)setBlock:(ButtonBlock)block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (ButtonBlock)block
{
    return objc_getAssociatedObject(self, @selector(block));
}
@end
