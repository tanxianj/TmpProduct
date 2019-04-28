//
//  NSString+LabStyle.m
//  消汇邦
//
//  Created by 谭显敬 on 2018/9/28.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import "NSString+LabStyle.h"

@implementation NSString (LabStyle)
+ (NSAttributedString *)stringTwoFirst:(NSString *)str1
                             font1Size:(CGFloat)Font1size
                                color1:(UIColor *)color1
                                second:(NSString *)str2
                             font2size:(CGFloat)font2size
                                color2:(UIColor *)color2{
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",str1,str2]];
    
    [str addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(0,str1.length)];
    [str addAttribute:NSForegroundColorAttributeName value:color2 range:NSMakeRange(str1.length,str2.length)];
    
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"FolioBT-BoldCondensed" size:Font1size] range:NSMakeRange(0,str1.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:font2size] range:NSMakeRange(str1.length,str2.length)];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//调整行间距
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    return str;
}
+(NSAttributedString *)AttributedString:(NSArray *)strArray FontSizeArray:(NSArray *)fontSizeArray ColorsArray:(NSArray *)colorArray{
    NSString *tmpStr = @"";
    NSMutableArray *tmpArray = [self BackRangeArrayWithStringArray:strArray];
    for (NSString *str in strArray) {
        tmpStr = [NSString stringWithFormat:@"%@%@",tmpStr,str];
    }
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:tmpStr];
    for (int i = 0; i<strArray.count; i++) {

        [str addAttribute:NSForegroundColorAttributeName value:colorArray[i] range:[tmpArray[i] rangeValue]];
//        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"FolioBT-BoldCondensed" size:[fontSizeArray[i] floatValue]] range:NSMakeRange(0,strr.length)];
        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:[fontSizeArray[i] floatValue]] range:[tmpArray[i] rangeValue]];
    }
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//调整行间距
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    return str;
}
+(NSMutableArray*)BackRangeArrayWithStringArray:(NSArray <NSString *>*)stringArray{
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSString *str = @"";
    for (NSString *strr in stringArray) {
        str = [NSString stringWithFormat:@"%@%@",str,strr];
        
    }
    for (NSString *strr in stringArray) {
        /*
         for (NSString * range in [self rangeOfSubString:strr inString:str]) {
         if (![tmpArray containsObject:range] ) {
         [tmpArray addObjectsFromArray:[self rangeOfSubString:strr inString:str]];
         }
         }
         */
        [tmpArray addObjectsFromArray:[self rangeOfSubString:strr inString:str]];
        
    }
    NSSet *set = [NSSet setWithArray:tmpArray.copy];
    [tmpArray removeAllObjects];
    for (NSString *str in set) {
        [tmpArray addObject:str];
    }
//    txjLog(@"%@",tmpArray);
    for (int i = 0; i < tmpArray.count; i++) {
        for (int j = 0; j < tmpArray.count - 1 - i;j++) {
            if ([tmpArray[j+1] rangeValue].location < [tmpArray[j]  rangeValue].location) {
                NSString * tmp = tmpArray[j] ;
                [tmpArray replaceObjectAtIndex:j withObject:tmpArray[j + 1]];
                [tmpArray replaceObjectAtIndex:j+1 withObject:tmp];
            }
        }
    }
//    txjLog(@"冒泡升序排序后结果：%@", tmpArray);

    return tmpArray;
}
+(NSArray*)rangeOfSubString:(NSString*)subStr inString:(NSString*)string {
    NSMutableArray * rangeArray = [NSMutableArray array];
    NSString *string1 = [string stringByAppendingString:subStr];
    NSString *temp;/*
                          for(int i =0; i < string.length; i ++) {
                                temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
                                if ([temp isEqualToString:subStr]) {
                                      NSRange range = {i,subStr.length};
                                      [rangeArray addObject: [NSValue valueWithRange:range]];
                                }
                          }
                    */
    for (int i = 0; i<string.length; i++) {
        temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject:[NSValue valueWithRange:range]];
        }
    }
    return rangeArray;
}
@end
