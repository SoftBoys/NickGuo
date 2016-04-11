//
//  UIActionSheet+More.h
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionSheetBlock)(NSInteger buttonIndex, UIActionSheet *actionSheet);
@interface UIActionSheet (More)<UIActionSheetDelegate>
/**
 *  初始化ActionSheet
 *
 *  @param title                  标题
 *  @param block                  点击的回调函数
 *  @param cancelButtonTitle      取消按钮标题
 *  @param destructiveButtonTitle 加红按钮的标题
 *  @param otherButtonTitles      其他按钮标题
 */
+ (instancetype)showWithTitle:(NSString *)title completionBlock:(ActionSheetBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles;
@end
