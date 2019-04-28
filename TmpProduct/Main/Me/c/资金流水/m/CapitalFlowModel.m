//
//	CapitalFlowModel.m

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.




#import "CapitalFlowModel.h"

NSString *const kCapitalFlowModelEarnings = @"earnings";
NSString *const kCapitalFlowModelOrder_affirm_money = @"order_affirm_money";
NSString *const kCapitalFlowModelOrder_offline_total_money = @"order_offline_total_money";
NSString *const kCapitalFlowModelOrder_online_total_money = @"order_online_total_money";
NSString *const kCapitalFlowModelOrder_total_money = @"order_total_money";

@interface CapitalFlowModel ()
@end
@implementation CapitalFlowModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCapitalFlowModelEarnings] isKindOfClass:[NSNull class]]){
		self.earnings = [dictionary[kCapitalFlowModelEarnings] floatValue];
	}

	if(![dictionary[kCapitalFlowModelOrder_affirm_money] isKindOfClass:[NSNull class]]){
		self.order_affirm_money = [dictionary[kCapitalFlowModelOrder_affirm_money] floatValue];
	}

	if(![dictionary[kCapitalFlowModelOrder_offline_total_money] isKindOfClass:[NSNull class]]){
		self.order_offline_total_money = [dictionary[kCapitalFlowModelOrder_offline_total_money] floatValue];
	}

	if(![dictionary[kCapitalFlowModelOrder_online_total_money] isKindOfClass:[NSNull class]]){
		self.order_online_total_money = [dictionary[kCapitalFlowModelOrder_online_total_money] floatValue];
	}

	if(![dictionary[kCapitalFlowModelOrder_total_money] isKindOfClass:[NSNull class]]){
		self.order_total_money = [dictionary[kCapitalFlowModelOrder_total_money] floatValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kCapitalFlowModelEarnings] = @(self.earnings);
	dictionary[kCapitalFlowModelOrder_affirm_money] = @(self.order_affirm_money);
	dictionary[kCapitalFlowModelOrder_offline_total_money] = @(self.order_offline_total_money);
	dictionary[kCapitalFlowModelOrder_online_total_money] = @(self.order_online_total_money);
	dictionary[kCapitalFlowModelOrder_total_money] = @(self.order_total_money);
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
	[aCoder encodeObject:@(self.earnings) forKey:kCapitalFlowModelEarnings];	[aCoder encodeObject:@(self.order_affirm_money) forKey:kCapitalFlowModelOrder_affirm_money];	[aCoder encodeObject:@(self.order_offline_total_money) forKey:kCapitalFlowModelOrder_offline_total_money];	[aCoder encodeObject:@(self.order_online_total_money) forKey:kCapitalFlowModelOrder_online_total_money];	[aCoder encodeObject:@(self.order_total_money) forKey:kCapitalFlowModelOrder_total_money];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.earnings = [[aDecoder decodeObjectForKey:kCapitalFlowModelEarnings] floatValue];
	self.order_affirm_money = [[aDecoder decodeObjectForKey:kCapitalFlowModelOrder_affirm_money] floatValue];
	self.order_offline_total_money = [[aDecoder decodeObjectForKey:kCapitalFlowModelOrder_offline_total_money] floatValue];
	self.order_online_total_money = [[aDecoder decodeObjectForKey:kCapitalFlowModelOrder_online_total_money] floatValue];
	self.order_total_money = [[aDecoder decodeObjectForKey:kCapitalFlowModelOrder_total_money] floatValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CapitalFlowModel *copy = [CapitalFlowModel new];

	copy.earnings = self.earnings;
	copy.order_affirm_money = self.order_affirm_money;
	copy.order_offline_total_money = self.order_offline_total_money;
	copy.order_online_total_money = self.order_online_total_money;
	copy.order_total_money = self.order_total_money;

	return copy;
}
@end