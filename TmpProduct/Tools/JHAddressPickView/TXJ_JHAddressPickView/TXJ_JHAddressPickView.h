//
//  TXJ_JHAddressPickView.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHAddressPickView.h"

@interface TXJ_JHAddressPickView : NSObject

/**
 显示日历地址选择器

 @param vc 当前控制器
 @param columns 显示等级 默认3级
 @param complet 结果
 */
+(void)showJHAddressPickView:(ViewController *)vc columns:(NSInteger)columns complet:(void(^)(NSDictionary *dic))complet;
@end
