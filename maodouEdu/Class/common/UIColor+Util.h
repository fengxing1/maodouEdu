//
//  UIColor+Util.h
//  maodouEdu
//
//  Created by zhukeshuai on 15/10/20.
//  Copyright © 2015年 zks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

+ (UIColor *)themeColor;
+ (UIColor *)nameColor;
+ (UIColor *)titleColor;
+ (UIColor *)separatorColor;
+ (UIColor *)cellsColor;
+ (UIColor *)titleBarColor;
+ (UIColor *)selectTitleBarColor;
+ (UIColor *)navigationbarColor;
+ (UIColor *)selectCellSColor;
+ (UIColor *)labelTextColor;
+ (UIColor *)teamButtonColor;

+ (UIColor *)infosBackViewColor;
+ (UIColor *)lineColor;

+ (UIColor *)contentTextColor;


@end
