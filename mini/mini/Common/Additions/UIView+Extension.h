//
//  UIView+Extension.h
//  01-黑酷
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/**
  *  1.间隔X值
  */
@property (nonatomic, assign) CGFloat x;
/**
 *  2.间隔Y值
 */
@property (nonatomic, assign) CGFloat y;
/**
 *  3.最大X
 */
@property (nonatomic, assign) CGFloat maxX;
/**
 *  4.最大Y
 */
@property (nonatomic, assign) CGFloat maxY;
/**
 *  5.中心点X值
 */
@property (nonatomic, assign) CGFloat centerX;
/**
 *  6.中心点Y值
 */
@property (nonatomic, assign) CGFloat centerY;

/**
 *  7.宽度
 */
@property (nonatomic, assign) CGFloat width;
/**
 *  8.高度
 */
@property (nonatomic, assign) CGFloat height;
/**
 *  9.尺寸大小
 */
@property (nonatomic, assign) CGSize size;

/**
 *  10.起始点
 */
@property (nonatomic, assign) CGPoint origin;

/**
 *  11.上 < Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat top;

/**
 *  12.下 < Shortcut for frame.origin.y + frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 *  13.左 < Shortcut for frame.origin.x.
 */
@property (nonatomic) CGFloat left;

/**
 *  14.右 < Shortcut for frame.origin.x + frame.size.width
 */
@property (nonatomic) CGFloat right;
/**
 *  1.添加边框
 *
 */
- (void)addBorderColor:(UIColor *)color;

/**
 *  2.UIView 的点击事件
 *
 *  @param target   目标
 *  @param action   事件
 */

- (void)addTarget:(id)target
           action:(SEL)action;
@end
