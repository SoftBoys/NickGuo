//
//  ADViewController.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "ADViewController.h"
#import "UIImageView+WebCache.h"
#import "NSString+More.h"
#import "UIDevice+Extension.h"

@interface ADViewController ()
@property (nonatomic, strong) UIImageView *backImageView;
@end
@implementation ADViewController

+ (instancetype)adviewWithCompleteBlock:(void (^)(UIImage *))block {
    ADViewController *adview = [[ADViewController alloc] init];
    adview.block = block;
    return adview;
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] init];
        _backImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    }
    return _backImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backImageView];
    self.backImageView.backgroundColor = [UIColor redColor];
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    
    NSString *placeholder = nil;
    float deviceScreen = [UIDevice currentDeviceScreenMeasurement];
    if (deviceScreen == 3.5) {
        placeholder = @"iphone4";
    } else if (deviceScreen == 4) {
        placeholder = @"iphone5";
    } else if (deviceScreen == 4.7) {
        placeholder = @"iphone6";
    } else if (deviceScreen == 5.5) {
        placeholder = @"iphone6p";
    }
    [self.backImageView sd_setImageWithURL:[_imageName imageUrl] placeholderImage:[UIImage imageNamed:placeholder] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    NSLog(@"成功");
                    if (self.block) {
                        self.block(image);
                    }
                    
                });
                
            });
        } else {
            
        }
    }];
    
}

@end
