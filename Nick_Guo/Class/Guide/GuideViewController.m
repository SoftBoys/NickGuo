//
//  GuideViewController.m
//  GJW_BaseViewController
//
//  Created by dfhb@rdd on 16/3/31.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "GuideViewController.h"
#import "GuideCell.h"
#import "RootTool.h"

static NSString *identify = @"GuideCellId";
@interface GuideViewController ()<GuideCellDelegate>
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, assign) BOOL isHiddenNextButton;  // 隐藏下一步按钮
@end
@implementation GuideViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
    self.imageNames = @[@"guide_1",@"guide_2",@"guide_3",@"guide_4"];
    
    self.isHiddenNextButton = YES;
    
    [self buildCollectionView];

    [self buildPageControl];
    
}
                           
- (void)buildCollectionView {
    CGRect bounds = [[UIScreen mainScreen] bounds];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[GuideCell class] forCellWithReuseIdentifier:identify];
}

- (void)buildPageControl {
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    CGRect framePage = CGRectMake(0, CGRectGetHeight(bounds) - 50, CGRectGetWidth(bounds), 20);
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = framePage;
    self.pageControl.numberOfPages = self.imageNames.count;
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
}
#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imageName = self.imageNames[indexPath.row];
    GuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:imageName];
    cell.delegate = self;
    if (indexPath.row != self.imageNames.count - 1) {
        cell.isHiddenNextButton = YES;
    } else {
        cell.isHiddenNextButton = NO;
    }
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageNames.count;
}
#pragma mark - UISrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offX = 0.5; // 偏移量
    NSInteger index = scrollView.contentOffset.x /(kScreenWidth) + offX;
    self.pageControl.currentPage = index;
}


#pragma mark - 点击下一步按钮
- (void)nextFinished {
    [RootTool chooseRootController];
}
@end
