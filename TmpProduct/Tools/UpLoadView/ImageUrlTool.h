//
//  ImageUrlTool.h
//  消汇邦
//
//  Created by 罗建 on 2017/4/27.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUrlTool : NSObject


+ (NSURL *)userAvatarImageUrlWithUid:(NSString *)uid;
+ (NSURL *)groupAvatarImageUrlWithGroupId:(NSString *)groupId;

+ (NSURL *)goodsImageUrlWithImageName:(NSString *)name width:(NSInteger)width height:(NSInteger)height;
+ (NSURL *)userAvatarImageUrlWithUid:(NSString *)uid width:(NSInteger)width height:(NSInteger)height;
+ (NSURL *)groupAvatarImageUrlWithGroupId:(NSString *)groupId width:(NSInteger)width height:(NSInteger)height;


/**
 用于返回商品、评价列表图片链接

 @param name 尺寸为屏幕三分之一
 @return 
 */
+ (NSURL *)commonImageUrlWithName:(NSString *)name;


/**
 原图

 @param name 图片链接
 @return
 */
+ (NSURL *)originImageWithName:(NSString *)name;

+ (NSURL *)originUserAvatarImageUrlWithUid:(NSString *)uid;

@end
