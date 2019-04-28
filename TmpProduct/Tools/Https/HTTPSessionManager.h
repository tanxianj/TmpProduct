//
//  HTTPSessionManager.h
//  TmoProduct
//
//  Created by 1244 on 2019/6/13.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RespondModel.h"

#import <AFNetworking/AFNetworking.h>

extern NSString *const kNetworkBuildNumber;

typedef void(^NetworkRequestCallBack)(RespondModel *responseModel);
typedef void(^ListRequestCallBack)(ListModel *responseModel,id responseObject);

//typedef NS_ENUM(NSUInteger, RequestHTTPMethod) {
//    RequestHTTPMethodGET,
//    RequestHTTPMethodPOST,
//};


/**
 网络请求t封装方法
 */
@interface HTTPSessionManager : AFHTTPSessionManager


// 单例
+ (instancetype)sharedManager;



/**
 销毁单例，用于切换环境
 */
+(void)attempDealloc;

// GET、POST请求
- (NSURLSessionDataTask *)GET:(NSString *)urlString  parameters:( NSDictionary *)parameters callBack:(NetworkRequestCallBack)callBack;
- (NSURLSessionDataTask *)POST:(NSString *)urlString  parameters:( NSDictionary *)parameters callBack:(NetworkRequestCallBack)callBack;


/**
 通用的列表请求方法

 @param urlString urlString description
 @param page 当前页码，传入-1意味着不使用分页
 @param parameters 参数，nullable
 @param callBack    1
 @return    1
 */
- (NSURLSessionDataTask *)listGET:(NSString *)urlString page:(NSInteger)page parameters:(NSDictionary *)parameters callBack:(ListRequestCallBack)callBack;
//同上
- (NSURLSessionDataTask *)listPOST:(NSString *)urlString
                              page:(NSInteger)page
                        parameters:(NSDictionary *)parameters
                          callBack:(ListRequestCallBack)callBack;
// 取消所有请求
- (void)cancelAllTasks;


@end
