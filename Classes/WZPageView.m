//
//  WZPageView.m
//  WZPageView
//
//  Created by Trance on 2017/3/20.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import "WZPageView.h"
#import "WZPageStyle.h"
#import "WZTitleView.h"
#import "WZContentView.h"
@interface WZPageView ()<WZTitleViewDelegate,WZContentViewDelegate>

/**titles*/
@property (nonatomic, strong) NSArray *titles;
/**childVcs*/
@property (nonatomic, strong) NSArray *childVcs;
/**style*/
@property (nonatomic, strong) WZPageStyle *style;
/**titleView*/
@property (nonatomic, weak) WZTitleView *titleView;
/**contentView*/
@property (nonatomic, weak) WZContentView *contentView;


@end

@implementation WZPageView


- (instancetype)initWithFrame:(CGRect)frame currentVc:(UIViewController *)currentVc childVcs:(NSArray *)childVcs titles:(NSArray *)titles style:(WZPageStyle *)style{
    
    if (self = [super initWithFrame:frame]) {
        
        _titles = titles;
        _childVcs = childVcs;
        _style = style;
        
        for (UIViewController *childVc in _childVcs) {
            [currentVc addChildViewController:childVc];
        }
        
        [self setupUI];
    }
    return self;
}

- (void)pageViewMove:(NSInteger)index animated:(BOOL)animated{
    
    [self.titleView titleViewScrollToIndex:index];
    [self.contentView scrollToItemAtIndx:index animated:animated];
}

// MARK: WZTitleViewDelegate
- (void)titleView:(WZTitleView *)titleView selectIndex:(NSInteger)index{
    
    [self.contentView scrollToItemAtIndx:index animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(pageView:scrollIndex:)]) {
        [self.delegate pageView:self scrollIndex:index];
    }
}

// MARK: WZContentViewDelegate
- (void)contentView:(WZContentView *)contentView scrollIndex:(NSInteger)index{
    
    [self.titleView titleViewScrollToIndex:index];
    
    if ([self.delegate respondsToSelector:@selector(pageView:scrollIndex:)]) {
        [self.delegate pageView:self scrollIndex:index];
    }
}

// MARK: -
// MARK: 设置UI
- (void)setupUI{

    self.backgroundColor = [UIColor whiteColor];
    
    [self setupTitleView];
    [self setupContentView];
    
}

// MARK: 设置TitleView
-(void)setupTitleView{
    
    WZTitleView *titleView = [[WZTitleView alloc] initWithFrame:CGRectMake(0, 0, self.wz_width, _style.titleViewH) titles:_titles style:_style];
    
    [self addSubview:titleView];
    titleView.backgroundColor = [UIColor yellowColor];
    self.titleView = titleView;
    self.titleView.delegate = self;
    
}

// MARK: 设置contentView
- (void)setupContentView{
    
    WZContentView *contentView = [[WZContentView alloc] initWithFrame:CGRectMake(0, _style.titleViewH, self.wz_width, self.wz_height - _style.titleViewH) childVcs:_childVcs];
    contentView.backgroundColor = [UIColor blueColor];
    [self addSubview:contentView];
    self.contentView = contentView;
    self.contentView.delegate = self;
    
}



@end
