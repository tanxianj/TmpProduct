//
//  RespondModel.h
//  TmoProduct
//
//  Created by 1244 on 2019/8/18.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RespondCode) {
    RespondCodeError        = -1,           //请求失败
    RespondCodeSuccess      = 200,          //请求成功
    RespondCodeUnauthorized = 801,          //请求超时
    RespondCodeNotJson      = 3840,         //非Json数据
    RespondCodeAlert        = 802           //信息验证失败弹底部出Alert
    
};

@interface RespondModel : NSObject

@property (nonatomic, assign) RespondCode status;     //请求code号
@property (nonatomic, copy  ) NSString  *message;      //请求信息
@property (nonatomic, strong) id        data;       //请求数据

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end



//列表模型
@interface ListPage : NSObject

@property (nonatomic, assign) NSInteger total;              //总数
@property (nonatomic, assign) NSInteger current_page;       //当前页数
@property (nonatomic, assign) NSInteger per_page;           //每页多少个
@property (nonatomic, assign) NSInteger last_page;          //总页数

@end

//列表模型
@interface ListDataArray : NSObject

@property (nonatomic, assign) NSInteger total;              //总数
@property (nonatomic, assign) NSInteger current_page;       //当前页数
@property (nonatomic, assign) NSInteger per_page;           //每页多少个
@property (nonatomic, assign) NSInteger last_page;          //总页数

@end
@interface ListData : NSObject
//@property (nonatomic, strong) NSArray * list;               //列表数据
//@property (nonatomic, strong) ListPage * page;              //页数信息
@property (nonatomic, assign) NSInteger current_page;
@property (nonatomic, strong) NSArray * data;
@property (nonatomic, strong) NSString * first_page_url;
@property (nonatomic, assign) NSInteger from;
@property (nonatomic, assign) NSInteger last_page;
@property (nonatomic, strong) NSString * last_page_url;
@property (nonatomic, strong) NSObject * next_page_url;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, assign) NSInteger per_page;
@property (nonatomic, strong) NSObject * prev_page_url;
@property (nonatomic, assign) NSInteger to;
@property (nonatomic, assign) NSInteger total;
@end

@interface ListModel : NSObject
@property (nonatomic, assign) NSInteger status;               //请求号
@property (nonatomic, strong) ListData * data;              //数组模型
@property (nonatomic, strong) NSString * message;              //请求信息
@end
