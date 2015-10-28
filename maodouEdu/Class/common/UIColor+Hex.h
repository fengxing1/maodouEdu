//
//  UIColor+Hex.h
//  Weituan
//
//  Created by Allen Wang on 13-11-14.
//  Copyright (c) 2013年 feichang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (NBHex)
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;
+ (UIColor*)colorwithhex:(NSString *)hexValue;
+ (UIColor*)colorwithhex:(NSString *)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)whiteColorWithAlpha:(CGFloat)alphaValue;
+ (UIColor*)blackColorWithAlpha:(CGFloat)alphaValue;
@end
