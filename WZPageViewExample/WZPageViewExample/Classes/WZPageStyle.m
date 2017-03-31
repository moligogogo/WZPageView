//
//  WZPageStyle.m
//  WZPageView
//
//  Created by Trance on 2017/3/20.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import "WZPageStyle.h"

@implementation WZPageStyle

- (UIColor *)titleViewBackgroundColor{
    if (!_titleViewBackgroundColor) {
        _titleViewBackgroundColor = [UIColor whiteColor];
    }
    return _titleViewBackgroundColor;
}

- (CGFloat)titleViewH{
    if (_titleViewH == 0) {
        _titleViewH = 35;
    }
    return _titleViewH;
}

- (CGFloat)itemFont{
    if (_itemFont == 0) {
        _itemFont = 14;
    }
    return _itemFont;
}

- (CGFloat)itemMargin{
    if (_itemMargin == 0) {
        _itemMargin = 20;
    }
    return _itemMargin;
}

- (UIColor *)itemHighColor{
    if (_itemHighColor == nil) {
        _itemHighColor = [UIColor redColor];
    }
    return _itemHighColor;
}

- (UIColor *)itemNormalColor{
    if (_itemNormalColor == nil) {
        _itemNormalColor = [UIColor lightGrayColor];
    }
    return _itemNormalColor;
}

- (CGFloat)markH{
    if (_markH == 0) {
        _markH = 2;
    }
    return _markH;
}

- (UIColor *)markColor{
    if (_markColor == nil) {
        _markColor = [UIColor redColor];
    }
    return _markColor;
}



@end
