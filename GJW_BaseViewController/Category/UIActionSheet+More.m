//
//  UIActionSheet+More.m
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "UIActionSheet+More.h"
#import <objc/runtime.h>

@interface UIActionSheet ()

@property (nonatomic, strong) ActionSheetBlock block;
@end
@implementation UIActionSheet (More)
- (void)setBlock:(ActionSheetBlock)block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (ActionSheetBlock)block
{
    return objc_getAssociatedObject(self, @selector(block));
}
+ (instancetype)showWithTitle:(NSString *)title completionBlock:(ActionSheetBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles
{
    if (cancelButtonTitle == nil&&otherButtonTitles == nil) {
        return nil;
    }
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    if (window == nil) {
        return nil;
    }
    UIActionSheet *actionSheet = [[[self class] alloc] initWithTitle:title delegate:nil cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil, nil];
    
    for (NSString *title in otherButtonTitles) {
        [actionSheet addButtonWithTitle:title];
    }
    
    actionSheet.block = block;
    
    [actionSheet showInView:window];
    
    return actionSheet;
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    __weak typeof(self) weakself = self;
    if (self.block) {
        self.block(buttonIndex, weakself);
    }
}
@end
