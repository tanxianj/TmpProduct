//
//  KeyChainTool.h
//  TmoProduct
//
//  Created by xiesiyu on 2018/7/24.
//  Copyright © 2018年 成都乔鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainTool : NSObject


/**
 防止恶意注册，新增设备UUID,判断设备注册次数

 */
+ (NSString *)UUID;

@end
