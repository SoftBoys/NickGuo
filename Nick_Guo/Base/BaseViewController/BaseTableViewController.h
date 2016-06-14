//
//  BaseTableViewController.h
//  WGManager
//
//  Created by dfhb@rdd on 16/1/28.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTableView.h"
#import "BaseTableViewCell.h"
@interface BaseTableViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) BaseTableView *tableView;
@end
