//
//  HDUtilsMacro.h
//  HDCore
//
//  Created by zhangdadi on 16/4/12.
//  Copyright © 2016年 HD. All rights reserved.
//
//
//方便使用的宏定义

#ifndef HDUtilsMacro_h
#define HDUtilsMacro_h

// 注册通知
#define HDNotifiAdd(_noParamsFunc, _notifyName)  [[NSNotificationCenter defaultCenter] \
addObserver:self \
selector:@selector(_noParamsFunc) \
name:_notifyName \
object:nil];

// 发送通知
#define HDNotifiPost(_notifyName)   [[NSNotificationCenter defaultCenter]postNotificationName:_notifyName object:nil];

// 移除通知
#define HDNotifiRemove(_notifyName) [[NSNotificationCenter defaultCenter] removeObserver:self name:_notifyName object:nil];

//移除所有通知
#define HDNotifiAllRemove [[NSNotificationCenter defaultCenter] removeObserver:self];

//FRAME操作
#define HDScreenWidth           [UIScreen mainScreen].bounds.size.width
#define HDScreenHeight          [UIScreen mainScreen].bounds.size.height
#define HDRectMake              ([UIScreen mainScreen].bounds)
#define HDMainBundle  [NSBundle mainBundle]
#define HDUserDefaults [NSUserDefaults standardUserDefaults]
#define HDWindow ([UIApplication sharedApplication].keyWindow)
//根视图控制器
#define HDRootVC (UITabBarController *)[[UIApplication sharedApplication].delegate window].rootViewController

#define HDNavigationHeight       44  //NavigationItem 高
#define HDTabbarHeight           49  //tabbar高
#define HDStatusbarHeight        20 //状态栏高度
#define HDMainHeight           (HDScreenHeight - HDNavigationHeight - HDStatusbarHeight - HDTabbarHeight)

// 颜色16进制转换
#define HDColorFromHexadecimalRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HDColorFromHexadecimalRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define HDColorFromRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define HDColorFromRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#define HDWeakSelf __weak typeof(self) weakSelf = self;

#endif /* HDUtilsMacro_h */
