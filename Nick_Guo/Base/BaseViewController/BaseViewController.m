//
//  BaseViewController.m
//  WGManager
//
//  Created by dfhb@rdd on 16/1/28.
//  Copyright © 2016年 GW. All rights reserved.
//

#import "BaseViewController.h"

// 项目打包上线都不会打印日志，因此可放心。
#ifdef DEBUG
#define GJWLog(s, ... ) NSLog(@"---[message: %@]---", [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define GJWLog(s, ... )
#endif

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addBackButton];
    
    //布局统一 从导航拦 下算0坐标
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}
- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    GJWLog(@"进入控制器:%@", [[self class] description]);
}
- (void)dealloc {
    GJWLog(@"控制器被dealloc:%@",[[self class] description]);
}
@end
