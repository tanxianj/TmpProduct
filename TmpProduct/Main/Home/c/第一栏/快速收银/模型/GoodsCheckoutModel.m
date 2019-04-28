//
//	GoodsCheckoutModel.m

//  创建于 19/4/2019
//	Copyright © 2019. All rights reserved.




#import "GoodsCheckoutModel.h"

NSString *const kGoodsCheckoutModelGoods_id = @"goods_id";
NSString *const kGoodsCheckoutModelGoods_name = @"goods_name";
NSString *const kGoodsCheckoutModelGoods_num = @"goods_num";
NSString *const kGoodsCheckoutModelGoods_price = @"goods_price";

@interface GoodsCheckoutModel ()
@end
@implementation GoodsCheckoutModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGoodsCheckoutModelGoods_id] isKindOfClass:[NSNull class]]){
		self.goods_id = dictionary[kGoodsCheckoutModelGoods_id];
	}	
	if(![dictionary[kGoodsCheckoutModelGoods_name] isKindOfClass:[NSNull class]]){
		self.goods_name = dictionary[kGoodsCheckoutModelGoods_name];
	}	
	if(![dictionary[kGoodsCheckoutModelGoods_num] isKindOfClass:[NSNull class]]){
		self.goods_num = dictionary[kGoodsCheckoutModelGoods_num];
	}	
	if(![dictionary[kGoodsCheckoutModelGoods_price] isKindOfClass:[NSNull class]]){
		self.goods_price = dictionary[kGoodsCheckoutModelGoods_price];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.goods_id != nil){
		dictionary[kGoodsCheckoutModelGoods_id] = self.goods_id;
	}
	if(self.goods_name != nil){
		dictionary[kGoodsCheckoutModelGoods_name] = self.goods_name;
	}
	if(self.goods_num != nil){
		dictionary[kGoodsCheckoutModelGoods_num] = self.goods_num;
	}
	if(self.goods_price != nil){
		dictionary[kGoodsCheckoutModelGoods_price] = self.goods_price;
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
	if(self.goods_id != nil){
		[aCoder encodeObject:self.goods_id forKey:kGoodsCheckoutModelGoods_id];
	}
	if(self.goods_name != nil){
		[aCoder encodeObject:self.goods_name forKey:kGoodsCheckoutModelGoods_name];
	}
	if(self.goods_num != nil){
		[aCoder encodeObject:self.goods_num forKey:kGoodsCheckoutModelGoods_num];
	}
	if(self.goods_price != nil){
		[aCoder encodeObject:self.goods_price forKey:kGoodsCheckoutModelGoods_price];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.goods_id = [aDecoder decodeObjectForKey:kGoodsCheckoutModelGoods_id];
	self.goods_name = [aDecoder decodeObjectForKey:kGoodsCheckoutModelGoods_name];
	self.goods_num = [aDecoder decodeObjectForKey:kGoodsCheckoutModelGoods_num];
	self.goods_price = [aDecoder decodeObjectForKey:kGoodsCheckoutModelGoods_price];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GoodsCheckoutModel *copy = [GoodsCheckoutModel new];

	copy.goods_id = [self.goods_id copy];
	copy.goods_name = [self.goods_name copy];
	copy.goods_num = [self.goods_num copy];
	copy.goods_price = [self.goods_price copy];

	return copy;
}
@end