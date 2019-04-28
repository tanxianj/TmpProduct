//
//	CapitalFlowListModel.m

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.




#import "CapitalFlowListModel.h"

NSString *const kCapitalFlowListModelAddress = @"address";
NSString *const kCapitalFlowListModelAdmin_id = @"admin_id";
NSString *const kCapitalFlowListModelAppointment_time = @"appointment_time";
NSString *const kCapitalFlowListModelArea_name = @"area_name";
NSString *const kCapitalFlowListModelCancel_time = @"cancel_time";
NSString *const kCapitalFlowListModelCity = @"city";
NSString *const kCapitalFlowListModelCity_name = @"city_name";
NSString *const kCapitalFlowListModelCoupon_money = @"coupon_money";
NSString *const kCapitalFlowListModelCreated_at = @"created_at";
NSString *const kCapitalFlowListModelDeleted_at = @"deleted_at";
NSString *const kCapitalFlowListModelDistrict = @"district";
NSString *const kCapitalFlowListModelHexiao_time = @"hexiao_time";
NSString *const kCapitalFlowListModelIdField = @"id";
NSString *const kCapitalFlowListModelIs_appointment = @"is_appointment";
NSString *const kCapitalFlowListModelIs_cancel = @"is_cancel";
NSString *const kCapitalFlowListModelIs_comment = @"is_comment";
NSString *const kCapitalFlowListModelIs_hexiao = @"is_hexiao";
NSString *const kCapitalFlowListModelIs_refund = @"is_refund";
NSString *const kCapitalFlowListModelMmerchant_id = @"mmerchant_id";
NSString *const kCapitalFlowListModelMobile = @"mobile";
NSString *const kCapitalFlowListModelNote = @"note";
NSString *const kCapitalFlowListModelOrder_comments = @"order_comments";
NSString *const kCapitalFlowListModelOrder_coupon = @"order_coupon";
NSString *const kCapitalFlowListModelOrder_goods = @"order_goods";
NSString *const kCapitalFlowListModelOrder_money = @"order_money";
NSString *const kCapitalFlowListModelOrder_sn = @"order_sn";
NSString *const kCapitalFlowListModelPay_code = @"pay_code";
NSString *const kCapitalFlowListModelPay_name = @"pay_name";
NSString *const kCapitalFlowListModelPay_status = @"pay_status";
NSString *const kCapitalFlowListModelPay_time = @"pay_time";
NSString *const kCapitalFlowListModelProvince = @"province";
NSString *const kCapitalFlowListModelProvince_name = @"province_name";
NSString *const kCapitalFlowListModelRefund_time = @"refund_time";
NSString *const kCapitalFlowListModelShipping_status = @"shipping_status";
NSString *const kCapitalFlowListModelShop_id = @"shop_id";
NSString *const kCapitalFlowListModelSq_cancel_time = @"sq_cancel_time";
NSString *const kCapitalFlowListModelStatus = @"status";
NSString *const kCapitalFlowListModelStatus_time = @"status_time";
NSString *const kCapitalFlowListModelTotal_money = @"total_money";
NSString *const kCapitalFlowListModelType = @"type";
NSString *const kCapitalFlowListModelUpdated_at = @"updated_at";
NSString *const kCapitalFlowListModelUser_id = @"user_id";

@interface CapitalFlowListModel ()
@end
@implementation CapitalFlowListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCapitalFlowListModelAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kCapitalFlowListModelAddress];
	}	
	if(![dictionary[kCapitalFlowListModelAdmin_id] isKindOfClass:[NSNull class]]){
		self.admin_id = [dictionary[kCapitalFlowListModelAdmin_id] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelAppointment_time] isKindOfClass:[NSNull class]]){
		self.appointment_time = dictionary[kCapitalFlowListModelAppointment_time];
	}	
	if(![dictionary[kCapitalFlowListModelArea_name] isKindOfClass:[NSNull class]]){
		self.area_name = dictionary[kCapitalFlowListModelArea_name];
	}	
	if(![dictionary[kCapitalFlowListModelCancel_time] isKindOfClass:[NSNull class]]){
		self.cancel_time = dictionary[kCapitalFlowListModelCancel_time];
	}	
	if(![dictionary[kCapitalFlowListModelCity] isKindOfClass:[NSNull class]]){
		self.city = [dictionary[kCapitalFlowListModelCity] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelCity_name] isKindOfClass:[NSNull class]]){
		self.city_name = dictionary[kCapitalFlowListModelCity_name];
	}	
	if(![dictionary[kCapitalFlowListModelCoupon_money] isKindOfClass:[NSNull class]]){
		self.coupon_money = dictionary[kCapitalFlowListModelCoupon_money];
	}	
	if(![dictionary[kCapitalFlowListModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kCapitalFlowListModelCreated_at];
	}	
	if(![dictionary[kCapitalFlowListModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kCapitalFlowListModelDeleted_at];
	}	
	if(![dictionary[kCapitalFlowListModelDistrict] isKindOfClass:[NSNull class]]){
		self.district = [dictionary[kCapitalFlowListModelDistrict] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelHexiao_time] isKindOfClass:[NSNull class]]){
		self.hexiao_time = dictionary[kCapitalFlowListModelHexiao_time];
	}	
	if(![dictionary[kCapitalFlowListModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kCapitalFlowListModelIdField] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelIs_appointment] isKindOfClass:[NSNull class]]){
		self.is_appointment = [dictionary[kCapitalFlowListModelIs_appointment] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelIs_cancel] isKindOfClass:[NSNull class]]){
		self.is_cancel = [dictionary[kCapitalFlowListModelIs_cancel] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelIs_comment] isKindOfClass:[NSNull class]]){
		self.is_comment = [dictionary[kCapitalFlowListModelIs_comment] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelIs_hexiao] isKindOfClass:[NSNull class]]){
		self.is_hexiao = [dictionary[kCapitalFlowListModelIs_hexiao] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelIs_refund] isKindOfClass:[NSNull class]]){
		self.is_refund = [dictionary[kCapitalFlowListModelIs_refund] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelMmerchant_id] isKindOfClass:[NSNull class]]){
		self.mmerchant_id = [dictionary[kCapitalFlowListModelMmerchant_id] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kCapitalFlowListModelMobile];
	}	
	if(![dictionary[kCapitalFlowListModelNote] isKindOfClass:[NSNull class]]){
		self.note = dictionary[kCapitalFlowListModelNote];
	}	
	if(![dictionary[kCapitalFlowListModelOrder_comments] isKindOfClass:[NSNull class]]){
		self.order_comments = [dictionary[kCapitalFlowListModelOrder_comments] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelOrder_coupon] isKindOfClass:[NSNull class]]){
		self.order_coupon = dictionary[kCapitalFlowListModelOrder_coupon];
	}	
	if(![dictionary[kCapitalFlowListModelOrder_goods] isKindOfClass:[NSNull class]]){
		self.order_goods = dictionary[kCapitalFlowListModelOrder_goods];
	}	
	if(![dictionary[kCapitalFlowListModelOrder_money] isKindOfClass:[NSNull class]]){
		self.order_money = dictionary[kCapitalFlowListModelOrder_money];
	}	
	if(![dictionary[kCapitalFlowListModelOrder_sn] isKindOfClass:[NSNull class]]){
		self.order_sn = dictionary[kCapitalFlowListModelOrder_sn];
	}	
	if(![dictionary[kCapitalFlowListModelPay_code] isKindOfClass:[NSNull class]]){
		self.pay_code = dictionary[kCapitalFlowListModelPay_code];
	}	
	if(![dictionary[kCapitalFlowListModelPay_name] isKindOfClass:[NSNull class]]){
		self.pay_name = dictionary[kCapitalFlowListModelPay_name];
	}	
	if(![dictionary[kCapitalFlowListModelPay_status] isKindOfClass:[NSNull class]]){
		self.pay_status = [dictionary[kCapitalFlowListModelPay_status] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelPay_time] isKindOfClass:[NSNull class]]){
		self.pay_time = dictionary[kCapitalFlowListModelPay_time];
	}	
	if(![dictionary[kCapitalFlowListModelProvince] isKindOfClass:[NSNull class]]){
		self.province = [dictionary[kCapitalFlowListModelProvince] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelProvince_name] isKindOfClass:[NSNull class]]){
		self.province_name = dictionary[kCapitalFlowListModelProvince_name];
	}	
	if(![dictionary[kCapitalFlowListModelRefund_time] isKindOfClass:[NSNull class]]){
		self.refund_time = dictionary[kCapitalFlowListModelRefund_time];
	}	
	if(![dictionary[kCapitalFlowListModelShipping_status] isKindOfClass:[NSNull class]]){
		self.shipping_status = [dictionary[kCapitalFlowListModelShipping_status] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = [dictionary[kCapitalFlowListModelShop_id] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelSq_cancel_time] isKindOfClass:[NSNull class]]){
		self.sq_cancel_time = dictionary[kCapitalFlowListModelSq_cancel_time];
	}	
	if(![dictionary[kCapitalFlowListModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kCapitalFlowListModelStatus] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelStatus_time] isKindOfClass:[NSNull class]]){
		self.status_time = dictionary[kCapitalFlowListModelStatus_time];
	}	
	if(![dictionary[kCapitalFlowListModelTotal_money] isKindOfClass:[NSNull class]]){
		self.total_money = dictionary[kCapitalFlowListModelTotal_money];
	}	
	if(![dictionary[kCapitalFlowListModelType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kCapitalFlowListModelType] integerValue];
	}

	if(![dictionary[kCapitalFlowListModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kCapitalFlowListModelUpdated_at];
	}	
	if(![dictionary[kCapitalFlowListModelUser_id] isKindOfClass:[NSNull class]]){
		self.user_id = [dictionary[kCapitalFlowListModelUser_id] integerValue];
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
		dictionary[kCapitalFlowListModelAddress] = self.address;
	}
	dictionary[kCapitalFlowListModelAdmin_id] = @(self.admin_id);
	if(self.appointment_time != nil){
		dictionary[kCapitalFlowListModelAppointment_time] = self.appointment_time;
	}
	if(self.area_name != nil){
		dictionary[kCapitalFlowListModelArea_name] = self.area_name;
	}
	if(self.cancel_time != nil){
		dictionary[kCapitalFlowListModelCancel_time] = self.cancel_time;
	}
	dictionary[kCapitalFlowListModelCity] = @(self.city);
	if(self.city_name != nil){
		dictionary[kCapitalFlowListModelCity_name] = self.city_name;
	}
	if(self.coupon_money != nil){
		dictionary[kCapitalFlowListModelCoupon_money] = self.coupon_money;
	}
	if(self.created_at != nil){
		dictionary[kCapitalFlowListModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kCapitalFlowListModelDeleted_at] = self.deleted_at;
	}
	dictionary[kCapitalFlowListModelDistrict] = @(self.district);
	if(self.hexiao_time != nil){
		dictionary[kCapitalFlowListModelHexiao_time] = self.hexiao_time;
	}
	dictionary[kCapitalFlowListModelIdField] = @(self.idField);
	dictionary[kCapitalFlowListModelIs_appointment] = @(self.is_appointment);
	dictionary[kCapitalFlowListModelIs_cancel] = @(self.is_cancel);
	dictionary[kCapitalFlowListModelIs_comment] = @(self.is_comment);
	dictionary[kCapitalFlowListModelIs_hexiao] = @(self.is_hexiao);
	dictionary[kCapitalFlowListModelIs_refund] = @(self.is_refund);
	dictionary[kCapitalFlowListModelMmerchant_id] = @(self.mmerchant_id);
	if(self.mobile != nil){
		dictionary[kCapitalFlowListModelMobile] = self.mobile;
	}
	if(self.note != nil){
		dictionary[kCapitalFlowListModelNote] = self.note;
	}
	dictionary[kCapitalFlowListModelOrder_comments] = @(self.order_comments);
	if(self.order_coupon != nil){
		dictionary[kCapitalFlowListModelOrder_coupon] = self.order_coupon;
	}
	if(self.order_goods != nil){
		dictionary[kCapitalFlowListModelOrder_goods] = self.order_goods;
	}
	if(self.order_money != nil){
		dictionary[kCapitalFlowListModelOrder_money] = self.order_money;
	}
	if(self.order_sn != nil){
		dictionary[kCapitalFlowListModelOrder_sn] = self.order_sn;
	}
	if(self.pay_code != nil){
		dictionary[kCapitalFlowListModelPay_code] = self.pay_code;
	}
	if(self.pay_name != nil){
		dictionary[kCapitalFlowListModelPay_name] = self.pay_name;
	}
	dictionary[kCapitalFlowListModelPay_status] = @(self.pay_status);
	if(self.pay_time != nil){
		dictionary[kCapitalFlowListModelPay_time] = self.pay_time;
	}
	dictionary[kCapitalFlowListModelProvince] = @(self.province);
	if(self.province_name != nil){
		dictionary[kCapitalFlowListModelProvince_name] = self.province_name;
	}
	if(self.refund_time != nil){
		dictionary[kCapitalFlowListModelRefund_time] = self.refund_time;
	}
	dictionary[kCapitalFlowListModelShipping_status] = @(self.shipping_status);
	dictionary[kCapitalFlowListModelShop_id] = @(self.shop_id);
	if(self.sq_cancel_time != nil){
		dictionary[kCapitalFlowListModelSq_cancel_time] = self.sq_cancel_time;
	}
	dictionary[kCapitalFlowListModelStatus] = @(self.status);
	if(self.status_time != nil){
		dictionary[kCapitalFlowListModelStatus_time] = self.status_time;
	}
	if(self.total_money != nil){
		dictionary[kCapitalFlowListModelTotal_money] = self.total_money;
	}
	dictionary[kCapitalFlowListModelType] = @(self.type);
	if(self.updated_at != nil){
		dictionary[kCapitalFlowListModelUpdated_at] = self.updated_at;
	}
	dictionary[kCapitalFlowListModelUser_id] = @(self.user_id);
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
		[aCoder encodeObject:self.address forKey:kCapitalFlowListModelAddress];
	}
	[aCoder encodeObject:@(self.admin_id) forKey:kCapitalFlowListModelAdmin_id];	if(self.appointment_time != nil){
		[aCoder encodeObject:self.appointment_time forKey:kCapitalFlowListModelAppointment_time];
	}
	if(self.area_name != nil){
		[aCoder encodeObject:self.area_name forKey:kCapitalFlowListModelArea_name];
	}
	if(self.cancel_time != nil){
		[aCoder encodeObject:self.cancel_time forKey:kCapitalFlowListModelCancel_time];
	}
	[aCoder encodeObject:@(self.city) forKey:kCapitalFlowListModelCity];	if(self.city_name != nil){
		[aCoder encodeObject:self.city_name forKey:kCapitalFlowListModelCity_name];
	}
	if(self.coupon_money != nil){
		[aCoder encodeObject:self.coupon_money forKey:kCapitalFlowListModelCoupon_money];
	}
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kCapitalFlowListModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kCapitalFlowListModelDeleted_at];
	}
	[aCoder encodeObject:@(self.district) forKey:kCapitalFlowListModelDistrict];	if(self.hexiao_time != nil){
		[aCoder encodeObject:self.hexiao_time forKey:kCapitalFlowListModelHexiao_time];
	}
	[aCoder encodeObject:@(self.idField) forKey:kCapitalFlowListModelIdField];	[aCoder encodeObject:@(self.is_appointment) forKey:kCapitalFlowListModelIs_appointment];	[aCoder encodeObject:@(self.is_cancel) forKey:kCapitalFlowListModelIs_cancel];	[aCoder encodeObject:@(self.is_comment) forKey:kCapitalFlowListModelIs_comment];	[aCoder encodeObject:@(self.is_hexiao) forKey:kCapitalFlowListModelIs_hexiao];	[aCoder encodeObject:@(self.is_refund) forKey:kCapitalFlowListModelIs_refund];	[aCoder encodeObject:@(self.mmerchant_id) forKey:kCapitalFlowListModelMmerchant_id];	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kCapitalFlowListModelMobile];
	}
	if(self.note != nil){
		[aCoder encodeObject:self.note forKey:kCapitalFlowListModelNote];
	}
	[aCoder encodeObject:@(self.order_comments) forKey:kCapitalFlowListModelOrder_comments];	if(self.order_coupon != nil){
		[aCoder encodeObject:self.order_coupon forKey:kCapitalFlowListModelOrder_coupon];
	}
	if(self.order_goods != nil){
		[aCoder encodeObject:self.order_goods forKey:kCapitalFlowListModelOrder_goods];
	}
	if(self.order_money != nil){
		[aCoder encodeObject:self.order_money forKey:kCapitalFlowListModelOrder_money];
	}
	if(self.order_sn != nil){
		[aCoder encodeObject:self.order_sn forKey:kCapitalFlowListModelOrder_sn];
	}
	if(self.pay_code != nil){
		[aCoder encodeObject:self.pay_code forKey:kCapitalFlowListModelPay_code];
	}
	if(self.pay_name != nil){
		[aCoder encodeObject:self.pay_name forKey:kCapitalFlowListModelPay_name];
	}
	[aCoder encodeObject:@(self.pay_status) forKey:kCapitalFlowListModelPay_status];	if(self.pay_time != nil){
		[aCoder encodeObject:self.pay_time forKey:kCapitalFlowListModelPay_time];
	}
	[aCoder encodeObject:@(self.province) forKey:kCapitalFlowListModelProvince];	if(self.province_name != nil){
		[aCoder encodeObject:self.province_name forKey:kCapitalFlowListModelProvince_name];
	}
	if(self.refund_time != nil){
		[aCoder encodeObject:self.refund_time forKey:kCapitalFlowListModelRefund_time];
	}
	[aCoder encodeObject:@(self.shipping_status) forKey:kCapitalFlowListModelShipping_status];	[aCoder encodeObject:@(self.shop_id) forKey:kCapitalFlowListModelShop_id];	if(self.sq_cancel_time != nil){
		[aCoder encodeObject:self.sq_cancel_time forKey:kCapitalFlowListModelSq_cancel_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kCapitalFlowListModelStatus];	if(self.status_time != nil){
		[aCoder encodeObject:self.status_time forKey:kCapitalFlowListModelStatus_time];
	}
	if(self.total_money != nil){
		[aCoder encodeObject:self.total_money forKey:kCapitalFlowListModelTotal_money];
	}
	[aCoder encodeObject:@(self.type) forKey:kCapitalFlowListModelType];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kCapitalFlowListModelUpdated_at];
	}
	[aCoder encodeObject:@(self.user_id) forKey:kCapitalFlowListModelUser_id];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kCapitalFlowListModelAddress];
	self.admin_id = [[aDecoder decodeObjectForKey:kCapitalFlowListModelAdmin_id] integerValue];
	self.appointment_time = [aDecoder decodeObjectForKey:kCapitalFlowListModelAppointment_time];
	self.area_name = [aDecoder decodeObjectForKey:kCapitalFlowListModelArea_name];
	self.cancel_time = [aDecoder decodeObjectForKey:kCapitalFlowListModelCancel_time];
	self.city = [[aDecoder decodeObjectForKey:kCapitalFlowListModelCity] integerValue];
	self.city_name = [aDecoder decodeObjectForKey:kCapitalFlowListModelCity_name];
	self.coupon_money = [aDecoder decodeObjectForKey:kCapitalFlowListModelCoupon_money];
	self.created_at = [aDecoder decodeObjectForKey:kCapitalFlowListModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kCapitalFlowListModelDeleted_at];
	self.district = [[aDecoder decodeObjectForKey:kCapitalFlowListModelDistrict] integerValue];
	self.hexiao_time = [aDecoder decodeObjectForKey:kCapitalFlowListModelHexiao_time];
	self.idField = [[aDecoder decodeObjectForKey:kCapitalFlowListModelIdField] integerValue];
	self.is_appointment = [[aDecoder decodeObjectForKey:kCapitalFlowListModelIs_appointment] integerValue];
	self.is_cancel = [[aDecoder decodeObjectForKey:kCapitalFlowListModelIs_cancel] integerValue];
	self.is_comment = [[aDecoder decodeObjectForKey:kCapitalFlowListModelIs_comment] integerValue];
	self.is_hexiao = [[aDecoder decodeObjectForKey:kCapitalFlowListModelIs_hexiao] integerValue];
	self.is_refund = [[aDecoder decodeObjectForKey:kCapitalFlowListModelIs_refund] integerValue];
	self.mmerchant_id = [[aDecoder decodeObjectForKey:kCapitalFlowListModelMmerchant_id] integerValue];
	self.mobile = [aDecoder decodeObjectForKey:kCapitalFlowListModelMobile];
	self.note = [aDecoder decodeObjectForKey:kCapitalFlowListModelNote];
	self.order_comments = [[aDecoder decodeObjectForKey:kCapitalFlowListModelOrder_comments] integerValue];
	self.order_coupon = [aDecoder decodeObjectForKey:kCapitalFlowListModelOrder_coupon];
	self.order_goods = [aDecoder decodeObjectForKey:kCapitalFlowListModelOrder_goods];
	self.order_money = [aDecoder decodeObjectForKey:kCapitalFlowListModelOrder_money];
	self.order_sn = [aDecoder decodeObjectForKey:kCapitalFlowListModelOrder_sn];
	self.pay_code = [aDecoder decodeObjectForKey:kCapitalFlowListModelPay_code];
	self.pay_name = [aDecoder decodeObjectForKey:kCapitalFlowListModelPay_name];
	self.pay_status = [[aDecoder decodeObjectForKey:kCapitalFlowListModelPay_status] integerValue];
	self.pay_time = [aDecoder decodeObjectForKey:kCapitalFlowListModelPay_time];
	self.province = [[aDecoder decodeObjectForKey:kCapitalFlowListModelProvince] integerValue];
	self.province_name = [aDecoder decodeObjectForKey:kCapitalFlowListModelProvince_name];
	self.refund_time = [aDecoder decodeObjectForKey:kCapitalFlowListModelRefund_time];
	self.shipping_status = [[aDecoder decodeObjectForKey:kCapitalFlowListModelShipping_status] integerValue];
	self.shop_id = [[aDecoder decodeObjectForKey:kCapitalFlowListModelShop_id] integerValue];
	self.sq_cancel_time = [aDecoder decodeObjectForKey:kCapitalFlowListModelSq_cancel_time];
	self.status = [[aDecoder decodeObjectForKey:kCapitalFlowListModelStatus] integerValue];
	self.status_time = [aDecoder decodeObjectForKey:kCapitalFlowListModelStatus_time];
	self.total_money = [aDecoder decodeObjectForKey:kCapitalFlowListModelTotal_money];
	self.type = [[aDecoder decodeObjectForKey:kCapitalFlowListModelType] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kCapitalFlowListModelUpdated_at];
	self.user_id = [[aDecoder decodeObjectForKey:kCapitalFlowListModelUser_id] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CapitalFlowListModel *copy = [CapitalFlowListModel new];

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