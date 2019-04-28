//
//  NSString+OnlyNumber.m
//  消汇邦
//
//  Created by 罗建 on 2017/5/20.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "NSString+OnlyNumber.h"


@implementation NSString (OnlyNumber)


- (NSString *)allNumbers {
    return [[self componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] componentsJoinedByString:@""];
}


@end
