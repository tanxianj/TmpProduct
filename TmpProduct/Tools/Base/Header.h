//
//  Header.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/12.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#ifndef Header_h
#define Header_h

#pragma mark - DEBUGLog

#ifdef DEBUG

#define WSSLog(format, ...)             NSLog((@"\n👉函数:%s"),                                 \
[[[NSString stringWithUTF8String: __FUNCTION__] lastPathComponent] UTF8String]);                \
fprintf(stderr, "👉内容:%s\n",                                                                         \
[[NSString stringWithFormat: format, ## __VA_ARGS__] UTF8String]);
//#define WSSLog DDLogDebug

#else

#define WSSLog(format, ...)             nil

#endif

#define SERVERBUILD                           @"20171114"
#define OSTYPE                                @"iOS"


#pragma mark - Color

#define kColorWithRGBA(r, g, b, a)      [UIColor colorWithRed:r / 255.f                                                                     \
green:g / 255.f                                                                     \
blue:b / 255.f                                                                     \
alpha:a]
#define kColorWithRGB(r, g, b)          kColorWithRGBA(r, g, b, 1.f)


#pragma mark - Screen

#define kScreenSize                     [UIScreen mainScreen].bounds.size
#define kScreenWidth                    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight                   [UIScreen mainScreen].bounds.size.height

#define kScreenBottomSpeac              [[UIApplication sharedApplication] statusBarFrame].size.height
#define kScreenTopIsX                   (kScreenHeight == 812.0 ? 34 : 0)

#define kScreenScale                    [UIScreen mainScreen].scale
#define kScreenWidthScale               (kScreenWidth  / 375)
#define kScreenHeightScale              (kScreenHeight / 667)
#define kScaleFrom_iPhone6_Desgin(_X_)  (_X_ * (kScreenWidth/375))


#pragma mark -

#define kCommonSpacing                  10
#define kOnePx                          (kScreenScale > 0.0 ? 1.0 / kScreenScale : 1.0)
#define kMessageMaxWidth                [UIScreen mainScreen].bounds.size.width - 130 - 26


#pragma mark -

#define kWeakSelf(type)                 __weak typeof(type) weak##type = type;
#define kStrongSelf(type)               __strong typeof(type) strong##type = type;


#pragma mark - Wechat

#define kWechatAppID                    @"wx246217311eb319c0"


#pragma mark - BMP

#define kBMPMapAppKey                   @"W2gMLLA55EhNEEOdPpixlsMUE6MNGHO9"


#pragma mark - Pgy

#define kPgyAppID                       @"1fad1c12ac3c30439a39acd47035a562"


#pragma mark - NIM

#define kNIMAppKey                      @"dd7aaa640869ef45961c15f88474340d"

//优惠码 提示文字
#define TXJFREE_CODE_DESC @"free_code_desc"
#ifdef DEBUG

#define kNIMCerName                     @"apsDevelopment"

#else

#define kNIMCerName                     @"aps"

#endif


#pragma mark - PromptText

#define kNoDataPromptText               @"您暂时没有相关数据"
#define kNetworkErrorPromptText         @"网络好像出错啦"
#define kNetwortErrorBtnTitle           @"立即刷新"


#define kWaiting                        @"请稍候…"
#define kRequesting                     @"请求中…"
#define kLoading                        @"加载中…"
#define KPlease                         @"请填写完整信息"

#pragma mark - Emoji

#define EMOJI_CODE_TO_SYMBOL(x)         ((((0x808080F0 | (x & 0x3F000) >> 4) | (x & 0xFC0) << 10) | (x & 0x1C0000) << 18) | (x & 0x3F) << 24);

//#define weakify(...) \\
//autoreleasepool {} \\
//metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)
//
//#define strongify(...) \\
//try {} @finally {} \\
//_Pragma("clang diagnostic push") \\
//_Pragma("clang diagnostic ignored \\"-Wshadow\\"") \\
//metamacro_foreach(rac_strongify_,, __VA_ARGS__) \\
//_Pragma("clang diagnostic pop")
#define ISX [UIDevice currentDevice].isX
//极光推送
extern NSString *const kJPFNetworkIsConnectingNotification; // 正在连接中

extern NSString * const kJPFNetworkDidSetupNotification; // 建立连接

extern NSString * const kJPFNetworkDidCloseNotification; // 关闭连接

extern NSString * const kJPFNetworkDidRegisterNotification; // 注册成功

extern NSString *const kJPFNetworkFailedRegisterNotification; //注册失败

extern NSString * const kJPFNetworkDidLoginNotification; // 登录成功

#endif /* Header_h */
