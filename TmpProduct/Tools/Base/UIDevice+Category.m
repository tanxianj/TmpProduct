//
//  UIDevice+Category.m
//  TmoProduct
//
//  Created by Admin on 2019/11/20.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "UIDevice+Category.h"
#import <GBDeviceInfo.h>

@implementation UIDevice (Category)

- (BOOL)isX{
    if ([GBDeviceInfo deviceInfo].model == GBDeviceModeliPhoneX) {
        return YES;
    }
    if (kScreenHeight >= 812.f) {
        return YES;
    }
    return NO;
}

@end
