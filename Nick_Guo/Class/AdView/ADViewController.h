//
//  ADViewController.h
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "BaseViewController.h"

@interface ADViewController : BaseViewController

+ (instancetype)adviewWithCompleteBlock:(void(^)(UIImage *image))block;

@property (nonatomic, copy) NSString *imageName;

@property (nonatomic, strong) void (^block)(UIImage *image);
@end
