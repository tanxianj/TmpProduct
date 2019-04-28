//
//	CapitalFlowSectionHeaderModel.m

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.




#import "CapitalFlowSectionHeaderModel.h"

NSString *const kCapitalFlowSectionHeaderModelOrder_offline_money = @"order_offline_money";
NSString *const kCapitalFlowSectionHeaderModelOrder_online_money = @"order_online_money";
NSString *const kCapitalFlowSectionHeaderModelRemit_account = @"remit_account";

@interface CapitalFlowSectionHeaderModel ()
@end
@implementation CapitalFlowSectionHeaderModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCapitalFlowSectionHeaderModelOrder_offline_money] isKindOfClass:[NSNull class]]){
		self.order_offline_money = [dictionary[kCapitalFlowSectionHeaderModelOrder_offline_money] floatValue];
	}

	if(![dictionary[kCapitalFlowSectionHeaderModelOrder_online_money] isKindOfClass:[NSNull class]]){
		self.order_online_money = [dictionary[kCapitalFlowSectionHeaderModelOrder_online_money] floatValue];
	}

	if(![dictionary[kCapitalFlowSectionHeaderModelRemit_account] isKindOfClass:[NSNull class]]){
		self.remit_account = [dictionary[kCapitalFlowSectionHeaderModelRemit_account] floatValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kCapitalFlowSectionHeaderModelOrder_offline_money] = @(self.order_offline_money);
	dictionary[kCapitalFlowSectionHeaderModelOrder_online_money] = @(self.order_online_money);
	dictionary[kCapitalFlowSectionHeaderModelRemit_account] = @(self.remit_account);
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
	[aCoder encodeObject:@(self.order_offline_money) forKey:kCapitalFlowSectionHeaderModelOrder_offline_money];	[aCoder encodeObject:@(self.order_online_money) forKey:kCapitalFlowSectionHeaderModelOrder_online_money];	[aCoder encodeObject:@(self.remit_account) forKey:kCapitalFlowSectionHeaderModelRemit_account];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.order_offline_money = [[aDecoder decodeObjectForKey:kCapitalFlowSectionHeaderModelOrder_offline_money] floatValue];
	self.order_online_money = [[aDecoder decodeObjectForKey:kCapitalFlowSectionHeaderModelOrder_online_money] floatValue];
	self.remit_account = [[aDecoder decodeObjectForKey:kCapitalFlowSectionHeaderModelRemit_account] floatValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CapitalFlowSectionHeaderModel *copy = [CapitalFlowSectionHeaderModel new];

	copy.order_offline_money = self.order_offline_money;
	copy.order_online_money = self.order_online_money;
	copy.remit_account = self.remit_account;

	return copy;
}
@end