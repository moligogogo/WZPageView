//
//  WZTitlesView.h
//  WZPageView
//
//  Created by Trance on 2017/3/20.
//  Copyright © 2017年 Trance. All rights reserved.
//  titles

#import <UIKit/UIKit.h>
@class WZTitleView;
@class WZPageStyle;
@protocol WZTitleViewDelegate <NSObject>

- (void)titleView:(WZTitleView *)titleView selectIndex:(NSInteger)index;

@end

@interface WZTitleView : UIView

/** delegate */
@property (nonatomic, weak) id <WZTitleViewDelegate> delegate;


/**
 init

 @param frame frame
 @param titles titles
 @param style style
 @return titleView
 */
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles style:(WZPageStyle *)style;


/**
 scroll to index

 @param index index
 */
- (void)titleViewScrollToIndex:(NSInteger) index;

@end
