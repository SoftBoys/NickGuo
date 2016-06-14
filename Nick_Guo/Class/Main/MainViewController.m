//
//  MainViewController.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/4/5.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end
@implementation MainViewController

- (void)setAdImage:(UIImage *)adImage {
    _adImage = adImage;
    if (_adImage) {
        if (self.imageView == nil) {
            UIView *view = self.view;
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = [[UIScreen mainScreen] bounds];
            [view addSubview:imageView];
            self.imageView = imageView;
        }
        self.imageView.image = self.adImage;
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        __weak typeof(self) weakself = self;
        [UIView animateWithDuration:2.0 animations:^{
            weakself.imageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
            weakself.imageView.alpha = 0;
        } completion:^(BOOL finished) {
            [weakself.navigationController setNavigationBarHidden:NO animated:NO];
            [weakself.imageView removeFromSuperview];
            weakself.imageView = nil;
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
@end
