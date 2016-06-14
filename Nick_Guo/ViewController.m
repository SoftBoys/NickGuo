//
//  ViewController.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/30.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "UIButton+More.h"
#import "HYBNetworking.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *adImageView;
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.title = @"按钮";
    [button addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    self.button = button;
    
    
    UIImageView *imageView = [UIImageView new];
    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://gaopinimages.com/imagesetsview/183/134202968196.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            
        }
    }];
    [self.view addSubview:imageView];
    imageView.backgroundColor = [UIColor redColor];
    imageView.frame = CGRectMake(200, 250, 100, 100);
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
- (void)actionClick:(id)sender {
    SecondViewController *second = [[SecondViewController alloc] init];
//    second.view.backgroundColor = [UIColor whiteColor];
    second.title = @"second";
    [self.navigationController pushViewController:second animated:YES];
}


@end
