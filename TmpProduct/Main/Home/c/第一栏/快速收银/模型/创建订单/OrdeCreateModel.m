//
//	OrdeCreateModel.m

//  创建于 20/4/2019
//	Copyright © 2019. All rights reserved.




#import "OrdeCreateModel.h"

NSString *const kOrdeCreateModelActivity = @"activity";
NSString *const kOrdeCreateModelCoupon = @"coupon";
NSString *const kOrdeCreateModelGoods_info = @"goods_info";
NSString *const kOrdeCreateModelNote = @"note";
NSString *const kOrdeCreateModelOrder_money = @"order_money";
NSString *const kOrdeCreateModelPay_code = @"pay_code";
NSString *const kOrdeCreateModelShop_id = @"shop_id";
NSString *const kOrdeCreateModelTotal_money = @"total_money";
NSString *const kOrdeCreateModelUser_id = @"user_id";

@interface OrdeCreateModel ()
@end
@implementation OrdeCreateModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kOrdeCreateModelActivity] isKindOfClass:[NSNull class]]){
		self.activity = dictionary[kOrdeCreateModelActivity];
	}	
	if(![dictionary[kOrdeCreateModelCoupon] isKindOfClass:[NSNull class]]){
		self.coupon = dictionary[kOrdeCreateModelCoupon];
	}	
	if(![dictionary[kOrdeCreateModelGoods_info] isKindOfClass:[NSNull class]]){
		self.goods_info = dictionary[kOrdeCreateModelGoods_info];
	}	
	if(![dictionary[kOrdeCreateModelNote] isKindOfClass:[NSNull class]]){
		self.note = dictionary[kOrdeCreateModelNote];
	}	
	if(![dictionary[kOrdeCreateModelOrder_money] isKindOfClass:[NSNull class]]){
		self.order_money = dictionary[kOrdeCreateModelOrder_money];
	}	
	if(![dictionary[kOrdeCreateModelPay_code] isKindOfClass:[NSNull class]]){
		self.pay_code = dictionary[kOrdeCreateModelPay_code];
	}	
	if(![dictionary[kOrdeCreateModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = dictionary[kOrdeCreateModelShop_id];
	}	
	if(![dictionary[kOrdeCreateModelTotal_money] isKindOfClass:[NSNull class]]){
		self.total_money = dictionary[kOrdeCreateModelTotal_money];
	}	
	if(![dictionary[kOrdeCreateModelUser_id] isKindOfClass:[NSNull class]]){
		self.user_id = dictionary[kOrdeCreateModelUser_id];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.activity != nil){
		dictionary[kOrdeCreateModelActivity] = self.activity;
	}
	if(self.coupon != nil){
		dictionary[kOrdeCreateModelCoupon] = self.coupon;
	}
	if(self.goods_info != nil){
		dictionary[kOrdeCreateModelGoods_info] = self.goods_info;
	}
	if(self.note != nil){
		dictionary[kOrdeCreateModelNote] = self.note;
	}
	if(self.order_money != nil){
		dictionary[kOrdeCreateModelOrder_money] = self.order_money;
	}
	if(self.pay_code != nil){
		dictionary[kOrdeCreateModelPay_code] = self.pay_code;
	}
	if(self.shop_id != nil){
		dictionary[kOrdeCreateModelShop_id] = self.shop_id;
	}
	if(self.total_money != nil){
		dictionary[kOrdeCreateModelTotal_money] = self.total_money;
	}
	if(self.user_id != nil){
		dictionary[kOrdeCreateModelUser_id] = self.user_id;
	}
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
	if(self.activity != nil){
		[aCoder encodeObject:self.activity forKey:kOrdeCreateModelActivity];
	}
	if(self.coupon != nil){
		[aCoder encodeObject:self.coupon forKey:kOrdeCreateModelCoupon];
	}
	if(self.goods_info != nil){
		[aCoder encodeObject:self.goods_info forKey:kOrdeCreateModelGoods_info];
	}
	if(self.note != nil){
		[aCoder encodeObject:self.note forKey:kOrdeCreateModelNote];
	}
	if(self.order_money != nil){
		[aCoder encodeObject:self.order_money forKey:kOrdeCreateModelOrder_money];
	}
	if(self.pay_code != nil){
		[aCoder encodeObject:self.pay_code forKey:kOrdeCreateModelPay_code];
	}
	if(self.shop_id != nil){
		[aCoder encodeObject:self.shop_id forKey:kOrdeCreateModelShop_id];
	}
	if(self.total_money != nil){
		[aCoder encodeObject:self.total_money forKey:kOrdeCreateModelTotal_money];
	}
	if(self.user_id != nil){
		[aCoder encodeObject:self.user_id forKey:kOrdeCreateModelUser_id];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.activity = [aDecoder decodeObjectForKey:kOrdeCreateModelActivity];
	self.coupon = [aDecoder decodeObjectForKey:kOrdeCreateModelCoupon];
	self.goods_info = [aDecoder decodeObjectForKey:kOrdeCreateModelGoods_info];
	self.note = [aDecoder decodeObjectForKey:kOrdeCreateModelNote];
	self.order_money = [aDecoder decodeObjectForKey:kOrdeCreateModelOrder_money];
	self.pay_code = [aDecoder decodeObjectForKey:kOrdeCreateModelPay_code];
	self.shop_id = [aDecoder decodeObjectForKey:kOrdeCreateModelShop_id];
	self.total_money = [aDecoder decodeObjectForKey:kOrdeCreateModelTotal_money];
	self.user_id = [aDecoder decodeObjectForKey:kOrdeCreateModelUser_id];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	OrdeCreateModel *copy = [OrdeCreateModel new];

	copy.activity = [self.activity copy];
	copy.coupon = [self.coupon copy];
	copy.goods_info = [self.goods_info copy];
	copy.note = [self.note copy];
	copy.order_money = [self.order_money copy];
	copy.pay_code = [self.pay_code copy];
	copy.shop_id = [self.shop_id copy];
	copy.total_money = [self.total_money copy];
	copy.user_id = [self.user_id copy];

	return copy;
}
@end