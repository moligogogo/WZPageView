//
//  UIView+WZFrame.m
//  
//
//  Created by Trance on 2017/1/27.
//  Copyright © 2017年 Trance. All rights reserved.
//

#import "UIView+WZFrame.h"

@implementation UIView (WZFrame)

-(CGFloat)wz_x{
    return self.frame.origin.x;
}

- (void)setWz_x:(CGFloat)wz_x{
    CGRect frame = self.frame;
    frame.origin.x = wz_x;
    self.frame = frame;
}

- (CGFloat)wz_y{
    return self.frame.origin.y;
}

- (void)setWz_y:(CGFloat)wz_y{
    CGRect frame = self.frame;
    frame.origin.y = wz_y;
    self.frame = frame;
}

- (CGFloat)wz_width{
    return self.frame.size.width;
}

- (void)setWz_width:(CGFloat)wz_width{
    CGRect frame = self.frame;
    frame.size.width = wz_width;
    self.frame = frame;
}

- (CGFloat)wz_height{
    return self.frame.size.height;
}

- (void)setWz_height:(CGFloat)wz_height{
    CGRect frame = self.frame;
    frame.size.height = wz_height;
    self.frame = frame;
}

- (CGFloat)wz_centetX{
    return self.center.x;
}

- (void)setWz_centetX:(CGFloat)wz_centetX{
    CGPoint center = self.center;
    center.x = wz_centetX;
    self.center = center;
}

- (CGFloat)wz_centerY{
    return self.center.y;
}

- (void)setWz_centerY:(CGFloat)wz_centerY{
    CGPoint center = self.center;
    center.y = wz_centerY;
    self.center = center;
}


@end
