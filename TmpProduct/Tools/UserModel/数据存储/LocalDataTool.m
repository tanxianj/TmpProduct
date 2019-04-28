//
//  LocalDataTool.m
//  TmoProduct
//
//  Created by 谭显敬 on 2019/5/5.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "LocalDataTool.h"
#import <YYCache/YYCache.h>
#import "getearningsModel.h"


@implementation LocalDataTool
#pragma mark -
/*登录时数据*/
+ (NSDictionary *)readKeepUserInfo {
    YYCache *User = [YYCache cacheWithName:@"User"];
    return (NSDictionary *)[User objectForKey:@"UserInfo"];
}

+ (void)writeKeepUserInfo:(NSDictionary *)info {
    YYCache *User = [YYCache cacheWithName:@"User"];
    [User setObject:info forKey:@"UserInfo"];
    [UserInfoAndShopModel attempDealloc];
    [UserModel attempDealloc];
    [HTTPSessionManager attempDealloc];
}

+ (void)removeKeepUserInfo{
    YYCache *emojiInfo = [YYCache cacheWithName:@"User"];
    [emojiInfo removeObjectForKey:@"UserInfo"];
    [UserInfoAndShopModel attempDealloc];
    [UserModel attempDealloc];
    [HTTPSessionManager attempDealloc];
}

/*用户默认数据 店铺*/
+ (NSDictionary *)readUserInfoAndAshop{
    YYCache *User = [YYCache cacheWithName:@"User"];
    return (NSDictionary *)[User objectForKey:@"UserInfoAndShop"];
}
+ (void)writeUserInfoAndAshop:(NSDictionary *)info {
    YYCache *User = [YYCache cacheWithName:@"User"];
    [User setObject:info forKey:@"UserInfoAndShop"];
    [UserInfoAndShopModel attempDealloc];
    [UserModel attempDealloc];
    [HTTPSessionManager attempDealloc];
}

+ (void)removeUserInfoAndAshop{
    YYCache *emojiInfo = [YYCache cacheWithName:@"User"];
    [emojiInfo removeObjectForKey:@"UserInfoAndShop"];
    [UserInfoAndShopModel attempDealloc];
    [UserModel attempDealloc];
    [HTTPSessionManager attempDealloc];
}
/*用户收益数据*/
+ (NSDictionary *)readgetearnings {
    YYCache *User = [YYCache cacheWithName:@"User"];
    return (NSDictionary *)[User objectForKey:@"getearnings"];
}

+ (void)writegetearnings:(NSDictionary *)info {
    YYCache *User = [YYCache cacheWithName:@"User"];
    [User setObject:info forKey:@"getearnings"];
    [getearningsModel attempDealloc];
    
}

+ (void)removegetearnings{
    YYCache *emojiInfo = [YYCache cacheWithName:@"User"];
    [emojiInfo removeObjectForKey:@"getearnings"];
    
    [UserInfoAndShopModel attempDealloc];
    [getearningsModel attempDealloc];
    [UserModel attempDealloc];
    [HTTPSessionManager attempDealloc];
}

@end
