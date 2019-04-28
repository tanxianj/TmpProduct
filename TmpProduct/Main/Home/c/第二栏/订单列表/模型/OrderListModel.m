//
//	OrderListModel.m

//  创建于 22/4/2019
//	Copyright © 2019. All rights reserved.




#import "OrderListModel.h"

NSString *const kOrderListModelAddress = @"address";
NSString *const kOrderListModelAdmin_id = @"admin_id";
NSString *const kOrderListModelAppointment_time = @"appointment_time";
NSString *const kOrderListModelArea_name = @"area_name";
NSString *const kOrderListModelCancel_time = @"cancel_time";
NSString *const kOrderListModelCity = @"city";
NSString *const kOrderListModelCity_name = @"city_name";
NSString *const kOrderListModelCoupon_money = @"coupon_money";
NSString *const kOrderListModelCreated_at = @"created_at";
NSString *const kOrderListModelDeleted_at = @"deleted_at";
NSString *const kOrderListModelDistrict = @"district";
NSString *const kOrderListModelHexiao_time = @"hexiao_time";
NSString *const kOrderListModelIdField = @"id";
NSString *const kOrderListModelIs_appointment = @"is_appointment";
NSString *const kOrderListModelIs_cancel = @"is_cancel";
NSString *const kOrderListModelIs_comment = @"is_comment";
NSString *const kOrderListModelIs_hexiao = @"is_hexiao";
NSString *const kOrderListModelIs_refund = @"is_refund";
NSString *const kOrderListModelMmerchant_id = @"mmerchant_id";
NSString *const kOrderListModelMobile = @"mobile";
NSString *const kOrderListModelNote = @"note";
NSString *const kOrderListModelOrder_comments = @"order_comments";
NSString *const kOrderListModelOrder_coupon = @"order_coupon";
NSString *const kOrderListModelOrder_goods = @"order_goods";
NSString *const kOrderListModelOrder_money = @"order_money";
NSString *const kOrderListModelOrder_sn = @"order_sn";
NSString *const kOrderListModelPay_code = @"pay_code";
NSString *const kOrderListModelPay_name = @"pay_name";
NSString *const kOrderListModelPay_status = @"pay_status";
NSString *const kOrderListModelPay_time = @"pay_time";
NSString *const kOrderListModelProvince = @"province";
NSString *const kOrderListModelProvince_name = @"province_name";
NSString *const kOrderListModelRefund_time = @"refund_time";
NSString *const kOrderListModelShipping_status = @"shipping_status";
NSString *const kOrderListModelShop_id = @"shop_id";
NSString *const kOrderListModelShop_name = @"shop_name";
NSString *const kOrderListModelSq_cancel_time = @"sq_cancel_time";
NSString *const kOrderListModelStatus = @"status";
NSString *const kOrderListModelStatus_time = @"status_time";
NSString *const kOrderListModelTotal_money = @"total_money";
NSString *const kOrderListModelType = @"type";
NSString *const kOrderListModelUpdated_at = @"updated_at";
NSString *const kOrderListModelUser_id = @"user_id";

@interface OrderListModel ()
@end
@implementation OrderListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kOrderListModelAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kOrderListModelAddress];
	}	
	if(![dictionary[kOrderListModelAdmin_id] isKindOfClass:[NSNull class]]){
		self.admin_id = [dictionary[kOrderListModelAdmin_id] integerValue];
	}

	if(![dictionary[kOrderListModelAppointment_time] isKindOfClass:[NSNull class]]){
		self.appointment_time = dictionary[kOrderListModelAppointment_time];
	}	
	if(![dictionary[kOrderListModelArea_name] isKindOfClass:[NSNull class]]){
		self.area_name = dictionary[kOrderListModelArea_name];
	}	
	if(![dictionary[kOrderListModelCancel_time] isKindOfClass:[NSNull class]]){
		self.cancel_time = dictionary[kOrderListModelCancel_time];
	}	
	if(![dictionary[kOrderListModelCity] isKindOfClass:[NSNull class]]){
		self.city = [dictionary[kOrderListModelCity] integerValue];
	}

	if(![dictionary[kOrderListModelCity_name] isKindOfClass:[NSNull class]]){
		self.city_name = dictionary[kOrderListModelCity_name];
	}	
	if(![dictionary[kOrderListModelCoupon_money] isKindOfClass:[NSNull class]]){
		self.coupon_money = dictionary[kOrderListModelCoupon_money];
	}	
	if(![dictionary[kOrderListModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kOrderListModelCreated_at];
	}	
	if(![dictionary[kOrderListModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kOrderListModelDeleted_at];
	}	
	if(![dictionary[kOrderListModelDistrict] isKindOfClass:[NSNull class]]){
		self.district = [dictionary[kOrderListModelDistrict] integerValue];
	}

	if(![dictionary[kOrderListModelHexiao_time] isKindOfClass:[NSNull class]]){
		self.hexiao_time = dictionary[kOrderListModelHexiao_time];
	}	
	if(![dictionary[kOrderListModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kOrderListModelIdField] integerValue];
	}

	if(![dictionary[kOrderListModelIs_appointment] isKindOfClass:[NSNull class]]){
		self.is_appointment = [dictionary[kOrderListModelIs_appointment] integerValue];
	}

	if(![dictionary[kOrderListModelIs_cancel] isKindOfClass:[NSNull class]]){
		self.is_cancel = [dictionary[kOrderListModelIs_cancel] integerValue];
	}

	if(![dictionary[kOrderListModelIs_comment] isKindOfClass:[NSNull class]]){
		self.is_comment = [dictionary[kOrderListModelIs_comment] integerValue];
	}

	if(![dictionary[kOrderListModelIs_hexiao] isKindOfClass:[NSNull class]]){
		self.is_hexiao = [dictionary[kOrderListModelIs_hexiao] integerValue];
	}

	if(![dictionary[kOrderListModelIs_refund] isKindOfClass:[NSNull class]]){
		self.is_refund = [dictionary[kOrderListModelIs_refund] integerValue];
	}

	if(![dictionary[kOrderListModelMmerchant_id] isKindOfClass:[NSNull class]]){
		self.mmerchant_id = [dictionary[kOrderListModelMmerchant_id] integerValue];
	}

	if(![dictionary[kOrderListModelMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kOrderListModelMobile];
	}	
	if(![dictionary[kOrderListModelNote] isKindOfClass:[NSNull class]]){
		self.note = dictionary[kOrderListModelNote];
	}	
	if(![dictionary[kOrderListModelOrder_comments] isKindOfClass:[NSNull class]]){
		self.order_comments = [dictionary[kOrderListModelOrder_comments] integerValue];
	}

	if(![dictionary[kOrderListModelOrder_coupon] isKindOfClass:[NSNull class]]){
		self.order_coupon = dictionary[kOrderListModelOrder_coupon];
	}	
	if(dictionary[kOrderListModelOrder_goods] != nil && [dictionary[kOrderListModelOrder_goods] isKindOfClass:[NSArray class]]){
		NSArray * order_goodsDictionaries = dictionary[kOrderListModelOrder_goods];
		NSMutableArray * order_goodsItems = [NSMutableArray array];
		for(NSDictionary * order_goodsDictionary in order_goodsDictionaries){
			OrderListOrder_good * order_goodsItem = [[OrderListOrder_good alloc] initWithDictionary:order_goodsDictionary];
			[order_goodsItems addObject:order_goodsItem];
		}
		self.order_goods = order_goodsItems;
	}
	if(![dictionary[kOrderListModelOrder_money] isKindOfClass:[NSNull class]]){
		self.order_money = dictionary[kOrderListModelOrder_money];
	}	
	if(![dictionary[kOrderListModelOrder_sn] isKindOfClass:[NSNull class]]){
		self.order_sn = dictionary[kOrderListModelOrder_sn];
	}	
	if(![dictionary[kOrderListModelPay_code] isKindOfClass:[NSNull class]]){
		self.pay_code = dictionary[kOrderListModelPay_code];
	}	
	if(![dictionary[kOrderListModelPay_name] isKindOfClass:[NSNull class]]){
		self.pay_name = dictionary[kOrderListModelPay_name];
	}	
	if(![dictionary[kOrderListModelPay_status] isKindOfClass:[NSNull class]]){
		self.pay_status = [dictionary[kOrderListModelPay_status] integerValue];
	}

	if(![dictionary[kOrderListModelPay_time] isKindOfClass:[NSNull class]]){
		self.pay_time = dictionary[kOrderListModelPay_time];
	}	
	if(![dictionary[kOrderListModelProvince] isKindOfClass:[NSNull class]]){
		self.province = [dictionary[kOrderListModelProvince] integerValue];
	}

	if(![dictionary[kOrderListModelProvince_name] isKindOfClass:[NSNull class]]){
		self.province_name = dictionary[kOrderListModelProvince_name];
	}	
	if(![dictionary[kOrderListModelRefund_time] isKindOfClass:[NSNull class]]){
		self.refund_time = dictionary[kOrderListModelRefund_time];
	}	
	if(![dictionary[kOrderListModelShipping_status] isKindOfClass:[NSNull class]]){
		self.shipping_status = [dictionary[kOrderListModelShipping_status] integerValue];
	}

	if(![dictionary[kOrderListModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = [dictionary[kOrderListModelShop_id] integerValue];
	}

	if(![dictionary[kOrderListModelShop_name] isKindOfClass:[NSNull class]]){
		self.shop_name = dictionary[kOrderListModelShop_name];
	}	
	if(![dictionary[kOrderListModelSq_cancel_time] isKindOfClass:[NSNull class]]){
		self.sq_cancel_time = dictionary[kOrderListModelSq_cancel_time];
	}	
	if(![dictionary[kOrderListModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kOrderListModelStatus] integerValue];
	}

	if(![dictionary[kOrderListModelStatus_time] isKindOfClass:[NSNull class]]){
		self.status_time = dictionary[kOrderListModelStatus_time];
	}	
	if(![dictionary[kOrderListModelTotal_money] isKindOfClass:[NSNull class]]){
		self.total_money = dictionary[kOrderListModelTotal_money];
	}	
	if(![dictionary[kOrderListModelType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kOrderListModelType] integerValue];
	}

	if(![dictionary[kOrderListModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kOrderListModelUpdated_at];
	}	
	if(![dictionary[kOrderListModelUser_id] isKindOfClass:[NSNull class]]){
		self.user_id = [dictionary[kOrderListModelUser_id] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.address != nil){
		dictionary[kOrderListModelAddress] = self.address;
	}
	dictionary[kOrderListModelAdmin_id] = @(self.admin_id);
	if(self.appointment_time != nil){
		dictionary[kOrderListModelAppointment_time] = self.appointment_time;
	}
	if(self.area_name != nil){
		dictionary[kOrderListModelArea_name] = self.area_name;
	}
	if(self.cancel_time != nil){
		dictionary[kOrderListModelCancel_time] = self.cancel_time;
	}
	dictionary[kOrderListModelCity] = @(self.city);
	if(self.city_name != nil){
		dictionary[kOrderListModelCity_name] = self.city_name;
	}
	if(self.coupon_money != nil){
		dictionary[kOrderListModelCoupon_money] = self.coupon_money;
	}
	if(self.created_at != nil){
		dictionary[kOrderListModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kOrderListModelDeleted_at] = self.deleted_at;
	}
	dictionary[kOrderListModelDistrict] = @(self.district);
	if(self.hexiao_time != nil){
		dictionary[kOrderListModelHexiao_time] = self.hexiao_time;
	}
	dictionary[kOrderListModelIdField] = @(self.idField);
	dictionary[kOrderListModelIs_appointment] = @(self.is_appointment);
	dictionary[kOrderListModelIs_cancel] = @(self.is_cancel);
	dictionary[kOrderListModelIs_comment] = @(self.is_comment);
	dictionary[kOrderListModelIs_hexiao] = @(self.is_hexiao);
	dictionary[kOrderListModelIs_refund] = @(self.is_refund);
	dictionary[kOrderListModelMmerchant_id] = @(self.mmerchant_id);
	if(self.mobile != nil){
		dictionary[kOrderListModelMobile] = self.mobile;
	}
	if(self.note != nil){
		dictionary[kOrderListModelNote] = self.note;
	}
	dictionary[kOrderListModelOrder_comments] = @(self.order_comments);
	if(self.order_coupon != nil){
		dictionary[kOrderListModelOrder_coupon] = self.order_coupon;
	}
	if(self.order_goods != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(OrderListOrder_good * order_goodsElement in self.order_goods){
			[dictionaryElements addObject:[order_goodsElement toDictionary]];
		}
		dictionary[kOrderListModelOrder_goods] = dictionaryElements;
	}
	if(self.order_money != nil){
		dictionary[kOrderListModelOrder_money] = self.order_money;
	}
	if(self.order_sn != nil){
		dictionary[kOrderListModelOrder_sn] = self.order_sn;
	}
	if(self.pay_code != nil){
		dictionary[kOrderListModelPay_code] = self.pay_code;
	}
	if(self.pay_name != nil){
		dictionary[kOrderListModelPay_name] = self.pay_name;
	}
	dictionary[kOrderListModelPay_status] = @(self.pay_status);
	if(self.pay_time != nil){
		dictionary[kOrderListModelPay_time] = self.pay_time;
	}
	dictionary[kOrderListModelProvince] = @(self.province);
	if(self.province_name != nil){
		dictionary[kOrderListModelProvince_name] = self.province_name;
	}
	if(self.refund_time != nil){
		dictionary[kOrderListModelRefund_time] = self.refund_time;
	}
	dictionary[kOrderListModelShipping_status] = @(self.shipping_status);
	dictionary[kOrderListModelShop_id] = @(self.shop_id);
	if(self.shop_name != nil){
		dictionary[kOrderListModelShop_name] = self.shop_name;
	}
	if(self.sq_cancel_time != nil){
		dictionary[kOrderListModelSq_cancel_time] = self.sq_cancel_time;
	}
	dictionary[kOrderListModelStatus] = @(self.status);
	if(self.status_time != nil){
		dictionary[kOrderListModelStatus_time] = self.status_time;
	}
	if(self.total_money != nil){
		dictionary[kOrderListModelTotal_money] = self.total_money;
	}
	dictionary[kOrderListModelType] = @(self.type);
	if(self.updated_at != nil){
		dictionary[kOrderListModelUpdated_at] = self.updated_at;
	}
	dictionary[kOrderListModelUser_id] = @(self.user_id);
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.address != nil){
		[aCoder encodeObject:self.address forKey:kOrderListModelAddress];
	}
	[aCoder encodeObject:@(self.admin_id) forKey:kOrderListModelAdmin_id];	if(self.appointment_time != nil){
		[aCoder encodeObject:self.appointment_time forKey:kOrderListModelAppointment_time];
	}
	if(self.area_name != nil){
		[aCoder encodeObject:self.area_name forKey:kOrderListModelArea_name];
	}
	if(self.cancel_time != nil){
		[aCoder encodeObject:self.cancel_time forKey:kOrderListModelCancel_time];
	}
	[aCoder encodeObject:@(self.city) forKey:kOrderListModelCity];	if(self.city_name != nil){
		[aCoder encodeObject:self.city_name forKey:kOrderListModelCity_name];
	}
	if(self.coupon_money != nil){
		[aCoder encodeObject:self.coupon_money forKey:kOrderListModelCoupon_money];
	}
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kOrderListModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kOrderListModelDeleted_at];
	}
	[aCoder encodeObject:@(self.district) forKey:kOrderListModelDistrict];	if(self.hexiao_time != nil){
		[aCoder encodeObject:self.hexiao_time forKey:kOrderListModelHexiao_time];
	}
	[aCoder encodeObject:@(self.idField) forKey:kOrderListModelIdField];	[aCoder encodeObject:@(self.is_appointment) forKey:kOrderListModelIs_appointment];	[aCoder encodeObject:@(self.is_cancel) forKey:kOrderListModelIs_cancel];	[aCoder encodeObject:@(self.is_comment) forKey:kOrderListModelIs_comment];	[aCoder encodeObject:@(self.is_hexiao) forKey:kOrderListModelIs_hexiao];	[aCoder encodeObject:@(self.is_refund) forKey:kOrderListModelIs_refund];	[aCoder encodeObject:@(self.mmerchant_id) forKey:kOrderListModelMmerchant_id];	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kOrderListModelMobile];
	}
	if(self.note != nil){
		[aCoder encodeObject:self.note forKey:kOrderListModelNote];
	}
	[aCoder encodeObject:@(self.order_comments) forKey:kOrderListModelOrder_comments];	if(self.order_coupon != nil){
		[aCoder encodeObject:self.order_coupon forKey:kOrderListModelOrder_coupon];
	}
	if(self.order_goods != nil){
		[aCoder encodeObject:self.order_goods forKey:kOrderListModelOrder_goods];
	}
	if(self.order_money != nil){
		[aCoder encodeObject:self.order_money forKey:kOrderListModelOrder_money];
	}
	if(self.order_sn != nil){
		[aCoder encodeObject:self.order_sn forKey:kOrderListModelOrder_sn];
	}
	if(self.pay_code != nil){
		[aCoder encodeObject:self.pay_code forKey:kOrderListModelPay_code];
	}
	if(self.pay_name != nil){
		[aCoder encodeObject:self.pay_name forKey:kOrderListModelPay_name];
	}
	[aCoder encodeObject:@(self.pay_status) forKey:kOrderListModelPay_status];	if(self.pay_time != nil){
		[aCoder encodeObject:self.pay_time forKey:kOrderListModelPay_time];
	}
	[aCoder encodeObject:@(self.province) forKey:kOrderListModelProvince];	if(self.province_name != nil){
		[aCoder encodeObject:self.province_name forKey:kOrderListModelProvince_name];
	}
	if(self.refund_time != nil){
		[aCoder encodeObject:self.refund_time forKey:kOrderListModelRefund_time];
	}
	[aCoder encodeObject:@(self.shipping_status) forKey:kOrderListModelShipping_status];	[aCoder encodeObject:@(self.shop_id) forKey:kOrderListModelShop_id];	if(self.shop_name != nil){
		[aCoder encodeObject:self.shop_name forKey:kOrderListModelShop_name];
	}
	if(self.sq_cancel_time != nil){
		[aCoder encodeObject:self.sq_cancel_time forKey:kOrderListModelSq_cancel_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kOrderListModelStatus];	if(self.status_time != nil){
		[aCoder encodeObject:self.status_time forKey:kOrderListModelStatus_time];
	}
	if(self.total_money != nil){
		[aCoder encodeObject:self.total_money forKey:kOrderListModelTotal_money];
	}
	[aCoder encodeObject:@(self.type) forKey:kOrderListModelType];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kOrderListModelUpdated_at];
	}
	[aCoder encodeObject:@(self.user_id) forKey:kOrderListModelUser_id];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kOrderListModelAddress];
	self.admin_id = [[aDecoder decodeObjectForKey:kOrderListModelAdmin_id] integerValue];
	self.appointment_time = [aDecoder decodeObjectForKey:kOrderListModelAppointment_time];
	self.area_name = [aDecoder decodeObjectForKey:kOrderListModelArea_name];
	self.cancel_time = [aDecoder decodeObjectForKey:kOrderListModelCancel_time];
	self.city = [[aDecoder decodeObjectForKey:kOrderListModelCity] integerValue];
	self.city_name = [aDecoder decodeObjectForKey:kOrderListModelCity_name];
	self.coupon_money = [aDecoder decodeObjectForKey:kOrderListModelCoupon_money];
	self.created_at = [aDecoder decodeObjectForKey:kOrderListModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kOrderListModelDeleted_at];
	self.district = [[aDecoder decodeObjectForKey:kOrderListModelDistrict] integerValue];
	self.hexiao_time = [aDecoder decodeObjectForKey:kOrderListModelHexiao_time];
	self.idField = [[aDecoder decodeObjectForKey:kOrderListModelIdField] integerValue];
	self.is_appointment = [[aDecoder decodeObjectForKey:kOrderListModelIs_appointment] integerValue];
	self.is_cancel = [[aDecoder decodeObjectForKey:kOrderListModelIs_cancel] integerValue];
	self.is_comment = [[aDecoder decodeObjectForKey:kOrderListModelIs_comment] integerValue];
	self.is_hexiao = [[aDecoder decodeObjectForKey:kOrderListModelIs_hexiao] integerValue];
	self.is_refund = [[aDecoder decodeObjectForKey:kOrderListModelIs_refund] integerValue];
	self.mmerchant_id = [[aDecoder decodeObjectForKey:kOrderListModelMmerchant_id] integerValue];
	self.mobile = [aDecoder decodeObjectForKey:kOrderListModelMobile];
	self.note = [aDecoder decodeObjectForKey:kOrderListModelNote];
	self.order_comments = [[aDecoder decodeObjectForKey:kOrderListModelOrder_comments] integerValue];
	self.order_coupon = [aDecoder decodeObjectForKey:kOrderListModelOrder_coupon];
	self.order_goods = [aDecoder decodeObjectForKey:kOrderListModelOrder_goods];
	self.order_money = [aDecoder decodeObjectForKey:kOrderListModelOrder_money];
	self.order_sn = [aDecoder decodeObjectForKey:kOrderListModelOrder_sn];
	self.pay_code = [aDecoder decodeObjectForKey:kOrderListModelPay_code];
	self.pay_name = [aDecoder decodeObjectForKey:kOrderListModelPay_name];
	self.pay_status = [[aDecoder decodeObjectForKey:kOrderListModelPay_status] integerValue];
	self.pay_time = [aDecoder decodeObjectForKey:kOrderListModelPay_time];
	self.province = [[aDecoder decodeObjectForKey:kOrderListModelProvince] integerValue];
	self.province_name = [aDecoder decodeObjectForKey:kOrderListModelProvince_name];
	self.refund_time = [aDecoder decodeObjectForKey:kOrderListModelRefund_time];
	self.shipping_status = [[aDecoder decodeObjectForKey:kOrderListModelShipping_status] integerValue];
	self.shop_id = [[aDecoder decodeObjectForKey:kOrderListModelShop_id] integerValue];
	self.shop_name = [aDecoder decodeObjectForKey:kOrderListModelShop_name];
	self.sq_cancel_time = [aDecoder decodeObjectForKey:kOrderListModelSq_cancel_time];
	self.status = [[aDecoder decodeObjectForKey:kOrderListModelStatus] integerValue];
	self.status_time = [aDecoder decodeObjectForKey:kOrderListModelStatus_time];
	self.total_money = [aDecoder decodeObjectForKey:kOrderListModelTotal_money];
	self.type = [[aDecoder decodeObjectForKey:kOrderListModelType] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kOrderListModelUpdated_at];
	self.user_id = [[aDecoder decodeObjectForKey:kOrderListModelUser_id] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	OrderListModel *copy = [OrderListModel new];

	copy.address = [self.address copy];
	copy.admin_id = self.admin_id;
	copy.appointment_time = [self.appointment_time copy];
	copy.area_name = [self.area_name copy];
	copy.cancel_time = [self.cancel_time copy];
	copy.city = self.city;
	copy.city_name = [self.city_name copy];
	copy.coupon_money = [self.coupon_money copy];
	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.district = self.district;
	copy.hexiao_time = [self.hexiao_time copy];
	copy.idField = self.idField;
	copy.is_appointment = self.is_appointment;
	copy.is_cancel = self.is_cancel;
	copy.is_comment = self.is_comment;
	copy.is_hexiao = self.is_hexiao;
	copy.is_refund = self.is_refund;
	copy.mmerchant_id = self.mmerchant_id;
	copy.mobile = [self.mobile copy];
	copy.note = [self.note copy];
	copy.order_comments = self.order_comments;
	copy.order_coupon = [self.order_coupon copy];
	copy.order_goods = [self.order_goods copy];
	copy.order_money = [self.order_money copy];
	copy.order_sn = [self.order_sn copy];
	copy.pay_code = [self.pay_code copy];
	copy.pay_name = [self.pay_name copy];
	copy.pay_status = self.pay_status;
	copy.pay_time = [self.pay_time copy];
	copy.province = self.province;
	copy.province_name = [self.province_name copy];
	copy.refund_time = [self.refund_time copy];
	copy.shipping_status = self.shipping_status;
	copy.shop_id = self.shop_id;
	copy.shop_name = [self.shop_name copy];
	copy.sq_cancel_time = [self.sq_cancel_time copy];
	copy.status = self.status;
	copy.status_time = [self.status_time copy];
	copy.total_money = [self.total_money copy];
	copy.type = self.type;
	copy.updated_at = [self.updated_at copy];
	copy.user_id = self.user_id;

	return copy;
}
@end