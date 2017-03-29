//
//  WZContentView.m
//  WZPageView
//
//  Created by Trance on 2017/3/20.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import "WZContentView.h"
#import "UIView+WZFrame.h"
#import "WZTitleView.h"
static NSString * const cellId = @"cell";
@interface WZContentView ()<UICollectionViewDataSource,UICollectionViewDelegate>

/**childVcs*/
@property (nonatomic, strong) NSArray *childVcs;

/**bgCollectionView*/
@property (nonatomic, strong) UICollectionView *bgCollectionView;

@end

@implementation WZContentView

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs{
    if (self = [super initWithFrame:frame]) {
        _childVcs = childVcs;
        [self setupUI];
    }
    return self;
}

// MARK: - public method

- (void)scrollToItemAtIndx:(NSInteger)index animated:(BOOL)animated{
    
    // FIX
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.bgCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
}

// MARK: - private method
// MARK: 设置UI
- (void)setupUI{
    
    [self addSubview:self.bgCollectionView];
}




// MARK: - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _childVcs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    // remove reuseview
    for (UIView * view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    // add childVc view
    UIViewController *childVc = self.childVcs[indexPath.row];
    childVc.view.frame = self.bounds;
    [cell addSubview:childVc.view];
    
    return cell;
}
// MARK: - UICollectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 计算最后的索引
    NSInteger index = self.bgCollectionView.contentOffset.x / self.wz_width;
    // 通知代理让TitleView滑动到对应的位置
    if ([self.delegate respondsToSelector:@selector(contentView:scrollIndex:)]) {
        [self.delegate contentView:self scrollIndex:index];
    }
}

// MARK: - getter
- (UICollectionView *)bgCollectionView{
    if (!_bgCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(self.wz_width, self.wz_height);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        
        _bgCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _bgCollectionView.scrollsToTop = NO;
        _bgCollectionView.showsHorizontalScrollIndicator = NO;
        _bgCollectionView.pagingEnabled = YES;
        _bgCollectionView.bounces = NO;
        _bgCollectionView.dataSource = self;
        _bgCollectionView.delegate = self;
        [_bgCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    }
    return _bgCollectionView;
}

@end
