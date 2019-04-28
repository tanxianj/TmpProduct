//
//  ImageUrlTool.m
//  消汇邦
//
//  Created by 罗建 on 2017/4/27.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "ImageUrlTool.h"



@implementation ImageUrlTool


#pragma mark -

+ (NSURL *)userAvatarImageUrlWithUid:(NSString *)uid {
//    if ([uid isEqualToString:[UserModel sharedUserModel].uid]) {
////        return [self userAvatarImageUrlWithUid:uid width:kScreenWidth height:kScreenWidth];
//        return [self originUserAvatarImageUrlWithUid:uid];
//    }
//    else {
        return [self userAvatarImageUrlWithUid:uid width:60 height:60];
//    }
}

+ (NSURL *)groupAvatarImageUrlWithGroupId:(NSString *)groupId {
    return [self groupAvatarImageUrlWithGroupId:groupId width:60 height:60];
}


#pragma mark -
+ (NSURL *)commonImageUrlWithName:(NSString *)name{
    return [self goodsImageUrlWithImageName:name width:kScreenWidth / 3.f height:kScreenWidth / 3.f];
}

+ (NSURL *)goodsImageUrlWithImageName:(NSString *)name width:(NSInteger)width height:(NSInteger)height {
    if ([name rangeOfString:@"http"].location == 0) {
        return [NSURL URLWithString:name];
    }
    else {
        return [self imageUrlWithImageType:0 imageName:name width:width height:height];
    }
}

+ (NSURL *)userAvatarImageUrlWithUid:(NSString *)uid width:(NSInteger)width height:(NSInteger)height {
    return [self imageUrlWithImageType:1 imageName:uid width:width height:height];
}

+ (NSURL *)groupAvatarImageUrlWithGroupId:(NSString *)groupId width:(NSInteger)width height:(NSInteger)height {
    return [self imageUrlWithImageType:2 imageName:groupId width:width height:height];
}

+ (NSURL *)originUserAvatarImageUrlWithUid:(NSString *)uid{
//    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/avatar/%@.png", [self imageUrlHost],  uid]];
//    return [[self class]imageUrlWithImageType:2 imageName:uid width:960 height:960];
    return [self imageUrlWithImageType:1 imageName:uid width:960 height:960];
}

#pragma mark -

+ (NSURL *)imageUrlWithImageType:(NSInteger)type imageName:(NSString *)name width:(NSInteger)width height:(NSInteger)height {
    // type: 0为商品，1为用户，2为群组
    NSArray *parameters = @[@[@"", @""],
                            @[@"/avatar", @".png"],
                            @[@"/avatarGroup", @".png"]];
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@%@?x-oss-process=image/resize,w_%ld,h_%ld", [self imageUrlHost], parameters[type][0], name, parameters[type][1], (long)(width * kScreenScale), (long)(height * kScreenScale)]];
}

+ (NSURL *)originImageWithName:(NSString *)name{
    if ([name rangeOfString:@"http"].location == 0) {
        return [NSURL URLWithString:name];
    }
    else {
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", [self imageUrlHost],  name]];
    }

}


#pragma mark -

+ (NSString *)imageUrlHost {
    NSString *imageUrlHost = @"";
    /*
    NSString *imageUrlHost = [AppConfigModel sharedModel].oss_url;
    if (!imageUrlHost) {
#ifdef DEBUG
        
        switch ([[[NSUserDefaults standardUserDefaults] objectForKey:apiSelect] integerValue]) {
            case 0:imageUrlHost = @"https://file.xiaohuibang.cn"; break;
            case 1:imageUrlHost = @"https://file.xiaohuibang.com";break;
            case 2:imageUrlHost = @"https://file.xiaohuibang.cn";break;
            default:break;
        }
#else
        imageUrlHost = @"https://file.xiaohuibang.com";
#endif
    }
     */
    return imageUrlHost;
}


@end
