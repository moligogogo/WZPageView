//
//  WZPageStyle.h
//  WZPageView
//
//  Created by Trance on 2017/3/20.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZPageStyle : NSObject

/**titleViewColor*/
@property (nonatomic, strong) UIColor *titleViewBackgroundColor;
/**标题容器高度*/
@property (nonatomic, assign) CGFloat titleViewH;
/**选中颜色*/
@property (nonatomic, strong) UIColor *itemHighColor;
/**普通颜色*/
@property (nonatomic, strong) UIColor *itemNormalColor;
/**itemFont*/
@property (nonatomic, assign) CGFloat itemFont;
/**itemMargin*/
@property (nonatomic, assign) CGFloat itemMargin;
/**markH*/
@property (nonatomic, assign) CGFloat markH;
/**markColor*/
@property (nonatomic, strong) UIColor *markColor;



@end
