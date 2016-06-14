//
//  BaseTableViewCell.h
//  WGManager
//
//  Created by dfhb@rdd on 16/1/28.
//  Copyright © 2016年 GW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCell+Extension.h"

@interface BaseTableViewCell : UITableViewCell
/**
 创建cell子控件（子类中实现）
 */
- (void)setUpSubViews;
@end
