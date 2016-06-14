//
//  GuideViewController.h
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "BaseViewController.h"

@interface GuideViewController : BaseViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIPageControl *pageControl;

@end
