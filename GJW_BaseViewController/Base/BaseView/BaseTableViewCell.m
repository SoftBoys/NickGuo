//
//  BaseTableViewCell.m
//  WGManager
//
//  Created by dfhb@rdd on 16/1/28.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface BaseTableViewCell ()

@end
@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpSubViews];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
}
- (void)setUpSubViews {
    
}
@end
