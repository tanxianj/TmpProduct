//
//	OrdeCreateModel.h

//  创建于 20/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrdeCreateModel : NSObject

@property (nonatomic, strong) NSString * activity;
@property (nonatomic, strong) NSString * coupon;
@property (nonatomic, strong) NSString * goods_info;
@property (nonatomic, strong) NSString * note;
@property (nonatomic, strong) NSString * order_money;
@property (nonatomic, strong) NSString * pay_code;
@property (nonatomic, strong) NSString * shop_id;
@property (nonatomic, strong) NSString * total_money;
@property (nonatomic, strong) NSString * user_id;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end