//
//  UIColor+AppColors.h
//  TmoProduct
//
//  Created by 1244 on 2019/8/14.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (AppColors)

+ (UIColor *)appBackgroundColor;
+ (UIColor *)appBlackDescColor;
+(UIColor *)appGreenColor;
+(UIColor *)appYellowColor;
+ (UIColor *)appLineColor;
+ (UIColor *)appWhiteDisableColor;
+ (UIColor *)appBlackColor;
/**
 APP 默认蓝颜色

 @return 3D6CDE
 */
+(UIColor *)appBlueColor;

/**
 APP 默认浅蓝

 @return 浅蓝
 */
+(UIColor *)appBlueDescColor;
/**
 App 默认红

 @return APP红
 */
+(UIColor *)appRedColor;
/**
 APP 文字颜色 333

 @return 文字颜色 333
 */
+(UIColor *)appTextColor;

/**
 APP 文字颜色 666

 @return 666
 */
+(UIColor *)appTextDescColor;

/**
 APP 文字颜色 999

 @return 999
 */
+(UIColor *)appTextDescTwoColor;
+ (UIColor *)appColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
/**
 随机颜色

 @return  随机颜色
 */
+ (UIColor *)arc4randomColor;
@end
