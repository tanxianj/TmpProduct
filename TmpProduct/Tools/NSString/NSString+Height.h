//
//  NSString+Height.h
//  消汇邦
//
//  Created by 1244 on 2017/7/19.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Height)

+ (CGFloat)heightForString:(NSString*)string fontSize:(NSInteger)fontSize width:(CGFloat)width headerIndent:(CGFloat)headerIndent;
+ (CGFloat)heightForString:(NSString*)string fontSize:(NSInteger)fontSize width:(CGFloat)width headerIndent:(CGFloat)headerIndent lineHeight:(CGFloat)lineHeight;
- (NSAttributedString *)stringWithHeightForFontSize:(NSInteger)fontSize;


- (CGFloat)zcl_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGFloat)zcl_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
/*
 得到宽度传入高度
 */
+(CGFloat)getWidth_With_height:(CGFloat)height String:(NSString *)string FontSize:(CGFloat)fontSize;
/*
 得到高度传入宽度
 */
+(CGFloat)getHeight_With_Width:(CGFloat)width String:(NSString *)string FontSize:(CGFloat)fontSize;
@end
