//
//  MDYCommonUtils.h
//  maodouEdu
//
//  Created by zhukeshuai on 15/10/16.
//  Copyright © 2015年 zks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//导航栏，tabbar显示隐藏动画的持续时间
#define TopTabBarAnimationDuration 0.5

#define MEDIALIMIT 30
// 顶部导航加状态栏的总高度
#define TopBarHeight 64

// 底部tabbar的高度

#define TabBarHeight 49

// 屏幕的物理高度
#define  ScreenHeight  [UIScreen mainScreen].bounds.size.height

// 屏幕的物理宽度
#define  ScreenWidth   [UIScreen mainScreen].bounds.size.width

// app的物理宽度
#define  AppFrame   [UIScreen mainScreen].applicationFrame

// app的屏幕尺寸
#define  ScreenFrame   [UIScreen mainScreen].bounds

// 调试
#define NSLOG_FUNCTION NSLog(@"%s,%d",__FUNCTION__,__LINE__)
@interface MDYCommonUtils : NSObject
+(UIFont *)dwjMasterFontOfSize:(CGFloat)size;

@end
