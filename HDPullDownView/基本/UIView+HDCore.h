//
//  UIView+HDCore.h
//  HDCore
//
//  Created by zhangdadi on 15/3/31.
//  Copyright (c) 2015年 HD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HDCore)

@property CGPoint HDOrigin;
@property CGSize  HDSize;
@property CGFloat HDWidth;
@property CGFloat HDHeight;
@property CGFloat HDCenterX;
@property CGFloat HDCenterY;

//位置
@property CGFloat HDLeft;
@property CGFloat HDRight;
@property CGFloat HDTop;
@property CGFloat HDBottom;

/**
 *  圆角
 */
@property IBInspectable CGFloat HDRadius;

/**
 *  边框颜色
 */
@property IBInspectable UIColor *HDBordColor;

/**
 *  边框宽度
 */
@property IBInspectable CGFloat HDBorderWidth;


- (void)HDMoveBy:(CGPoint)delta;
- (void)HDScaleBy:(CGFloat)scaleFactor;

/**
 *  获取view的viewController
 *
 *  @return 返回view的viewController
 */
- (UIViewController*)HDViewController;

/**
 *  删除view里的所有子view
 */
- (void)HDRemoveAllChildren;

/**
 *  初始化xib
 *
 */
+ (instancetype)HDViewFromXib;


@end
