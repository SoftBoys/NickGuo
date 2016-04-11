//
//  SecondViewController.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *strUrl = @"http://www.vvgong.com/";
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:strUrl]]];
}

@end
