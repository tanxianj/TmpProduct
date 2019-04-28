//
//  NSDateFormatter+XCCacheDateFormattter.m
//  消汇邦
//
//  Created by 1244 on 2017/7/27.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "NSDateFormatter+XCCacheDateFormattter.h"

static NSDateFormatter *cachedDateFormatter = nil;
@implementation NSDateFormatter (XCCacheDateFormattter)

+ (NSDateFormatter *)cachedDateFormatter{
    if (!cachedDateFormatter) {
        cachedDateFormatter = [[NSDateFormatter alloc]init];
        cachedDateFormatter.locale = [NSLocale currentLocale];
        cachedDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    return cachedDateFormatter;
}

@end
