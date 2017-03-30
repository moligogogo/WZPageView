//
//  WZPageContainerView.h
//  WZPageViewExample
//
//  Created by Trance on 2017/3/30.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WZPageContainerView;
@class WZPageStyle;
@protocol WZPageContainerViewDelegate<NSObject>

/**
 current scroll index
 
 @param containerView containerView
 @param index index
 */
- (void)containerView:(WZPageContainerView *)containerView didScrollIndex:(NSInteger)index;

@end

@interface WZPageContainerView : UIView

/**delegate*/
@property (nonatomic, weak) id <WZPageContainerViewDelegate> delegate;

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



/**
 move to page

 @param page page index
 @param animated animated
 */
- (void)containerViewMoveTo:(NSInteger)page animated:(BOOL)animated;

@end
