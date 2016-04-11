//
//  MainTabBarController.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/4/5.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "MainTabBarController.h"
#import "ViewController.h"

@interface MainTabBarController ()
@property (nonatomic, strong) ViewController *main;
@property (nonatomic, strong) UIViewController *message;
@property (nonatomic, strong) UIViewController *mine;

@property (nonatomic, strong) UIImageView *imageView;
@end
@implementation MainTabBarController

- (void)setAdImage:(UIImage *)adImage {
    _adImage = adImage;
    if (_adImage) {
        if (self.imageView == nil) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = [[UIScreen mainScreen] bounds];
            [self.view addSubview:imageView];
            self.imageView = imageView;
        }
        self.imageView.image = self.adImage;
        
        __weak typeof(self) weakself = self;
        [UIView animateWithDuration:2.0 animations:^{
            weakself.imageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            weakself.imageView.alpha = 0;
        } completion:^(BOOL finished) {
            [weakself.imageView removeFromSuperview];
            weakself.imageView = nil;
        }];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.main = [[ViewController alloc] init];
    [self setChildViewController:self.main
                           title:@"首页"
                       imageName:@"tabbar_manage"
               selectedImageName:@"tabbar_manage_selected"];
    
    self.message = [[UIViewController alloc] init];
    [self setChildViewController:self.message
                           title:@"消息"
                       imageName:@"tabbar_message"
               selectedImageName:@"tabbar_message_selected"];
    
    self.mine = [[UIViewController alloc] init];
    [self setChildViewController:self.mine
                           title:@"我的"
                       imageName:@"tabbar_mine"
               selectedImageName:@"tabbar_mine_selected"];
    
}

@end
