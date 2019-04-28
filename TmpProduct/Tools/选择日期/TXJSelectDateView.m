//
//  TXJSelectDateView.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/17.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "TXJSelectDateView.h"

@implementation TXJSelectDateView
+(void)showDateViewWithMaxLimitDate:(NSDate *)date Title:(NSString *)title DateStyle:(WSDateStyle)style completelp:(void(^)(NSString *  dateString))completelp{
    WSDatePickerView *datepicker =  [[WSDatePickerView alloc]initWithDateStyle:style CompleteBlock:^(NSDate  *selectDate) {
        
        //NSString *dateString = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
        /*
         DateStyleShowYearMonthDayHourMinutess = 0 //年月日时分秒
        DateStyleShowYearMonthDayHourMinute  = 0,//年月日时分
        DateStyleShowMonthDayHourMinute,//月日时分
        DateStyleShowYearMonthDay,//年月日
        DateStyleShowYearMonth,//年月
        DateStyleShowMonthDay,//月日
        DateStyleShowHourMinute,//时分
        DateStyleShowYear,//年
        DateStyleShowMonth,//月
        DateStyleShowDayHourMinute,//日时分
        */
        NSString *dateString = @"";
        switch (style) {
                
//            case DateStyleShowYearMonthDayHourMinutess:{
//                dateString = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
//            }break;
            case DateStyleShowYearMonthDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
            }break;
            case DateStyleShowMonthDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"MM-dd HH:mm"];
            }break;
            case DateStyleShowYearMonthDay:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM-dd"];
            }break;
            case DateStyleShowYearMonth:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM"];
            }break;
            case DateStyleShowMonthDay:{
                dateString = [selectDate stringWithFormat:@"MM-dd"];
            }break;
            case DateStyleShowHourMinute:{
                dateString = [selectDate stringWithFormat:@"HH:mm"];
            }break;
            case DateStyleShowYear:{
                dateString = [selectDate stringWithFormat:@"yyyy"];
            }break;
            case DateStyleShowMonth:{
                dateString = [selectDate stringWithFormat:@"MM"];
            }break;
            case DateStyleShowDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"dd HH:mm"];
            }break;
            default:
                break;
        }
//        txjLog(@"选择的日期：%@",dateString);
        if (completelp) {
            completelp(dateString);
        }
    }];
    datepicker.dateLabelColor = [UIColor appTextColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.maxLimitDate = date;
    datepicker.title = title;
    [datepicker show];
}
+(void)showDateViewWithMinLimitDate:(NSDate *)date Title:(NSString *)title  DateStyle:(WSDateStyle)style completelp:(void(^)(NSString *  dateString))completelp{
    WSDatePickerView *datepicker =   [[WSDatePickerView alloc]initWithDateStyle:style CompleteBlock:^(NSDate  *selectDate) {
        
        NSString *dateString = @"";
        switch (style) {
            case DateStyleShowYearMonthDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
            }break;
            case DateStyleShowMonthDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"MM-dd HH:mm"];
            }break;
            case DateStyleShowYearMonthDay:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM-dd"];
            }break;
            case DateStyleShowYearMonth:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM"];
            }break;
            case DateStyleShowMonthDay:{
                dateString = [selectDate stringWithFormat:@"MM-dd"];
            }break;
            case DateStyleShowHourMinute:{
                dateString = [selectDate stringWithFormat:@"HH:mm"];
            }break;
            case DateStyleShowYear:{
                dateString = [selectDate stringWithFormat:@"yyyy"];
            }break;
            case DateStyleShowMonth:{
                dateString = [selectDate stringWithFormat:@"MM"];
            }break;
            case DateStyleShowDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"dd HH:mm"];
            }break;
            default:
                break;
        }
        if (completelp) {
            completelp(dateString);
        }
    }];
    datepicker.dateLabelColor = [UIColor appTextColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.minLimitDate = date;
    datepicker.title = title;
    [datepicker show];
}
+(void)showDateViewWithscrollToDate:(NSDate *)date Title:(NSString *)title DateStyle:(WSDateStyle)style NowDate_is_Max_Min:(NSString *)max_min completelp:(void(^)(NSString *  dateString))completelp{
    WSDatePickerView *datepicker =   [[WSDatePickerView alloc]initWithDateStyle:style scrollToDate:date CompleteBlock:^(NSDate *selectDate) {
        NSString *dateString = @"";
        switch (style) {
            case DateStyleShowYearMonthDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM-dd HH:mm"];
            }break;
            case DateStyleShowMonthDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"MM-dd HH:mm"];
            }break;
            case DateStyleShowYearMonthDay:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM-dd"];
            }break;
            case DateStyleShowYearMonth:{
                dateString = [selectDate stringWithFormat:@"yyyy-MM"];
            }break;
            case DateStyleShowMonthDay:{
                dateString = [selectDate stringWithFormat:@"MM-dd"];
            }break;
            case DateStyleShowHourMinute:{
                dateString = [selectDate stringWithFormat:@"HH:mm"];
            }break;
            case DateStyleShowYear:{
                dateString = [selectDate stringWithFormat:@"yyyy"];
            }break;
            case DateStyleShowMonth:{
                dateString = [selectDate stringWithFormat:@"MM"];
            }break;
            case DateStyleShowDayHourMinute:{
                dateString = [selectDate stringWithFormat:@"dd HH:mm"];
            }break;
            default:
                break;
        }
        if (completelp) {
            completelp(dateString);
        }
    }];
    datepicker.dateLabelColor = [UIColor appTextColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    if ([max_min isEqualToString:@"max"]) {
        datepicker.maxLimitDate = [NSDate date];
    }else if ([max_min isEqualToString:@"min"]) {
        datepicker.minLimitDate = [NSDate date];
    }else if ([max_min isEqualToString:@"hidden"]) {
        datepicker.hideBackgroundYearLabel = YES;
    }else{
        
    }
    datepicker.title = title;
    [datepicker show];
}
@end
