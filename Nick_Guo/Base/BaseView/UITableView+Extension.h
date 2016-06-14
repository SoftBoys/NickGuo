//
//  UITableView+Extension.h
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/30.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)
/**
 *  初始化TableView (默认UITableViewStyleGrouped) section间上下有线条，不悬浮
 */
+ (instancetype)tableView;
/**
 *  初始化TableView
 */
+ (instancetype)tableViewWithStyle:(UITableViewStyle)style;
@end
