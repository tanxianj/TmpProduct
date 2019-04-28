//
//  NSString+TimeString.m
//  消汇邦
//
//  Created by Apple on 2017/6/15.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "NSString+TimeString.h"
#import "NSDateFormatter+XCCacheDateFormattter.h"


@implementation NSString (TimeString)

- (NSString *)timeStringWithYYMMDD{
    if (self.length >= 16) {
        return [self substringWithRange:NSMakeRange(5, 11)];
    }
    return self;
}
- (NSString *)timeString{
    if (self.length >= 16) {
        return [self substringWithRange:NSMakeRange(5, 11)];
    }
    return self;
}

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight{
    return [self addLineHeight:lineHeight withFont:lineHeight - 5];
}

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize textAlignment:(NSTextAlignment)alignment{
    if (self.length == 0) {
        return nil;
    }else{
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.minimumLineHeight = lineHeight;
        style.alignment = alignment;
        NSDictionary *attributes = @{NSParagraphStyleAttributeName:style,NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
        return [[NSAttributedString alloc]initWithString:self attributes:attributes];
    }
}

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize{
    return [self addLineHeight:lineHeight withFont:fontSize textAlignment:NSTextAlignmentLeft];
}

- (NSString *)convertToChineseTime{
    NSArray *temp = [self componentsSeparatedByString:@" "];
    if (temp.count >= 1) {
        NSString *tempString = temp.firstObject;
        NSArray *tempArr = [tempString componentsSeparatedByString:@"-"];
        if (tempArr.count >= 3) {
            return [NSString stringWithFormat:@"%@年%@月%@日",tempArr[0],tempArr[1],tempArr[2]];
        }else{
            return tempString;
        }
    }else{
        return self;
    }
}
-(NSString *)timeStringWithMMDD{
    NSArray *temp = [self componentsSeparatedByString:@" "];
    if (temp.count >= 1) {
        NSString *tempString = temp.firstObject;
        NSArray *tempArr = [tempString componentsSeparatedByString:@"-"];
        if (tempArr.count >= 3) {
            return [NSString stringWithFormat:@"%@月%@日",tempArr[1],tempArr[2]];
        }else{
            return tempString;
        }
    }else{
        return self;
    }
}
- (NSString *)convertToPriceString{

    return [NSString stringWithFormat:@"¥%@",self];
}

- (NSString *)stringByTrimmingAllWhiteCharacter{
    NSArray* words = [self componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* nospacestring = [words componentsJoinedByString:@""];
    return nospacestring;
}
+(NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    
    return timeSp;
}
+ (NSString *)getNowTimeYYMM{
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy年MM月"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    
    return dateStr;
}
+ (NSString *)getNowTimeYY_MM{
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy-MM"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    
    return dateStr;
}
+ (NSString *)getNowTimeYY_MM_DD{
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    
    return dateStr;
}
+(NSString *)getNewBankNumWitOldBankNum:(NSString *)bankNum
{
    NSMutableString *mutableStr;
    if (bankNum.length) {
        mutableStr = [NSMutableString stringWithString:bankNum];
        for (int i = 0 ; i < mutableStr.length; i ++) {
            if (i>3&&i<mutableStr.length - 4) {
                [mutableStr replaceCharactersInRange:NSMakeRange(i, 1) withString:@"*"];
            }
        }
        NSString *text = mutableStr;
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
        text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *newString = @"";
        while (text.length > 0) {
            NSString *subString = [text substringToIndex:MIN(text.length, 4)];
            newString = [newString stringByAppendingString:subString];
            if (subString.length == 4) {
                newString = [newString stringByAppendingString:@"    "];
            }
            text = [text substringFromIndex:MIN(text.length, 4)];
        }
        newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
        return newString;
    }
    return bankNum;
    
}
+(NSString *)addSpace:(NSString *)needAddString addSpaceNumber:(NSInteger)number{
    if (needAddString.length) {
        NSMutableString *tmpStr = [[NSMutableString alloc]initWithString:needAddString];
        for ( int i=0; i<needAddString.length; i++) {
            if (i+1 %number ==0) {
                [tmpStr replaceCharactersInRange:NSMakeRange(i, 1) withString:@"    "];
            }
            
        }
        return tmpStr;
    }else{
        return nil;
    }
    return needAddString;
}
+(NSString *)formatterBankCardNum:(NSString *)string

{
    
    NSString *tempStr=string;
    
    
    
    
    
    NSInteger size =(tempStr.length / 4);
    
    
    
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    
    for (int n = 0;n < size; n++)
        
    {
        
        [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(n*4, 4)]];
        
    }
    
    
    
    [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(size*4, (tempStr.length % 4))]];
    
    
    
    tempStr = [tmpStrArr componentsJoinedByString:@" "];
    
    
    
    return tempStr;
    
    
    
}
+ (NSString *)friendTime:(NSString *)time{
    NSTimeInterval temp = [[NSDate date]timeIntervalSinceDate:[[NSDateFormatter cachedDateFormatter] dateFromString:time]];
    int days = ((int)temp)/(3600*24);
    if (days >= 1) {
        return [NSString stringWithFormat:@"%d天前",days];
    }
    
    
    int hours = ((int)temp)%(3600*24)/3600;
    
    if (hours >= 1) {
        return [NSString stringWithFormat:@"%d小时前",hours];
    }
    
    int minutes = ((int)temp)%(3600*24)%3600/60;
    
    if (minutes >= 1) {
        
        return [NSString stringWithFormat:@"%d分前",minutes];
    }
    
    int seconds = ((int)temp)%(3600*24)%3600%60;
    
    if (seconds >= 1) {
        return [NSString stringWithFormat:@"%d秒前",seconds];
    }
    
    return time;
    
}
-(BOOL)isUrlString{
    
    NSString *emailRegex = @"[a-zA-z]+://.*";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
    
}
+(NSArray *)getMonthFirstAndLastDayWith:(NSString *)dateStr{
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *newDate=[format dateFromString:dateStr];
    double interval = 0;
    NSDate *firstDate = nil;
    NSDate *lastDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    BOOL OK = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:& firstDate interval:&interval forDate:newDate];
    
    if (OK) {
        lastDate = [firstDate dateByAddingTimeInterval:interval - 1];
    }else {
        return @[@"",@""];
    }
    
    NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
    [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *firstString = [myDateFormatter stringFromDate: firstDate];
    NSString *lastString = [myDateFormatter stringFromDate: lastDate];
    return @[firstString, lastString];
}
+(NSDate *)NSStringToNSDateWithString:(NSString *)string{
    NSString *birthdayStr=@"1986-03-28 00:00:00.000";
    birthdayStr = string;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];//解决8小时时间差问题
    NSDate *birthdayDate = [dateFormatter dateFromString:birthdayStr];
    return birthdayDate;
}
@end
