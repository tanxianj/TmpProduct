//
//	CouponCheckModel.m

//  创建于 20/4/2019
//	Copyright © 2019. All rights reserved.




#import "CouponCheckModel.h"

NSString *const kCouponCheckModelCid = @"cid";
NSString *const kCouponCheckModelCode = @"code";
NSString *const kCouponCheckModelCreated_at = @"created_at";
NSString *const kCouponCheckModelDeleted_at = @"deleted_at";
NSString *const kCouponCheckModelGet_order_id = @"get_order_id";
NSString *const kCouponCheckModelIdField = @"id";
NSString *const kCouponCheckModelImg = @"img";
NSString *const kCouponCheckModelMobile = @"mobile";
NSString *const kCouponCheckModelMoney = @"money";
NSString *const kCouponCheckModelName = @"name";
NSString *const kCouponCheckModelOrder_id = @"order_id";
NSString *const kCouponCheckModelStatus = @"status";
NSString *const kCouponCheckModelType = @"type";
NSString *const kCouponCheckModelUpdated_at = @"updated_at";
NSString *const kCouponCheckModelUse_time = @"use_time";
NSString *const kCouponCheckModelUser_id = @"user_id";
NSString *const kCouponCheckModelUsername = @"username";

@interface CouponCheckModel ()
@end
@implementation CouponCheckModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCouponCheckModelCid] isKindOfClass:[NSNull class]]){
		self.cid = [dictionary[kCouponCheckModelCid] integerValue];
	}

	if(![dictionary[kCouponCheckModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kCouponCheckModelCode];
	}	
	if(![dictionary[kCouponCheckModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kCouponCheckModelCreated_at];
	}	
	if(![dictionary[kCouponCheckModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kCouponCheckModelDeleted_at];
	}	
	if(![dictionary[kCouponCheckModelGet_order_id] isKindOfClass:[NSNull class]]){
		self.get_order_id = [dictionary[kCouponCheckModelGet_order_id] integerValue];
	}

	if(![dictionary[kCouponCheckModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kCouponCheckModelIdField] integerValue];
	}

	if(![dictionary[kCouponCheckModelImg] isKindOfClass:[NSNull class]]){
		self.img = dictionary[kCouponCheckModelImg];
	}	
	if(![dictionary[kCouponCheckModelMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kCouponCheckModelMobile];
	}	
	if(![dictionary[kCouponCheckModelMoney] isKindOfClass:[NSNull class]]){
		self.money = dictionary[kCouponCheckModelMoney];
	}	
	if(![dictionary[kCouponCheckModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kCouponCheckModelName];
	}	
	if(![dictionary[kCouponCheckModelOrder_id] isKindOfClass:[NSNull class]]){
		self.order_id = [dictionary[kCouponCheckModelOrder_id] integerValue];
	}

	if(![dictionary[kCouponCheckModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kCouponCheckModelStatus] integerValue];
	}

	if(![dictionary[kCouponCheckModelType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kCouponCheckModelType] integerValue];
	}

	if(![dictionary[kCouponCheckModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kCouponCheckModelUpdated_at];
	}	
	if(![dictionary[kCouponCheckModelUse_time] isKindOfClass:[NSNull class]]){
		self.use_time = dictionary[kCouponCheckModelUse_time];
	}	
	if(![dictionary[kCouponCheckModelUser_id] isKindOfClass:[NSNull class]]){
		self.user_id = [dictionary[kCouponCheckModelUser_id] integerValue];
	}

	if(![dictionary[kCouponCheckModelUsername] isKindOfClass:[NSNull class]]){
		self.username = dictionary[kCouponCheckModelUsername];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kCouponCheckModelCid] = @(self.cid);
	if(self.code != nil){
		dictionary[kCouponCheckModelCode] = self.code;
	}
	if(self.created_at != nil){
		dictionary[kCouponCheckModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kCouponCheckModelDeleted_at] = self.deleted_at;
	}
	dictionary[kCouponCheckModelGet_order_id] = @(self.get_order_id);
	dictionary[kCouponCheckModelIdField] = @(self.idField);
	if(self.img != nil){
		dictionary[kCouponCheckModelImg] = self.img;
	}
	if(self.mobile != nil){
		dictionary[kCouponCheckModelMobile] = self.mobile;
	}
	if(self.money != nil){
		dictionary[kCouponCheckModelMoney] = self.money;
	}
	if(self.name != nil){
		dictionary[kCouponCheckModelName] = self.name;
	}
	dictionary[kCouponCheckModelOrder_id] = @(self.order_id);
	dictionary[kCouponCheckModelStatus] = @(self.status);
	dictionary[kCouponCheckModelType] = @(self.type);
	if(self.updated_at != nil){
		dictionary[kCouponCheckModelUpdated_at] = self.updated_at;
	}
	if(self.use_time != nil){
		dictionary[kCouponCheckModelUse_time] = self.use_time;
	}
	dictionary[kCouponCheckModelUser_id] = @(self.user_id);
	if(self.username != nil){
		dictionary[kCouponCheckModelUsername] = self.username;
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
	[aCoder encodeObject:@(self.cid) forKey:kCouponCheckModelCid];	if(self.code != nil){
		[aCoder encodeObject:self.code forKey:kCouponCheckModelCode];
	}
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kCouponCheckModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kCouponCheckModelDeleted_at];
	}
	[aCoder encodeObject:@(self.get_order_id) forKey:kCouponCheckModelGet_order_id];	[aCoder encodeObject:@(self.idField) forKey:kCouponCheckModelIdField];	if(self.img != nil){
		[aCoder encodeObject:self.img forKey:kCouponCheckModelImg];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kCouponCheckModelMobile];
	}
	if(self.money != nil){
		[aCoder encodeObject:self.money forKey:kCouponCheckModelMoney];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kCouponCheckModelName];
	}
	[aCoder encodeObject:@(self.order_id) forKey:kCouponCheckModelOrder_id];	[aCoder encodeObject:@(self.status) forKey:kCouponCheckModelStatus];	[aCoder encodeObject:@(self.type) forKey:kCouponCheckModelType];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kCouponCheckModelUpdated_at];
	}
	if(self.use_time != nil){
		[aCoder encodeObject:self.use_time forKey:kCouponCheckModelUse_time];
	}
	[aCoder encodeObject:@(self.user_id) forKey:kCouponCheckModelUser_id];	if(self.username != nil){
		[aCoder encodeObject:self.username forKey:kCouponCheckModelUsername];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.cid = [[aDecoder decodeObjectForKey:kCouponCheckModelCid] integerValue];
	self.code = [aDecoder decodeObjectForKey:kCouponCheckModelCode];
	self.created_at = [aDecoder decodeObjectForKey:kCouponCheckModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kCouponCheckModelDeleted_at];
	self.get_order_id = [[aDecoder decodeObjectForKey:kCouponCheckModelGet_order_id] integerValue];
	self.idField = [[aDecoder decodeObjectForKey:kCouponCheckModelIdField] integerValue];
	self.img = [aDecoder decodeObjectForKey:kCouponCheckModelImg];
	self.mobile = [aDecoder decodeObjectForKey:kCouponCheckModelMobile];
	self.money = [aDecoder decodeObjectForKey:kCouponCheckModelMoney];
	self.name = [aDecoder decodeObjectForKey:kCouponCheckModelName];
	self.order_id = [[aDecoder decodeObjectForKey:kCouponCheckModelOrder_id] integerValue];
	self.status = [[aDecoder decodeObjectForKey:kCouponCheckModelStatus] integerValue];
	self.type = [[aDecoder decodeObjectForKey:kCouponCheckModelType] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kCouponCheckModelUpdated_at];
	self.use_time = [aDecoder decodeObjectForKey:kCouponCheckModelUse_time];
	self.user_id = [[aDecoder decodeObjectForKey:kCouponCheckModelUser_id] integerValue];
	self.username = [aDecoder decodeObjectForKey:kCouponCheckModelUsername];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	CouponCheckModel *copy = [CouponCheckModel new];

	copy.cid = self.cid;
	copy.code = [self.code copy];
	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.get_order_id = self.get_order_id;
	copy.idField = self.idField;
	copy.img = [self.img copy];
	copy.mobile = [self.mobile copy];
	copy.money = [self.money copy];
	copy.name = [self.name copy];
	copy.order_id = self.order_id;
	copy.status = self.status;
	copy.type = self.type;
	copy.updated_at = [self.updated_at copy];
	copy.use_time = [self.use_time copy];
	copy.user_id = self.user_id;
	copy.username = [self.username copy];

	return copy;
}
@end