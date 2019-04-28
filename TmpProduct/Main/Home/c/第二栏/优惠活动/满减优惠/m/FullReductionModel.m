//
//	FullReductionModel.m

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.




#import "FullReductionModel.h"

NSString *const kFullReductionModelAdmin_id = @"admin_id";
NSString *const kFullReductionModelAmount = @"amount";
NSString *const kFullReductionModelCreated_at = @"created_at";
NSString *const kFullReductionModelDeleted_at = @"deleted_at";
NSString *const kFullReductionModelDesc = @"desc";
NSString *const kFullReductionModelDiscount = @"discount";
NSString *const kFullReductionModelEnd_time = @"end_time";
NSString *const kFullReductionModelGrant_num = @"grant_num";
NSString *const kFullReductionModelIdField = @"id";
NSString *const kFullReductionModelLimit_num = @"limit_num";
NSString *const kFullReductionModelName = @"name";
NSString *const kFullReductionModelShop_id = @"shop_id";
NSString *const kFullReductionModelStart_time = @"start_time";
NSString *const kFullReductionModelStatus = @"status";
NSString *const kFullReductionModelType = @"type";
NSString *const kFullReductionModelUpdated_at = @"updated_at";

@interface FullReductionModel ()
@end
@implementation FullReductionModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kFullReductionModelAdmin_id] isKindOfClass:[NSNull class]]){
		self.admin_id = [dictionary[kFullReductionModelAdmin_id] integerValue];
	}

	if(![dictionary[kFullReductionModelAmount] isKindOfClass:[NSNull class]]){
		self.amount = dictionary[kFullReductionModelAmount];
	}	
	if(![dictionary[kFullReductionModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kFullReductionModelCreated_at];
	}	
	if(![dictionary[kFullReductionModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kFullReductionModelDeleted_at];
	}	
	if(![dictionary[kFullReductionModelDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kFullReductionModelDesc];
	}	
	if(![dictionary[kFullReductionModelDiscount] isKindOfClass:[NSNull class]]){
		self.discount = dictionary[kFullReductionModelDiscount];
	}	
	if(![dictionary[kFullReductionModelEnd_time] isKindOfClass:[NSNull class]]){
		self.end_time = dictionary[kFullReductionModelEnd_time];
	}	
	if(![dictionary[kFullReductionModelGrant_num] isKindOfClass:[NSNull class]]){
		self.grant_num = [dictionary[kFullReductionModelGrant_num] integerValue];
	}

	if(![dictionary[kFullReductionModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kFullReductionModelIdField];
	}

	if(![dictionary[kFullReductionModelLimit_num] isKindOfClass:[NSNull class]]){
		self.limit_num = [dictionary[kFullReductionModelLimit_num] integerValue];
	}

	if(![dictionary[kFullReductionModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kFullReductionModelName];
	}	
	if(![dictionary[kFullReductionModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = [dictionary[kFullReductionModelShop_id] integerValue];
	}

	if(![dictionary[kFullReductionModelStart_time] isKindOfClass:[NSNull class]]){
		self.start_time = dictionary[kFullReductionModelStart_time];
	}	
	if(![dictionary[kFullReductionModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kFullReductionModelStatus] integerValue];
	}

	if(![dictionary[kFullReductionModelType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kFullReductionModelType] integerValue];
	}

	if(![dictionary[kFullReductionModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kFullReductionModelUpdated_at];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kFullReductionModelAdmin_id] = @(self.admin_id);
	if(self.amount != nil){
		dictionary[kFullReductionModelAmount] = self.amount;
	}
	if(self.created_at != nil){
		dictionary[kFullReductionModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kFullReductionModelDeleted_at] = self.deleted_at;
	}
	if(self.desc != nil){
		dictionary[kFullReductionModelDesc] = self.desc;
	}
	if(self.discount != nil){
		dictionary[kFullReductionModelDiscount] = self.discount;
	}
	if(self.end_time != nil){
		dictionary[kFullReductionModelEnd_time] = self.end_time;
	}
	dictionary[kFullReductionModelGrant_num] = @(self.grant_num);
	dictionary[kFullReductionModelIdField] = self.idField;
	dictionary[kFullReductionModelLimit_num] = @(self.limit_num);
	if(self.name != nil){
		dictionary[kFullReductionModelName] = self.name;
	}
	dictionary[kFullReductionModelShop_id] = @(self.shop_id);
	if(self.start_time != nil){
		dictionary[kFullReductionModelStart_time] = self.start_time;
	}
	dictionary[kFullReductionModelStatus] = @(self.status);
	dictionary[kFullReductionModelType] = @(self.type);
	if(self.updated_at != nil){
		dictionary[kFullReductionModelUpdated_at] = self.updated_at;
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
	[aCoder encodeObject:@(self.admin_id) forKey:kFullReductionModelAdmin_id];	if(self.amount != nil){
		[aCoder encodeObject:self.amount forKey:kFullReductionModelAmount];
	}
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kFullReductionModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kFullReductionModelDeleted_at];
	}
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:kFullReductionModelDesc];
	}
	if(self.discount != nil){
		[aCoder encodeObject:self.discount forKey:kFullReductionModelDiscount];
	}
	if(self.end_time != nil){
		[aCoder encodeObject:self.end_time forKey:kFullReductionModelEnd_time];
	}
	[aCoder encodeObject:@(self.grant_num) forKey:kFullReductionModelGrant_num];
    [aCoder encodeObject:self.idField forKey:kFullReductionModelIdField];
    [aCoder encodeObject:@(self.limit_num) forKey:kFullReductionModelLimit_num];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kFullReductionModelName];
	}
	[aCoder encodeObject:@(self.shop_id) forKey:kFullReductionModelShop_id];	if(self.start_time != nil){
		[aCoder encodeObject:self.start_time forKey:kFullReductionModelStart_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kFullReductionModelStatus];	[aCoder encodeObject:@(self.type) forKey:kFullReductionModelType];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kFullReductionModelUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.admin_id = [[aDecoder decodeObjectForKey:kFullReductionModelAdmin_id] integerValue];
	self.amount = [aDecoder decodeObjectForKey:kFullReductionModelAmount];
	self.created_at = [aDecoder decodeObjectForKey:kFullReductionModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kFullReductionModelDeleted_at];
	self.desc = [aDecoder decodeObjectForKey:kFullReductionModelDesc];
	self.discount = [aDecoder decodeObjectForKey:kFullReductionModelDiscount];
	self.end_time = [aDecoder decodeObjectForKey:kFullReductionModelEnd_time];
	self.grant_num = [[aDecoder decodeObjectForKey:kFullReductionModelGrant_num] integerValue];
	self.idField = [aDecoder decodeObjectForKey:kFullReductionModelIdField];
	self.limit_num = [[aDecoder decodeObjectForKey:kFullReductionModelLimit_num] integerValue];
	self.name = [aDecoder decodeObjectForKey:kFullReductionModelName];
	self.shop_id = [[aDecoder decodeObjectForKey:kFullReductionModelShop_id] integerValue];
	self.start_time = [aDecoder decodeObjectForKey:kFullReductionModelStart_time];
	self.status = [[aDecoder decodeObjectForKey:kFullReductionModelStatus] integerValue];
	self.type = [[aDecoder decodeObjectForKey:kFullReductionModelType] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kFullReductionModelUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	FullReductionModel *copy = [FullReductionModel new];

	copy.admin_id = self.admin_id;
	copy.amount = [self.amount copy];
	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.desc = [self.desc copy];
	copy.discount = [self.discount copy];
	copy.end_time = [self.end_time copy];
	copy.grant_num = self.grant_num;
	copy.idField = self.idField;
	copy.limit_num = self.limit_num;
	copy.name = [self.name copy];
	copy.shop_id = self.shop_id;
	copy.start_time = [self.start_time copy];
	copy.status = self.status;
	copy.type = self.type;
	copy.updated_at = [self.updated_at copy];

	return copy;
}
@end
