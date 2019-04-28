//
//	ElectronicPreferencesModel.m

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.




#import "ElectronicPreferencesModel.h"

NSString *const kElectronicPreferencesModelAdmin_id = @"admin_id";
NSString *const kElectronicPreferencesModelCreated_at = @"created_at";
NSString *const kElectronicPreferencesModelDeleted_at = @"deleted_at";
NSString *const kElectronicPreferencesModelDesc = @"desc";
NSString *const kElectronicPreferencesModelEnd_time = @"end_time";
NSString *const kElectronicPreferencesModelIdField = @"id";
NSString *const kElectronicPreferencesModelMoney = @"money";
NSString *const kElectronicPreferencesModelName = @"name";
NSString *const kElectronicPreferencesModelProvide_num = @"provide_num";
NSString *const kElectronicPreferencesModelProvide_type = @"provide_type";
NSString *const kElectronicPreferencesModelSent_num = @"sent_num";
NSString *const kElectronicPreferencesModelShop_id = @"shop_id";
NSString *const kElectronicPreferencesModelShop_id_str = @"shop_id_str";
NSString *const kElectronicPreferencesModelShop_id_str_name = @"shop_id_str_name";
NSString *const kElectronicPreferencesModelSort = @"sort";
NSString *const kElectronicPreferencesModelStart_time = @"start_time";
NSString *const kElectronicPreferencesModelStatus = @"status";
NSString *const kElectronicPreferencesModelType = @"type";
NSString *const kElectronicPreferencesModelUpdated_at = @"updated_at";
NSString *const kElectronicPreferencesModelUse_num = @"use_num";

@interface ElectronicPreferencesModel ()
@end
@implementation ElectronicPreferencesModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kElectronicPreferencesModelAdmin_id] isKindOfClass:[NSNull class]]){
		self.admin_id = [dictionary[kElectronicPreferencesModelAdmin_id] integerValue];
	}

	if(![dictionary[kElectronicPreferencesModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kElectronicPreferencesModelCreated_at];
	}	
	if(![dictionary[kElectronicPreferencesModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kElectronicPreferencesModelDeleted_at];
	}	
	if(![dictionary[kElectronicPreferencesModelDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kElectronicPreferencesModelDesc];
	}	
	if(![dictionary[kElectronicPreferencesModelEnd_time] isKindOfClass:[NSNull class]]){
		self.end_time = dictionary[kElectronicPreferencesModelEnd_time];
	}	
	if(![dictionary[kElectronicPreferencesModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kElectronicPreferencesModelIdField];
	}

	if(![dictionary[kElectronicPreferencesModelMoney] isKindOfClass:[NSNull class]]){
		self.money = dictionary[kElectronicPreferencesModelMoney];
	}	
	if(![dictionary[kElectronicPreferencesModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kElectronicPreferencesModelName];
	}	
	if(![dictionary[kElectronicPreferencesModelProvide_num] isKindOfClass:[NSNull class]]){
		self.provide_num = [dictionary[kElectronicPreferencesModelProvide_num] integerValue];
	}

	if(![dictionary[kElectronicPreferencesModelProvide_type] isKindOfClass:[NSNull class]]){
		self.provide_type = [dictionary[kElectronicPreferencesModelProvide_type] integerValue];
	}

	if(![dictionary[kElectronicPreferencesModelSent_num] isKindOfClass:[NSNull class]]){
		self.sent_num = [dictionary[kElectronicPreferencesModelSent_num] integerValue];
	}

	if(![dictionary[kElectronicPreferencesModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = [dictionary[kElectronicPreferencesModelShop_id] integerValue];
	}

	if(![dictionary[kElectronicPreferencesModelShop_id_str] isKindOfClass:[NSNull class]]){
		self.shop_id_str = dictionary[kElectronicPreferencesModelShop_id_str];
	}	
	if(![dictionary[kElectronicPreferencesModelShop_id_str_name] isKindOfClass:[NSNull class]]){
		self.shop_id_str_name = dictionary[kElectronicPreferencesModelShop_id_str_name];
	}	
	if(![dictionary[kElectronicPreferencesModelSort] isKindOfClass:[NSNull class]]){
		self.sort = [dictionary[kElectronicPreferencesModelSort] integerValue];
	}

	if(![dictionary[kElectronicPreferencesModelStart_time] isKindOfClass:[NSNull class]]){
		self.start_time = dictionary[kElectronicPreferencesModelStart_time];
	}	
	if(![dictionary[kElectronicPreferencesModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kElectronicPreferencesModelStatus] integerValue];
	}

	if(![dictionary[kElectronicPreferencesModelType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kElectronicPreferencesModelType] integerValue];
	}

	if(![dictionary[kElectronicPreferencesModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kElectronicPreferencesModelUpdated_at];
	}	
	if(![dictionary[kElectronicPreferencesModelUse_num] isKindOfClass:[NSNull class]]){
		self.use_num = [dictionary[kElectronicPreferencesModelUse_num] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kElectronicPreferencesModelAdmin_id] = @(self.admin_id);
	if(self.created_at != nil){
		dictionary[kElectronicPreferencesModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kElectronicPreferencesModelDeleted_at] = self.deleted_at;
	}
	if(self.desc != nil){
		dictionary[kElectronicPreferencesModelDesc] = self.desc;
	}
	if(self.end_time != nil){
		dictionary[kElectronicPreferencesModelEnd_time] = self.end_time;
	}
	dictionary[kElectronicPreferencesModelIdField] = self.idField;
	if(self.money != nil){
		dictionary[kElectronicPreferencesModelMoney] = self.money;
	}
	if(self.name != nil){
		dictionary[kElectronicPreferencesModelName] = self.name;
	}
	dictionary[kElectronicPreferencesModelProvide_num] = @(self.provide_num);
	dictionary[kElectronicPreferencesModelProvide_type] = @(self.provide_type);
	dictionary[kElectronicPreferencesModelSent_num] = @(self.sent_num);
	dictionary[kElectronicPreferencesModelShop_id] = @(self.shop_id);
	if(self.shop_id_str != nil){
		dictionary[kElectronicPreferencesModelShop_id_str] = self.shop_id_str;
	}
	if(self.shop_id_str_name != nil){
		dictionary[kElectronicPreferencesModelShop_id_str_name] = self.shop_id_str_name;
	}
	dictionary[kElectronicPreferencesModelSort] = @(self.sort);
	if(self.start_time != nil){
		dictionary[kElectronicPreferencesModelStart_time] = self.start_time;
	}
	dictionary[kElectronicPreferencesModelStatus] = @(self.status);
	dictionary[kElectronicPreferencesModelType] = @(self.type);
	if(self.updated_at != nil){
		dictionary[kElectronicPreferencesModelUpdated_at] = self.updated_at;
	}
	dictionary[kElectronicPreferencesModelUse_num] = @(self.use_num);
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
	[aCoder encodeObject:@(self.admin_id) forKey:kElectronicPreferencesModelAdmin_id];	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kElectronicPreferencesModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kElectronicPreferencesModelDeleted_at];
	}
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:kElectronicPreferencesModelDesc];
	}
	if(self.end_time != nil){
		[aCoder encodeObject:self.end_time forKey:kElectronicPreferencesModelEnd_time];
	}
	[aCoder encodeObject:self.idField forKey:kElectronicPreferencesModelIdField];	if(self.money != nil){
		[aCoder encodeObject:self.money forKey:kElectronicPreferencesModelMoney];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kElectronicPreferencesModelName];
	}
	[aCoder encodeObject:@(self.provide_num) forKey:kElectronicPreferencesModelProvide_num];	[aCoder encodeObject:@(self.provide_type) forKey:kElectronicPreferencesModelProvide_type];	[aCoder encodeObject:@(self.sent_num) forKey:kElectronicPreferencesModelSent_num];	[aCoder encodeObject:@(self.shop_id) forKey:kElectronicPreferencesModelShop_id];	if(self.shop_id_str != nil){
		[aCoder encodeObject:self.shop_id_str forKey:kElectronicPreferencesModelShop_id_str];
	}
	if(self.shop_id_str_name != nil){
		[aCoder encodeObject:self.shop_id_str_name forKey:kElectronicPreferencesModelShop_id_str_name];
	}
	[aCoder encodeObject:@(self.sort) forKey:kElectronicPreferencesModelSort];	if(self.start_time != nil){
		[aCoder encodeObject:self.start_time forKey:kElectronicPreferencesModelStart_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kElectronicPreferencesModelStatus];	[aCoder encodeObject:@(self.type) forKey:kElectronicPreferencesModelType];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kElectronicPreferencesModelUpdated_at];
	}
	[aCoder encodeObject:@(self.use_num) forKey:kElectronicPreferencesModelUse_num];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.admin_id = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelAdmin_id] integerValue];
	self.created_at = [aDecoder decodeObjectForKey:kElectronicPreferencesModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kElectronicPreferencesModelDeleted_at];
	self.desc = [aDecoder decodeObjectForKey:kElectronicPreferencesModelDesc];
	self.end_time = [aDecoder decodeObjectForKey:kElectronicPreferencesModelEnd_time];
	self.idField = [aDecoder decodeObjectForKey:kElectronicPreferencesModelIdField];
	self.money = [aDecoder decodeObjectForKey:kElectronicPreferencesModelMoney];
	self.name = [aDecoder decodeObjectForKey:kElectronicPreferencesModelName];
	self.provide_num = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelProvide_num] integerValue];
	self.provide_type = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelProvide_type] integerValue];
	self.sent_num = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelSent_num] integerValue];
	self.shop_id = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelShop_id] integerValue];
	self.shop_id_str = [aDecoder decodeObjectForKey:kElectronicPreferencesModelShop_id_str];
	self.shop_id_str_name = [aDecoder decodeObjectForKey:kElectronicPreferencesModelShop_id_str_name];
	self.sort = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelSort] integerValue];
	self.start_time = [aDecoder decodeObjectForKey:kElectronicPreferencesModelStart_time];
	self.status = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelStatus] integerValue];
	self.type = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelType] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kElectronicPreferencesModelUpdated_at];
	self.use_num = [[aDecoder decodeObjectForKey:kElectronicPreferencesModelUse_num] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	ElectronicPreferencesModel *copy = [ElectronicPreferencesModel new];

	copy.admin_id = self.admin_id;
	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.desc = [self.desc copy];
	copy.end_time = [self.end_time copy];
	copy.idField = self.idField;
	copy.money = [self.money copy];
	copy.name = [self.name copy];
	copy.provide_num = self.provide_num;
	copy.provide_type = self.provide_type;
	copy.sent_num = self.sent_num;
	copy.shop_id = self.shop_id;
	copy.shop_id_str = [self.shop_id_str copy];
	copy.shop_id_str_name = [self.shop_id_str_name copy];
	copy.sort = self.sort;
	copy.start_time = [self.start_time copy];
	copy.status = self.status;
	copy.type = self.type;
	copy.updated_at = [self.updated_at copy];
	copy.use_num = self.use_num;

	return copy;
}
@end
