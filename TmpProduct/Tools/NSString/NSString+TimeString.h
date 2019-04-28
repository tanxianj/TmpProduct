//
//  NSString+TimeString.h
//  消汇邦
//
//  Created by Apple on 2017/6/15.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TimeString)

/**
 格式化时间

 @return MM-dd hh:mm
 */
- (NSString *)timeStringWithYYMMDD;

/**
 MM月DD日

 @return 。。。
 */
-(NSString *)timeStringWithMMDD;
/**
 转成MM-DD HH:mm
 
 @return MM-DD HH:mm
 */
- (NSString *)timeString;

- (NSString *)convertToChineseTime;

- (NSString *)convertToPriceString;

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize textAlignment:(NSTextAlignment)alignment;

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize;

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight;

- (NSString *)stringByTrimmingAllWhiteCharacter;

/**
 得到当前时间戳

 @return 时间戳
 */
+(NSString *)getNowTimeTimestamp;

/**
 得到当前年月YY年MM月

 @return 当前年月
 */
+(NSString *)getNowTimeYYMM;

/**
 得到当前年-月-日

 @return 当前年月日
 */
+ (NSString *)getNowTimeYY_MM_DD;

/**
 得到当前年月YY-MM
 
 @return 当前年月
 */
+ (NSString *)getNowTimeYY_MM;

/**
 返回多久之前

 @param time 需要转换的时间
 @return NSString
 */
+ (NSString *)friendTime:(NSString *)time;
/**
 银行卡加密模式

 @param bankNum 银行卡加密模式
 @return 银行卡加密模式
 */
+(NSString *)getNewBankNumWitOldBankNum:(NSString *)bankNum;
+(NSString *)addSpace:(NSString *)needAddString addSpaceNumber:(NSInteger)number;
+(NSString *)formatterBankCardNum:(NSString *)string;
-(BOOL)isUrlString;
+(NSArray *)getMonthFirstAndLastDayWith:(NSString *)dateStr;

/**
 String 转NSDate

 @param string 时间 String
 @return NSDate
 */
+(NSDate *)NSStringToNSDateWithString:(NSString *)string;
@end
