//
//  TXJSelectDateView.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/17.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSDatePickerView.h"
@interface TXJSelectDateView : NSObject

/**
 显示日期选择器

 @param date 最大可选择时间
 @param style 显示样式
 */
+(void)showDateViewWithMaxLimitDate:(NSDate *)date Title:(NSString *)title DateStyle:(WSDateStyle)style completelp:(void(^)(NSString *  dateString))completelp;

/**
  显示日期选择器

 @param date 最小可选择时间
 @param style 显示样式
 */
+(void)showDateViewWithMinLimitDate:(NSDate *)date Title:(NSString *)title DateStyle:(WSDateStyle)style completelp:(void(^)(NSString *  dateString))completelp;

/**
  显示日期选择器

 @param date 需要滚动的时间
 @param style 显示样式
 @param max_min 当前时间是 最大/最小 可选择时间 @"max"/@"min"
 */
+(void)showDateViewWithscrollToDate:(NSDate *)date Title:(NSString *)title DateStyle:(WSDateStyle)style NowDate_is_Max_Min:(NSString *)max_min completelp:(void(^)(NSString *  dateString))completelp;
@end
