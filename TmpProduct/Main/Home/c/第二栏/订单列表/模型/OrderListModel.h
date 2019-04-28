//
//	OrderListModel.h

//  创建于 22/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListOrder_good.h"

@interface OrderListModel : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, assign) NSInteger admin_id;
@property (nonatomic, strong) NSString * appointment_time;
@property (nonatomic, strong) NSString * area_name;
@property (nonatomic, strong) NSString * cancel_time;
@property (nonatomic, assign) NSInteger city;
@property (nonatomic, strong) NSString * city_name;
@property (nonatomic, strong) NSString * coupon_money;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * deleted_at;
@property (nonatomic, assign) NSInteger district;
@property (nonatomic, strong) NSString * hexiao_time;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger is_appointment;
@property (nonatomic, assign) NSInteger is_cancel;
@property (nonatomic, assign) NSInteger is_comment;
@property (nonatomic, assign) NSInteger is_hexiao;
@property (nonatomic, assign) NSInteger is_refund;
@property (nonatomic, assign) NSInteger mmerchant_id;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * note;
@property (nonatomic, assign) NSInteger order_comments;
@property (nonatomic, strong) NSString * order_coupon;
@property (nonatomic, strong) NSArray * order_goods;
@property (nonatomic, strong) NSString * order_money;
@property (nonatomic, strong) NSString * order_sn;
@property (nonatomic, strong) NSString * pay_code;
@property (nonatomic, strong) NSString * pay_name;
@property (nonatomic, assign) NSInteger pay_status;
@property (nonatomic, strong) NSString * pay_time;
@property (nonatomic, assign) NSInteger province;
@property (nonatomic, strong) NSString * province_name;
@property (nonatomic, strong) NSString * refund_time;
@property (nonatomic, assign) NSInteger shipping_status;
@property (nonatomic, assign) NSInteger shop_id;
@property (nonatomic, strong) NSString * shop_name;
@property (nonatomic, strong) NSString * sq_cancel_time;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * status_time;
@property (nonatomic, strong) NSString * total_money;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString * updated_at;
@property (nonatomic, assign) NSInteger user_id;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end