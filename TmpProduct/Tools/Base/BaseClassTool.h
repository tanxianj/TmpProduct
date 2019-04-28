//
//  BaseClassTool.h
//  TmoProduct
//
//  Created by 谭显敬 on 2019/2/16.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseClassTool : NSObject

+ (UIView *)viewWithBackgroundColor:(UIColor *)backgroundColor;

+ (UIView *)backView;
+ (UIView *)lineView;

+ (UILabel *)labelWithFont:(CGFloat)font
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment;

+ (UIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                                   font:(CGFloat)font
                             titleColor:(UIColor *)titleColor
             contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment
                                  title:(NSString *)title;

+ (UIButton *)buttonWithFont:(CGFloat)font
                  titleColor:(UIColor *)titleColor
  contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment
                       title:(NSString *)title;

+ (UITextField *)textFieldWithFont:(CGFloat)font
                         textColor:(UIColor *)textColor
                      keyboardType:(UIKeyboardType)keyboardType
                     returnKeyType:(UIReturnKeyType)returnKeyType
                       placeholder:(NSString *)placeholder
                              text:(NSString *)text;

@end
