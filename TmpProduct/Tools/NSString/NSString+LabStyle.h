//
//  NSString+LabStyle.h
//  消汇邦
//
//  Created by 谭显敬 on 2018/9/28.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LabStyle)

/**
 返回富文本

 @param str1 第一段字符
 @param Font1size 第一段字符字体大小
 @param color1 第一段字符字体颜色
 @param str2 第二段字符
 @param font2size 第二段字符字体大小
 @param color2 第二段字符字体颜色
 @return 返回富文本
 */
+ (NSAttributedString *)stringTwoFirst:(NSString *)str1
                             font1Size:(CGFloat)Font1size
                                color1:(UIColor *)color1
                                second:(NSString *)str2
                             font2size:(CGFloat)font2size
                                color2:(UIColor *)color2;

+(NSAttributedString *)AttributedString:(NSArray *)strArray
                          FontSizeArray:(NSArray *)fontSizeArray
                            ColorsArray:(NSArray *)colorArray;
@end

NS_ASSUME_NONNULL_END
