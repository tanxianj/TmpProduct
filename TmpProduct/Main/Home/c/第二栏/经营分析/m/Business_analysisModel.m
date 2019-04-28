//
//	Business_analysisModel.m

//  创建于 21/4/2019
//	Copyright © 2019. All rights reserved.




#import "Business_analysisModel.h"

NSString *const kBusiness_analysisModelOnline_pay_money = @"online_pay_money";
NSString *const kBusiness_analysisModelOnline_pay_online_weixin_money = @"online_pay_online_weixin_money";
NSString *const kBusiness_analysisModelOnline_pay_online_weixin_total = @"online_pay_online_weixin_total";
NSString *const kBusiness_analysisModelOnline_pay_total = @"online_pay_total";
NSString *const kBusiness_analysisModelOrder_hexiao_money = @"order_hexiao_money";
NSString *const kBusiness_analysisModelOrder_hexiao_total = @"order_hexiao_total";
NSString *const kBusiness_analysisModelOrder_offline_money = @"order_offline_money";
NSString *const kBusiness_analysisModelOrder_offline_total = @"order_offline_total";
NSString *const kBusiness_analysisModelOrder_online_money = @"order_online_money";
NSString *const kBusiness_analysisModelOrder_online_total = @"order_online_total";
NSString *const kBusiness_analysisModelOrder_refund_money = @"order_refund_money";
NSString *const kBusiness_analysisModelOrder_refund_total = @"order_refund_total";
NSString *const kBusiness_analysisModelOrder_total = @"order_total";
NSString *const kBusiness_analysisModelOrder_total_money = @"order_total_money";
NSString *const kBusiness_analysisModelShop_pay_money = @"shop_pay_money";
NSString *const kBusiness_analysisModelShop_pay_offline_bank_money = @"shop_pay_offline_bank_money";
NSString *const kBusiness_analysisModelShop_pay_offline_bank_total = @"shop_pay_offline_bank_total";
NSString *const kBusiness_analysisModelShop_pay_offline_cash_money = @"shop_pay_offline_cash_money";
NSString *const kBusiness_analysisModelShop_pay_offline_cash_total = @"shop_pay_offline_cash_total";
NSString *const kBusiness_analysisModelShop_pay_online_alipay_money = @"shop_pay_online_alipay_money";
NSString *const kBusiness_analysisModelShop_pay_online_alipay_total = @"shop_pay_online_alipay_total";
NSString *const kBusiness_analysisModelShop_pay_online_weixin_money = @"shop_pay_online_weixin_money";
NSString *const kBusiness_analysisModelShop_pay_online_weixin_total = @"shop_pay_online_weixin_total";
NSString *const kBusiness_analysisModelShop_pay_total = @"shop_pay_total";

@interface Business_analysisModel ()
@end
@implementation Business_analysisModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kBusiness_analysisModelOnline_pay_money] isKindOfClass:[NSNull class]]){
		self.online_pay_money = [dictionary[kBusiness_analysisModelOnline_pay_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelOnline_pay_online_weixin_money] isKindOfClass:[NSNull class]]){
		self.online_pay_online_weixin_money = [dictionary[kBusiness_analysisModelOnline_pay_online_weixin_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelOnline_pay_online_weixin_total] isKindOfClass:[NSNull class]]){
		self.online_pay_online_weixin_total = dictionary[kBusiness_analysisModelOnline_pay_online_weixin_total];
	}	
	if(![dictionary[kBusiness_analysisModelOnline_pay_total] isKindOfClass:[NSNull class]]){
		self.online_pay_total = dictionary[kBusiness_analysisModelOnline_pay_total];
	}	
	if(![dictionary[kBusiness_analysisModelOrder_hexiao_money] isKindOfClass:[NSNull class]]){
		self.order_hexiao_money = [dictionary[kBusiness_analysisModelOrder_hexiao_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelOrder_hexiao_total] isKindOfClass:[NSNull class]]){
		self.order_hexiao_total = dictionary[kBusiness_analysisModelOrder_hexiao_total];
	}	
	if(![dictionary[kBusiness_analysisModelOrder_offline_money] isKindOfClass:[NSNull class]]){
		self.order_offline_money = [dictionary[kBusiness_analysisModelOrder_offline_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelOrder_offline_total] isKindOfClass:[NSNull class]]){
		self.order_offline_total = dictionary[kBusiness_analysisModelOrder_offline_total];
	}	
	if(![dictionary[kBusiness_analysisModelOrder_online_money] isKindOfClass:[NSNull class]]){
		self.order_online_money = [dictionary[kBusiness_analysisModelOrder_online_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelOrder_online_total] isKindOfClass:[NSNull class]]){
		self.order_online_total = dictionary[kBusiness_analysisModelOrder_online_total];
	}	
	if(![dictionary[kBusiness_analysisModelOrder_refund_money] isKindOfClass:[NSNull class]]){
		self.order_refund_money = [dictionary[kBusiness_analysisModelOrder_refund_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelOrder_refund_total] isKindOfClass:[NSNull class]]){
		self.order_refund_total = dictionary[kBusiness_analysisModelOrder_refund_total];
	}	
	if(![dictionary[kBusiness_analysisModelOrder_total] isKindOfClass:[NSNull class]]){
		self.order_total = dictionary[kBusiness_analysisModelOrder_total];
	}	
	if(![dictionary[kBusiness_analysisModelOrder_total_money] isKindOfClass:[NSNull class]]){
		self.order_total_money = [dictionary[kBusiness_analysisModelOrder_total_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelShop_pay_money] isKindOfClass:[NSNull class]]){
		self.shop_pay_money = [dictionary[kBusiness_analysisModelShop_pay_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelShop_pay_offline_bank_money] isKindOfClass:[NSNull class]]){
		self.shop_pay_offline_bank_money = [dictionary[kBusiness_analysisModelShop_pay_offline_bank_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelShop_pay_offline_bank_total] isKindOfClass:[NSNull class]]){
		self.shop_pay_offline_bank_total = dictionary[kBusiness_analysisModelShop_pay_offline_bank_total];
	}	
	if(![dictionary[kBusiness_analysisModelShop_pay_offline_cash_money] isKindOfClass:[NSNull class]]){
		self.shop_pay_offline_cash_money = [dictionary[kBusiness_analysisModelShop_pay_offline_cash_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelShop_pay_offline_cash_total] isKindOfClass:[NSNull class]]){
		self.shop_pay_offline_cash_total = dictionary[kBusiness_analysisModelShop_pay_offline_cash_total];
	}	
	if(![dictionary[kBusiness_analysisModelShop_pay_online_alipay_money] isKindOfClass:[NSNull class]]){
		self.shop_pay_online_alipay_money = [dictionary[kBusiness_analysisModelShop_pay_online_alipay_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelShop_pay_online_alipay_total] isKindOfClass:[NSNull class]]){
		self.shop_pay_online_alipay_total = dictionary[kBusiness_analysisModelShop_pay_online_alipay_total];
	}	
	if(![dictionary[kBusiness_analysisModelShop_pay_online_weixin_money] isKindOfClass:[NSNull class]]){
		self.shop_pay_online_weixin_money = [dictionary[kBusiness_analysisModelShop_pay_online_weixin_money] floatValue];
	}

	if(![dictionary[kBusiness_analysisModelShop_pay_online_weixin_total] isKindOfClass:[NSNull class]]){
		self.shop_pay_online_weixin_total = dictionary[kBusiness_analysisModelShop_pay_online_weixin_total];
	}	
	if(![dictionary[kBusiness_analysisModelShop_pay_total] isKindOfClass:[NSNull class]]){
		self.shop_pay_total = dictionary[kBusiness_analysisModelShop_pay_total];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kBusiness_analysisModelOnline_pay_money] = @(self.online_pay_money);
	dictionary[kBusiness_analysisModelOnline_pay_online_weixin_money] = @(self.online_pay_online_weixin_money);
	if(self.online_pay_online_weixin_total != nil){
		dictionary[kBusiness_analysisModelOnline_pay_online_weixin_total] = self.online_pay_online_weixin_total;
	}
	if(self.online_pay_total != nil){
		dictionary[kBusiness_analysisModelOnline_pay_total] = self.online_pay_total;
	}
	dictionary[kBusiness_analysisModelOrder_hexiao_money] = @(self.order_hexiao_money);
	if(self.order_hexiao_total != nil){
		dictionary[kBusiness_analysisModelOrder_hexiao_total] = self.order_hexiao_total;
	}
	dictionary[kBusiness_analysisModelOrder_offline_money] = @(self.order_offline_money);
	if(self.order_offline_total != nil){
		dictionary[kBusiness_analysisModelOrder_offline_total] = self.order_offline_total;
	}
	dictionary[kBusiness_analysisModelOrder_online_money] = @(self.order_online_money);
	if(self.order_online_total != nil){
		dictionary[kBusiness_analysisModelOrder_online_total] = self.order_online_total;
	}
	dictionary[kBusiness_analysisModelOrder_refund_money] = @(self.order_refund_money);
	if(self.order_refund_total != nil){
		dictionary[kBusiness_analysisModelOrder_refund_total] = self.order_refund_total;
	}
	if(self.order_total != nil){
		dictionary[kBusiness_analysisModelOrder_total] = self.order_total;
	}
	dictionary[kBusiness_analysisModelOrder_total_money] = @(self.order_total_money);
	dictionary[kBusiness_analysisModelShop_pay_money] = @(self.shop_pay_money);
	dictionary[kBusiness_analysisModelShop_pay_offline_bank_money] = @(self.shop_pay_offline_bank_money);
	if(self.shop_pay_offline_bank_total != nil){
		dictionary[kBusiness_analysisModelShop_pay_offline_bank_total] = self.shop_pay_offline_bank_total;
	}
	dictionary[kBusiness_analysisModelShop_pay_offline_cash_money] = @(self.shop_pay_offline_cash_money);
	if(self.shop_pay_offline_cash_total != nil){
		dictionary[kBusiness_analysisModelShop_pay_offline_cash_total] = self.shop_pay_offline_cash_total;
	}
	dictionary[kBusiness_analysisModelShop_pay_online_alipay_money] = @(self.shop_pay_online_alipay_money);
	if(self.shop_pay_online_alipay_total != nil){
		dictionary[kBusiness_analysisModelShop_pay_online_alipay_total] = self.shop_pay_online_alipay_total;
	}
	dictionary[kBusiness_analysisModelShop_pay_online_weixin_money] = @(self.shop_pay_online_weixin_money);
	if(self.shop_pay_online_weixin_total != nil){
		dictionary[kBusiness_analysisModelShop_pay_online_weixin_total] = self.shop_pay_online_weixin_total;
	}
	if(self.shop_pay_total != nil){
		dictionary[kBusiness_analysisModelShop_pay_total] = self.shop_pay_total;
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
	[aCoder encodeObject:@(self.online_pay_money) forKey:kBusiness_analysisModelOnline_pay_money];	[aCoder encodeObject:@(self.online_pay_online_weixin_money) forKey:kBusiness_analysisModelOnline_pay_online_weixin_money];	if(self.online_pay_online_weixin_total != nil){
		[aCoder encodeObject:self.online_pay_online_weixin_total forKey:kBusiness_analysisModelOnline_pay_online_weixin_total];
	}
	if(self.online_pay_total != nil){
		[aCoder encodeObject:self.online_pay_total forKey:kBusiness_analysisModelOnline_pay_total];
	}
	[aCoder encodeObject:@(self.order_hexiao_money) forKey:kBusiness_analysisModelOrder_hexiao_money];	if(self.order_hexiao_total != nil){
		[aCoder encodeObject:self.order_hexiao_total forKey:kBusiness_analysisModelOrder_hexiao_total];
	}
	[aCoder encodeObject:@(self.order_offline_money) forKey:kBusiness_analysisModelOrder_offline_money];	if(self.order_offline_total != nil){
		[aCoder encodeObject:self.order_offline_total forKey:kBusiness_analysisModelOrder_offline_total];
	}
	[aCoder encodeObject:@(self.order_online_money) forKey:kBusiness_analysisModelOrder_online_money];	if(self.order_online_total != nil){
		[aCoder encodeObject:self.order_online_total forKey:kBusiness_analysisModelOrder_online_total];
	}
	[aCoder encodeObject:@(self.order_refund_money) forKey:kBusiness_analysisModelOrder_refund_money];	if(self.order_refund_total != nil){
		[aCoder encodeObject:self.order_refund_total forKey:kBusiness_analysisModelOrder_refund_total];
	}
	if(self.order_total != nil){
		[aCoder encodeObject:self.order_total forKey:kBusiness_analysisModelOrder_total];
	}
	[aCoder encodeObject:@(self.order_total_money) forKey:kBusiness_analysisModelOrder_total_money];	[aCoder encodeObject:@(self.shop_pay_money) forKey:kBusiness_analysisModelShop_pay_money];	[aCoder encodeObject:@(self.shop_pay_offline_bank_money) forKey:kBusiness_analysisModelShop_pay_offline_bank_money];	if(self.shop_pay_offline_bank_total != nil){
		[aCoder encodeObject:self.shop_pay_offline_bank_total forKey:kBusiness_analysisModelShop_pay_offline_bank_total];
	}
	[aCoder encodeObject:@(self.shop_pay_offline_cash_money) forKey:kBusiness_analysisModelShop_pay_offline_cash_money];	if(self.shop_pay_offline_cash_total != nil){
		[aCoder encodeObject:self.shop_pay_offline_cash_total forKey:kBusiness_analysisModelShop_pay_offline_cash_total];
	}
	[aCoder encodeObject:@(self.shop_pay_online_alipay_money) forKey:kBusiness_analysisModelShop_pay_online_alipay_money];	if(self.shop_pay_online_alipay_total != nil){
		[aCoder encodeObject:self.shop_pay_online_alipay_total forKey:kBusiness_analysisModelShop_pay_online_alipay_total];
	}
	[aCoder encodeObject:@(self.shop_pay_online_weixin_money) forKey:kBusiness_analysisModelShop_pay_online_weixin_money];	if(self.shop_pay_online_weixin_total != nil){
		[aCoder encodeObject:self.shop_pay_online_weixin_total forKey:kBusiness_analysisModelShop_pay_online_weixin_total];
	}
	if(self.shop_pay_total != nil){
		[aCoder encodeObject:self.shop_pay_total forKey:kBusiness_analysisModelShop_pay_total];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.online_pay_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelOnline_pay_money] floatValue];
	self.online_pay_online_weixin_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelOnline_pay_online_weixin_money] floatValue];
	self.online_pay_online_weixin_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelOnline_pay_online_weixin_total];
	self.online_pay_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelOnline_pay_total];
	self.order_hexiao_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_hexiao_money] floatValue];
	self.order_hexiao_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_hexiao_total];
	self.order_offline_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_offline_money] floatValue];
	self.order_offline_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_offline_total];
	self.order_online_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_online_money] floatValue];
	self.order_online_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_online_total];
	self.order_refund_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_refund_money] floatValue];
	self.order_refund_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_refund_total];
	self.order_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_total];
	self.order_total_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelOrder_total_money] floatValue];
	self.shop_pay_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_money] floatValue];
	self.shop_pay_offline_bank_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_offline_bank_money] floatValue];
	self.shop_pay_offline_bank_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_offline_bank_total];
	self.shop_pay_offline_cash_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_offline_cash_money] floatValue];
	self.shop_pay_offline_cash_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_offline_cash_total];
	self.shop_pay_online_alipay_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_online_alipay_money] floatValue];
	self.shop_pay_online_alipay_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_online_alipay_total];
	self.shop_pay_online_weixin_money = [[aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_online_weixin_money] floatValue];
	self.shop_pay_online_weixin_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_online_weixin_total];
	self.shop_pay_total = [aDecoder decodeObjectForKey:kBusiness_analysisModelShop_pay_total];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Business_analysisModel *copy = [Business_analysisModel new];

	copy.online_pay_money = self.online_pay_money;
	copy.online_pay_online_weixin_money = self.online_pay_online_weixin_money;
	copy.online_pay_online_weixin_total = [self.online_pay_online_weixin_total copy];
	copy.online_pay_total = [self.online_pay_total copy];
	copy.order_hexiao_money = self.order_hexiao_money;
	copy.order_hexiao_total = [self.order_hexiao_total copy];
	copy.order_offline_money = self.order_offline_money;
	copy.order_offline_total = [self.order_offline_total copy];
	copy.order_online_money = self.order_online_money;
	copy.order_online_total = [self.order_online_total copy];
	copy.order_refund_money = self.order_refund_money;
	copy.order_refund_total = [self.order_refund_total copy];
	copy.order_total = [self.order_total copy];
	copy.order_total_money = self.order_total_money;
	copy.shop_pay_money = self.shop_pay_money;
	copy.shop_pay_offline_bank_money = self.shop_pay_offline_bank_money;
	copy.shop_pay_offline_bank_total = [self.shop_pay_offline_bank_total copy];
	copy.shop_pay_offline_cash_money = self.shop_pay_offline_cash_money;
	copy.shop_pay_offline_cash_total = [self.shop_pay_offline_cash_total copy];
	copy.shop_pay_online_alipay_money = self.shop_pay_online_alipay_money;
	copy.shop_pay_online_alipay_total = [self.shop_pay_online_alipay_total copy];
	copy.shop_pay_online_weixin_money = self.shop_pay_online_weixin_money;
	copy.shop_pay_online_weixin_total = [self.shop_pay_online_weixin_total copy];
	copy.shop_pay_total = [self.shop_pay_total copy];

	return copy;
}
@end