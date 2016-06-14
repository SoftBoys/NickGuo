//
//  BaseTextView.h
//  自定义View
//
//  Created by dfhb@rdd on 15/11/12.
//  Copyright © 2015年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTextView : UITextView
/**
 *  提示文字
 */
@property (nonatomic, copy) NSString *placeholder;
/**
 *  提示文字的颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end
