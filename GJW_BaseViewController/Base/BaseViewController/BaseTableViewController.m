//
//  BaseTableViewController.m
//  WGManager
//
//  Created by dfhb@rdd on 16/1/28.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "BaseTableViewController.h"

@implementation BaseTableViewController
- (BaseTableView *)tableView
{
    if (!_tableView) {
        _tableView = [BaseTableView tableViewWithStyle:UITableViewStyleGrouped];
    }
    return _tableView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    float tableY = 0;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.frame = CGRectMake(0, tableY, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)- 64);
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
}
#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [BaseTableViewCell cellForTableView:tableView];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark - 设置cell的线条
- (void)viewDidLayoutSubviews
{
    self.tableView.separatorInset = UIEdgeInsetsZero;
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        self.tableView.layoutMargins = UIEdgeInsetsZero;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    cell.separatorInset = UIEdgeInsetsZero;
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        cell.layoutMargins = UIEdgeInsetsZero;
    }
}

@end
