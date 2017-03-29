//
//  WZContentView.h
//  WPageView
//
//  Created by Trance on 2017/3/20.
//  Copyright © 2017年 Trance. All rights reserved.
//  contentView

#import <UIKit/UIKit.h>

@class WZContentView;

@protocol WZContentViewDelegate <NSObject>

/**
 contentView scroll index

 @param contentView contentView
 @param index idnex
 */
- (void)contentView:(WZContentView *)contentView scrollIndex:(NSInteger)index;

@end

@interface WZContentView : UIView


/**delegate*/
@property (nonatomic, weak) id <WZContentViewDelegate> delegate;

/**
 init

 @param frame frame
 @param childVcs childVcs
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs;


/**
 contentView scroll to index

 @param index index
 @param animated  isAnimation
 */
- (void)scrollToItemAtIndx:(NSInteger)index animated:(BOOL)animated;

@end
