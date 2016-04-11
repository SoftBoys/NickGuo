//
//  UITableViewCell+Extension.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/30.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)
+ (instancetype)cellForTableView:(UITableView *)tableView {
    
    NSString *identifir = NSStringFromClass([self class]);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifir];
    if (cell == nil) {
        cell = [[[self class] alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifir];
    }
    return cell;
}
@end
