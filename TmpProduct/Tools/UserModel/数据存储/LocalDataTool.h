//
//  LocalDataTool.h
//  TmoProduct
//
//  Created by 谭显敬 on 2019/5/5.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalDataTool : NSObject

#pragma mark -
/*登录数据*/
+ (NSDictionary *)readKeepUserInfo;
+ (void)writeKeepUserInfo:(NSDictionary *)info;
+ (void)removeKeepUserInfo;
/*用户默认数据 店铺*/
+ (NSDictionary *)readUserInfoAndAshop;
+ (void)writeUserInfoAndAshop:(NSDictionary *)info;
+ (void)removeUserInfoAndAshop;
/*用户收益数据*/
+ (NSDictionary *)readgetearnings;

+ (void)writegetearnings:(NSDictionary *)info;

+ (void)removegetearnings;
@end
