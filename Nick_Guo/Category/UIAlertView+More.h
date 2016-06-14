//
//  UIAlertView+More.h
//  自定义View
//
//  Created by dfhb@rdd on 16/1/27.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonBlock)(NSInteger buttonIndex, UIAlertView *alertView);

@interface UIAlertView (More)<UIAlertViewDelegate>
/**
 *  初始化AlertView
 *
 *  @param title             标题
 *  @param message           内容
 *  @param block             点击按钮的Block
 *  @param cancelButtonTitle 取消按钮的标题
 *  @param sureButtonTitle   确定按钮的标题
 */
+ (instancetype)showAlertWithTitle:(NSString *)title message:(NSString *)message completionBlock:(ButtonBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle sureButtonTitle:(NSString *)sureButtonTitle;

@property (nonatomic, strong) ButtonBlock block;
@end
