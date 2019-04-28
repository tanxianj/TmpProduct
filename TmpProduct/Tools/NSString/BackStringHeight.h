//
//  BackStringHeight.h
//  消汇邦
//
//  Created by bang on 2018/4/3.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BackStringHeight : NSObject
//+ (CGFloat)getHeightLineWithString:(NSString *)string withWidth:(CGFloat)width withFont:(UIFont *)font;
+ (CGFloat)getHeightLineWithString:(NSString *)string withWidth:(CGFloat)width withFont:(UIFont *)font LableLineHeight:(CGFloat )lineheight;

@end
