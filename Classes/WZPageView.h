//
//  WZZPageView.h
//  WZPageView
//
//  Created by Trance on 2017/3/20.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZPageView;
@class WZPageStyle;
@protocol WZPageViewDelegate<NSObject>


/**
 current scroll index

 @param pageView pageView
 @param index index
 */
- (void)pageView:(WZPageView *)pageView scrollIndex:(NSInteger)index;

@end

@interface WZPageView : UIView

/**delegate*/
@property (nonatomic, weak) id <WZPageViewDelegate> delegate;


/**
 init

 @param frame frame
 @param currentVc currentVc
 @param childVcs childVcs
 @param titles titles
 @param style style
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame  currentVc:(UIViewController *)currentVc childVcs:(NSArray *)childVcs titles:(NSArray *)titles style:(WZPageStyle *)style;


- (void)pageViewMove:(NSInteger)index animated:(BOOL)animated;

@end
