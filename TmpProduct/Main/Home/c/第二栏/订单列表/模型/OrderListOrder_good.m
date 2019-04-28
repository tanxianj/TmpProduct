//
//	OrderListOrder_good.m

//  创建于 22/4/2019
//	Copyright © 2019. All rights reserved.




#import "OrderListOrder_good.h"

NSString *const kOrderListOrder_goodCreated_at = @"created_at";
NSString *const kOrderListOrder_goodGoods_id = @"goods_id";
NSString *const kOrderListOrder_goodGoods_money = @"goods_money";
NSString *const kOrderListOrder_goodGoods_name = @"goods_name";
NSString *const kOrderListOrder_goodGoods_num = @"goods_num";
NSString *const kOrderListOrder_goodIdField = @"id";
NSString *const kOrderListOrder_goodImage = @"image";
NSString *const kOrderListOrder_goodOrder_id = @"order_id";
NSString *const kOrderListOrder_goodTotal_money = @"total_money";
NSString *const kOrderListOrder_goodUpdated_at = @"updated_at";

@interface OrderListOrder_good ()
@end
@implementation OrderListOrder_good




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kOrderListOrder_goodCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kOrderListOrder_goodCreated_at];
	}	
	if(![dictionary[kOrderListOrder_goodGoods_id] isKindOfClass:[NSNull class]]){
		self.goods_id = [dictionary[kOrderListOrder_goodGoods_id] integerValue];
	}

	if(![dictionary[kOrderListOrder_goodGoods_money] isKindOfClass:[NSNull class]]){
		self.goods_money = dictionary[kOrderListOrder_goodGoods_money];
	}	
	if(![dictionary[kOrderListOrder_goodGoods_name] isKindOfClass:[NSNull class]]){
		self.goods_name = dictionary[kOrderListOrder_goodGoods_name];
	}	
	if(![dictionary[kOrderListOrder_goodGoods_num] isKindOfClass:[NSNull class]]){
		self.goods_num = [dictionary[kOrderListOrder_goodGoods_num] integerValue];
	}

	if(![dictionary[kOrderListOrder_goodIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kOrderListOrder_goodIdField] integerValue];
	}

	if(![dictionary[kOrderListOrder_goodImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kOrderListOrder_goodImage];
	}	
	if(![dictionary[kOrderListOrder_goodOrder_id] isKindOfClass:[NSNull class]]){
		self.order_id = [dictionary[kOrderListOrder_goodOrder_id] integerValue];
	}

	if(![dictionary[kOrderListOrder_goodTotal_money] isKindOfClass:[NSNull class]]){
		self.total_money = dictionary[kOrderListOrder_goodTotal_money];
	}	
	if(![dictionary[kOrderListOrder_goodUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kOrderListOrder_goodUpdated_at];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.created_at != nil){
		dictionary[kOrderListOrder_goodCreated_at] = self.created_at;
	}
	dictionary[kOrderListOrder_goodGoods_id] = @(self.goods_id);
	if(self.goods_money != nil){
		dictionary[kOrderListOrder_goodGoods_money] = self.goods_money;
	}
	if(self.goods_name != nil){
		dictionary[kOrderListOrder_goodGoods_name] = self.goods_name;
	}
	dictionary[kOrderListOrder_goodGoods_num] = @(self.goods_num);
	dictionary[kOrderListOrder_goodIdField] = @(self.idField);
	if(self.image != nil){
		dictionary[kOrderListOrder_goodImage] = self.image;
	}
	dictionary[kOrderListOrder_goodOrder_id] = @(self.order_id);
	if(self.total_money != nil){
		dictionary[kOrderListOrder_goodTotal_money] = self.total_money;
	}
	if(self.updated_at != nil){
		dictionary[kOrderListOrder_goodUpdated_at] = self.updated_at;
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
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kOrderListOrder_goodCreated_at];
	}
	[aCoder encodeObject:@(self.goods_id) forKey:kOrderListOrder_goodGoods_id];	if(self.goods_money != nil){
		[aCoder encodeObject:self.goods_money forKey:kOrderListOrder_goodGoods_money];
	}
	if(self.goods_name != nil){
		[aCoder encodeObject:self.goods_name forKey:kOrderListOrder_goodGoods_name];
	}
	[aCoder encodeObject:@(self.goods_num) forKey:kOrderListOrder_goodGoods_num];	[aCoder encodeObject:@(self.idField) forKey:kOrderListOrder_goodIdField];	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:kOrderListOrder_goodImage];
	}
	[aCoder encodeObject:@(self.order_id) forKey:kOrderListOrder_goodOrder_id];	if(self.total_money != nil){
		[aCoder encodeObject:self.total_money forKey:kOrderListOrder_goodTotal_money];
	}
	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kOrderListOrder_goodUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.created_at = [aDecoder decodeObjectForKey:kOrderListOrder_goodCreated_at];
	self.goods_id = [[aDecoder decodeObjectForKey:kOrderListOrder_goodGoods_id] integerValue];
	self.goods_money = [aDecoder decodeObjectForKey:kOrderListOrder_goodGoods_money];
	self.goods_name = [aDecoder decodeObjectForKey:kOrderListOrder_goodGoods_name];
	self.goods_num = [[aDecoder decodeObjectForKey:kOrderListOrder_goodGoods_num] integerValue];
	self.idField = [[aDecoder decodeObjectForKey:kOrderListOrder_goodIdField] integerValue];
	self.image = [aDecoder decodeObjectForKey:kOrderListOrder_goodImage];
	self.order_id = [[aDecoder decodeObjectForKey:kOrderListOrder_goodOrder_id] integerValue];
	self.total_money = [aDecoder decodeObjectForKey:kOrderListOrder_goodTotal_money];
	self.updated_at = [aDecoder decodeObjectForKey:kOrderListOrder_goodUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	OrderListOrder_good *copy = [OrderListOrder_good new];

	copy.created_at = [self.created_at copy];
	copy.goods_id = self.goods_id;
	copy.goods_money = [self.goods_money copy];
	copy.goods_name = [self.goods_name copy];
	copy.goods_num = self.goods_num;
	copy.idField = self.idField;
	copy.image = [self.image copy];
	copy.order_id = self.order_id;
	copy.total_money = [self.total_money copy];
	copy.updated_at = [self.updated_at copy];

	return copy;
}
@end