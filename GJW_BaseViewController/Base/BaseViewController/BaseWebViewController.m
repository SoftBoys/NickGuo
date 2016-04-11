//
//  BaseWebViewController.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/4/5.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "BaseWebViewController.h"



@interface LoadProgressAnimationView : UIView
/**
 *  开始加载进度条
 */
- (void)startLoadProgressAnimation;
/**
 *  加载完成
 */
- (void)endLoadProgressAnimation;

@end

static float Width = 0;
@implementation LoadProgressAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        Width = [UIScreen mainScreen].bounds.size.width;
        frame.size.width = 0;
        self.frame = frame;
    }
    return self;
}

- (void)startLoadProgressAnimation {
    __weak typeof(self) weakself = self;
    CGRect frame = self.frame;
    [UIView animateWithDuration:0.4 animations:^{
        weakself.frame = (CGRect){frame.origin, Width*0.6,CGRectGetHeight(frame)};
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.3 animations:^{
                weakself.frame = (CGRect){frame.origin, Width*0.8,CGRectGetHeight(frame)};
            } completion:^(BOOL finished) {
                
            }];
        });
    }];
}

- (void)endLoadProgressAnimation {
    __weak typeof(self) weakself = self;
    CGRect frame = self.frame;
    [UIView animateWithDuration:0.2 animations:^{
        weakself.frame = (CGRect){frame.origin, Width,CGRectGetHeight(frame)};
    } completion:^(BOOL finished) {
        weakself.hidden = YES;
    }];
}

@end
@interface BaseWebViewController ()
@property (nonatomic, strong) LoadProgressAnimationView *loadProgressView;
@end
@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = [UIScreen mainScreen].bounds;
    self.webView = [[UIWebView alloc] initWithFrame:frame];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    
    self.loadProgressView = [[LoadProgressAnimationView alloc] init];
    self.loadProgressView.frame = CGRectMake(0, 0, 0, 3);
    self.loadProgressView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.loadProgressView];

}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.loadProgressView startLoadProgressAnimation];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.loadProgressView endLoadProgressAnimation];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载出错");
}
@end
