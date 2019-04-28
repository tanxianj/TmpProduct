//
//	OrderListOrder_good.h

//  创建于 22/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderListOrder_good : NSObject

@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, assign) NSInteger goods_id;
@property (nonatomic, strong) NSString * goods_money;
@property (nonatomic, strong) NSString * goods_name;
@property (nonatomic, assign) NSInteger goods_num;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger order_id;
@property (nonatomic, strong) NSString * total_money;
@property (nonatomic, strong) NSString * updated_at;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end