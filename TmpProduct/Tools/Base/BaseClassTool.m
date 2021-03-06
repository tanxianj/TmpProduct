//
//  BaseClassTool.m
//  TmoProduct
//
//  Created by 谭显敬 on 2019/2/16.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "BaseClassTool.h"

@implementation BaseClassTool

+ (UIView *)viewWithBackgroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = backgroundColor;
    return view;
}

+ (UIView *)backView {
    UIView *backV = [[UIView alloc] init];
    backV.backgroundColor = [UIColor whiteColor];
//    backV.layer.borderWidth = kOnePx;;
//    backV.layer.borderColor = [UIColor appLineColor].CGColor;
    return backV;
}

+ (UIView *)lineView {
    UIView *lineV = [[UIView alloc] init];
    lineV.backgroundColor = [UIColor appLineColor];
    return lineV;
}

+ (UILabel *)labelWithFont:(CGFloat)font
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}

+ (UIButton *)buttonWithBackgroundColor:(UIColor *)backgroundColor
                                   font:(CGFloat)font
                             titleColor:(UIColor *)titleColor
             contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment
                                  title:(NSString *)title {
    UIButton *button = [self buttonWithFont:font
                                 titleColor:titleColor
                 contentHorizontalAlignment:contentHorizontalAlignment
                                      title:title];
    button.backgroundColor = backgroundColor;
    button.layer.cornerRadius = 4;
    return button;
}

+ (UIButton *)buttonWithFont:(CGFloat)font
                  titleColor:(UIColor *)titleColor
  contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment
                       title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setTitleColor:titleColor
                 forState:UIControlStateNormal];
    button.contentHorizontalAlignment = contentHorizontalAlignment;
    [button setTitle:title
            forState:UIControlStateNormal];
    return button;
}

+ (UITextField *)textFieldWithFont:(CGFloat)font
                         textColor:(UIColor *)textColor
                      keyboardType:(UIKeyboardType)keyboardType
                     returnKeyType:(UIReturnKeyType)returnKeyType
                       placeholder:(NSString *)placeholder
                              text:(NSString *)text {
    UITextField *textField = [[UITextField alloc] init];
    textField.font = [UIFont systemFontOfSize:font];
    textField.textColor = textColor;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.keyboardType = keyboardType;
    textField.returnKeyType = returnKeyType;
    textField.placeholder = placeholder;
    textField.text = text;
    return textField;
}

@end
