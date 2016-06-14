//
//  GuideCell.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "GuideCell.h"
#import "UIButton+More.h"

@interface GuideCell ()
@property (nonatomic, strong) UIImageView *icanView;
@property (nonatomic, strong) UIButton *nextButton;
@end
@implementation GuideCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self buildSubViews];
    }
    return self;
}
- (instancetype)init {
    if (self = [super init]) {
        [self buildSubViews];
    }
    return self;
}
- (void)buildSubViews {
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.icanView = [[UIImageView alloc] init];
    self.icanView.frame = bounds;
    self.icanView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.icanView];
    
    self.nextButton = [UIButton buttonWithTitle:@"立即体验"];
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:16];
    self.nextButton.frame = CGRectMake((CGRectGetWidth(bounds) - 100) * 0.5, CGRectGetHeight(bounds) - 110, 100, 33);
    
    [self.nextButton addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.nextButton];
    
    self.nextButton.hidden = YES;
}
- (void)setImage:(UIImage *)image
{
    _image = image;
    if (_image) {
        self.icanView.image = _image;
    }
}
- (void)setIsHiddenNextButton:(BOOL)isHiddenNextButton
{
    _isHiddenNextButton = isHiddenNextButton;
    self.nextButton.hidden = _isHiddenNextButton;
}
- (void)nextClick {
    if ([self.delegate respondsToSelector:@selector(nextFinished)]) {
        [self.delegate nextFinished];
    }
}
@end
