//
//  UITableView+Extension.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/30.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)
+ (instancetype)tableView {
    return [self tableViewWithStyle:UITableViewStyleGrouped];
}
+ (instancetype)tableViewWithStyle:(UITableViewStyle)style {
    UITableView *table = [[[self class] alloc] initWithFrame:CGRectZero style:style];
    
    return table;
}
@end
