//
//  RespondModel.m
//  TmoProduct
//
//  Created by 1244 on 2019/8/18.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "RespondModel.h"

NSString *const kRespondCode = @"status";
NSString *const kRespondData = @"data";
NSString *const kRespondDesc = @"message";
@implementation RespondModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kRespondCode] isKindOfClass:[NSNull class]]){
        self.status = [dictionary[kRespondCode] integerValue];
    }
    
    if(![dictionary[kRespondData] isKindOfClass:[NSNull class]]){
        self.data = dictionary[kRespondData];
    }
    
    if(![dictionary[kRespondDesc] isKindOfClass:[NSNull class]]){
        self.message = dictionary[kRespondDesc];
    }
    return self;
}

@end

//列表模型
@implementation ListPage

@end

@implementation ListData
@end

@implementation ListModel
///// dic -> model
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    return YES;
//}
///// model -> Dic
//- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
//    return YES;
//}
@end

