//
//  WZTitlesView.m
//  WZPageView
//
//  Created by Trance on 2017/3/20.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import "WZTitleView.h"
#import "WZPageStyle.h"
@interface WZTitleView ()

/**titles*/
@property (nonatomic, strong) NSArray *titles;
/**style*/
@property (nonatomic, strong) WZPageStyle *style;
/**currentIndex*/
@property (nonatomic, assign) NSInteger currentIndex;

/**scrollView*/
@property (nonatomic, strong) UIScrollView *scrollView;
/**titleLabels*/
@property (nonatomic, strong) NSMutableArray *titleLabels;
/**标识线条*/
@property (nonatomic, strong) UIView *markView;

@end

@implementation WZTitleView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles style:(WZPageStyle *)style{
    
    if (self = [super initWithFrame:frame]) {
        _titles = titles;
        _style = style;
        [self setupUI];
    }
    return self;
}


// MARK: - public method
- (void)titleViewScrollToIndex:(NSInteger)index{
    
    UILabel *selectLabel = self.titleLabels[index];
    [self scrollToSelectLabel:selectLabel];
    
}

// MARK: - private method

/**
 titleLabels tap

 @param tap tap
 */
- (void)titleLabelClick:(UIGestureRecognizer *)tap{
    
    UILabel *selectLabel = (UILabel *)tap.view;
    [self scrollToSelectLabel:selectLabel];
    
    // 通知代理切换到对应的控制器试图
    if ([self.delegate respondsToSelector:@selector(titleView:selectIndex:)]) {
        [self.delegate titleView:self selectIndex:self.currentIndex];
    }
}


/**
 scroll to selectlabel

 @param selectLabel selectLabel(highLabel)
 */
- (void)scrollToSelectLabel:(UILabel *)selectLabel{
    
    if (selectLabel.tag == self.currentIndex) {
        return;
    }
    
    //
    UILabel *highLabel = selectLabel;
    UILabel *normalLabel = self.titleLabels[self.currentIndex];
    highLabel.textColor = _style.itemHighColor;
    normalLabel.textColor = _style.itemNormalColor;
    
    // 记录当前的索引
    self.currentIndex = highLabel.tag;
    
   
    
    // 判断是否能滚动
    if ([self scrollviewIsScoll]) {
        
        // 让Label居中
        CGFloat offsetX = highLabel.wz_centetX - self.wz_width * 0.5;
        if (offsetX < 0) {
            offsetX = 0;
        }
        if (offsetX > self.scrollView.contentSize.width - self.wz_width) {
            offsetX = self.scrollView.contentSize.width - self.wz_width;
        }
        [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        
        [UIView animateWithDuration:0.25 animations:^{
            self.markView.wz_width = highLabel.wz_width;
            self.markView.wz_centetX = highLabel.wz_centetX;
            
        }];
        
    }else{
        
        [UIView animateWithDuration:0.25 animations:^{
            self.markView.wz_centetX = highLabel.wz_centetX;
        }];
    }
    
  
    
    
}

// MARK: - 设置UI
- (void)setupUI{
    
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:self.markView];
    [self setupTitleLabels];
    [self layoutTitleLabels];
    
}

// MARK: 设置titleLabel
- (void)setupTitleLabels{
    
    for (NSInteger i = 0; i < _titles.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:_style.itemFont];
        titleLabel.text = _titles[i];
        titleLabel.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick:)];
        [titleLabel addGestureRecognizer:tap];
        titleLabel.userInteractionEnabled = YES;
        
        if (i == 0) {
            titleLabel.textColor = _style.itemHighColor;
        }else{
            titleLabel.textColor = _style.itemNormalColor;
        }
        
        [self.scrollView addSubview:titleLabel];
        [self.titleLabels addObject:titleLabel];
    }

}

// MARK: 布局titleLabel
- (void)layoutTitleLabels{
    
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = self.wz_height;
    
    
    if ([self scrollviewIsScoll]) {
        for (NSInteger i = 0; i < _titles.count; i++) {
            
            UILabel *titleLabel = self.titleLabels[i];
            // 计算文字宽度
            w = [_titles[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleLabel.font} context:nil].size.width;
            if (i == 0) {
                
                x = _style.itemMargin * 0.5;
                titleLabel.frame = CGRectMake(x, y, w, h);
                self.markView.wz_width = titleLabel.wz_width;
                self.markView.wz_centetX = titleLabel.wz_centetX;
            }else{
                
                UILabel *preLabel = self.titleLabels[i - 1];
                x = CGRectGetMaxX(preLabel.frame) + _style.itemMargin;
                titleLabel.frame = CGRectMake(x, y, w, h);
            }
            
            UILabel *lastLabel = self.titleLabels.lastObject;
            self.scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastLabel.frame) + _style.itemMargin * 0.5, 0);
            
        }
        
    }else{
        for (NSInteger i = 0; i < _titles.count; i++) {
            
            UILabel *titleLabel = self.titleLabels[i];
            w = self.wz_width / _titles.count;
            titleLabel.frame = CGRectMake(i * w, y, w, h);
            if (i == 0) {
                self.markView.wz_width = titleLabel.wz_width;
            }
            
        }
        self.scrollView.contentSize = CGSizeZero;
    }
    
}

- (BOOL)scrollviewIsScoll{
    
    // 判断是否能滚动
    // 左右的边距 + 文字的宽度 + 间距 如果大于自身的宽度就能滚动,否则就不能滚动
    CGFloat betweenMargin = _style.itemMargin * 0.5 * 2;
    CGFloat itemsMargin = (_titles.count - 1) * _style.itemMargin;
    
    CGFloat totalLabelW = 0;
    for (NSInteger i = 0; i < _titles.count; i++) {
        
        UILabel *titleLabel = self.titleLabels[i];
        NSLog(@"%f", [_titles[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleLabel.font} context:nil].size.width);
        totalLabelW += [_titles[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleLabel.font} context:nil].size.width;
    }
    
    totalLabelW = totalLabelW + betweenMargin + itemsMargin;
    return totalLabelW > self.wz_width ? YES : NO;
   
}

// MARK: getter
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.scrollsToTop = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIView *)markView{
    if (!_markView) {
        _markView = [[UIView alloc] init];
        _markView.backgroundColor = _style.markColor;
        _markView.wz_height = _style.markH;
        self.markView.wz_y = self.wz_height - _style.markH;
    }
    return _markView;
}

- (NSMutableArray *)titleLabels{
    if (!_titleLabels) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}

@end
