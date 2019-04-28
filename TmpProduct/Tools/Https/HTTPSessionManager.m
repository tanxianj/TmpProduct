

#import "HTTPSessionManager.h"

#import <YYModel.h>

#import "RespondModel.h"

#import "AppDelegate.h"
#import "KeyChainTool.h"
#import "ViewController.h"



//#ifdef DEBUG
////NSString *const BaseUrl = @"http://test.qiao-ou.com";
//NSString *const BaseUrl = @"http://192.168.0.115";
//#else
NSString *const BaseUrl = @"https://j.qiao-ou.com";
//#endif



@implementation HTTPSessionManager

static dispatch_once_t onceToken;
static HTTPSessionManager *manager;

#pragma mark -

+ (instancetype)sharedManager {
    dispatch_once(&onceToken, ^{
        
        manager = [[HTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:BaseUrl]];
          
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        manager.requestSerializer.timeoutInterval         = 30.f;
        // 上传版本号
//        NSString *version                                 = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//        [manager.requestSerializer setValue:version ? version : @"" forHTTPHeaderField:@"VERSION"];
//        // 上传约定Build号
//        [manager.requestSerializer setValue:kNetworkBuildNumber     forHTTPHeaderField:@"BUILD"];
//
//        //
//        [manager.requestSerializer setValue:OSTYPE                  forHTTPHeaderField:@"OS"];
//
//
//        //idf
//        [manager.requestSerializer setValue:[KeyChainTool UUID] forHTTPHeaderField:@"device-num"];
        

    });
    
    // 上传用户Token
    NSString *token                                   = [UserModel sharedUserModel].token;
    [manager.requestSerializer setValue:token ? token : @""     forHTTPHeaderField:@"Authorization"];
//    [manager.requestSerializer setValue:@"XXXSRA3AUT70ZES3" forHTTPHeaderField:@"app-key"];
    return manager;
}


+(void)attempDealloc{
    onceToken = 0; //
    manager = nil;
}


- (NSURLSessionDataTask *)GET:(NSString *)urlString
                   parameters:(NSDictionary *)parameters
                     callBack:(NetworkRequestCallBack)callBack {
    
    
    return [self GET:urlString
          parameters:parameters
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable  responseObject) {
                 
                 txjLog(@"%@\n%@\n%@",urlString,parameters,responseObject);
                 [self handleRespond:responseObject
                               error:nil
                            callBack:callBack];
                 
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 
                 [self handleRespond:nil
                               error:error
                            callBack:callBack];
                 txjLog(@"%@\n%@\n%@",urlString,parameters,error);
                 
             }];    
}


- (NSURLSessionDataTask *)POST:(NSString *)urlString
                    parameters:(NSDictionary *)parameters
                      callBack:(NetworkRequestCallBack)callBack {
    return [self POST:urlString
           parameters:parameters
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  
                  txjLog(@"✅%@\n%@\n%@",urlString,parameters,responseObject);
                  [self handleRespond:responseObject
                                error:nil
                             callBack:callBack];
                  
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  
//                  NSAssert(NO, @"NetworkError");
                  txjLog(@"❌%@\n%@\n%@",urlString,parameters,error);
                  [self handleRespond:nil
                                error:error
                             callBack:callBack];
                  
              }];
}


- (NSURLSessionDataTask *)listGET:(NSString *)urlString
                             page:(NSInteger)page
                       parameters:(NSDictionary *)parameters
                         callBack:(ListRequestCallBack)callBack{
    
    NSMutableDictionary *para = [NSMutableDictionary dictionaryWithDictionary:parameters];
    if (page != -1) {
        [para setObject:@(page) forKey:@"page"];
        [para setObject:@(20) forKey:@"pagesize"];
    }
    
    return [self GET:urlString
          parameters:para
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable  responseObject) {
                 
                 txjLog(@"%@\n%@\n%@",urlString,para,responseObject);
                 if (callBack) {
                     callBack([ListModel yy_modelWithJSON:responseObject],[[RespondModel alloc]initWithDictionary:responseObject].data);
                 }
                 
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 
                 txjLog(@"%@\n%@\n%@",urlString,para,error);
                 [self requestListFailureWithError:error
                                          callBack:callBack];
                 
             }];
}

- (NSURLSessionDataTask *)listPOST:(NSString *)urlString
                             page:(NSInteger)page
                       parameters:(NSDictionary *)parameters
                         callBack:(ListRequestCallBack)callBack{
    
    NSMutableDictionary *para = [NSMutableDictionary dictionaryWithDictionary:parameters];
    if (page != -1) {
        [para setObject:@(page) forKey:@"page"];
        [para setObject:@(20) forKey:@"pagesize"];
    }
    if ([parameters objectForKey:@"pagesize"]) {
        [para setObject:parameters[@"pagesize"] forKey:@"pagesize"];
    }
    
    return [self POST:urlString
          parameters:para
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable  responseObject) {
                 
                 txjLog(@"%@\n%@\n%@",urlString,para,responseObject);
                 if (callBack) {
                     callBack([ListModel yy_modelWithJSON:responseObject],[[RespondModel alloc]initWithDictionary:responseObject].data);
                 }
                 
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 
                 txjLog(@"%@\n%@\n%@",urlString,para,error);
                 [self requestListFailureWithError:error
                                          callBack:callBack];
                 
             }];
}
/**
 处理网络请求的成功和失败
 
 @param responseObject 相应的数据
 @param error 错误，可为空
 @param callBack 返回RespondModel
 */
- (void)handleRespond:(id)responseObject error:(NSError *)error callBack:(NetworkRequestCallBack)callBack{
    if (!error) {
        RespondModel *model = [[RespondModel alloc]initWithDictionary:responseObject];
        
        //处理验证失败
        if (model.status == RespondCodeUnauthorized) {
            
            AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            //用于退出登录
//            [appDelegate exit];
            
        }else if (model.status == RespondCodeAlert){
            
            callBack(model);
            
        }else{
            
            callBack(model);
            
        }
        
    }else{
        RespondModel *model = [[RespondModel alloc] init];
        if (error.code == 3840) {
            model.status          = RespondCodeNotJson;
            model.message          = @"服务器开小差，请稍后再试";
        }else if (error.code == -1001){
            model.status          = RespondCodeError;
            model.message          = @"请求超时，请重试";
        }else{
            model.status          = RespondCodeError;
            model.message          = kNetworkErrorPromptText;
        }
        callBack(model);
    }
    
}

#pragma mark -

- (void)cancelAllTasks {
    [self.tasks makeObjectsPerformSelector:@selector(cancel)];
}


// 失败回调
- (void)requestListFailureWithError:(NSError * _Nonnull)error callBack:(ListRequestCallBack)callBack {
    ListModel *model      = [[ListModel alloc] init];
    model.status                              = -1;
    model.message                              = kNetworkErrorPromptText;
    if (callBack) {
        callBack(model,nil);
    }
}



@end
