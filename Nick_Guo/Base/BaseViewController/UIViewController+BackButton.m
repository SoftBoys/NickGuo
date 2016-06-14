//
//  UIViewController+BackButton.m
//  WGManager
//
//  Created by dfhb@rdd on 16/1/28.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "UIViewController+BackButton.h"

@interface BarButton : UIButton

@end

@implementation BarButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGSize size = self.currentImage.size;
    float imageY = (CGRectGetHeight(self.bounds) - size.width)/2.0;
    CGRect imageF = CGRectMake(0, imageY, size.width, size.height);
    return imageF;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGRect titleF = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    return titleF;
}
@end

@implementation UIViewController (BackButton)
- (void)addBackButton {
    UIImage *normalImage = [UIImage imageNamed:@"nav_backimage_normal"];
    
    if (normalImage == nil) {
        return;
    }
    
    BarButton *button = [BarButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    button.frame = CGRectMake(0, 0, 80, 44);
    [button setImage:normalImage forState:UIControlStateNormal];
//    [button setTitle:@"返回" forState:UIControlStateNormal];

    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = backItem;
    
//    NSLog(@"%@", @(self.navigationController.viewControllers.count));
    self.navigationItem.leftBarButtonItem.customView.hidden = !(self.navigationController.viewControllers.count>1);
    
}
- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addTapGesture {
    // 添加点击空白区域收键盘
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)]];
}
- (void)tapClick {
    [self.view endEditing:YES];
}
@end



