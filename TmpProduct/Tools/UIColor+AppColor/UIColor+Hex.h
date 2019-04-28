//
//  UIColor+Hex.h
//  TmoProduct
//
//  Created by 谭显敬 on 2019/3/17.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;


/**
 HEX

 @param stringToConvert 0x000000
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;


/**
 传入#AABBCC

 @param stringToConvert 0xFFFFFF
 @param alpha
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert andAlpha:(CGFloat)alpha;





@end
