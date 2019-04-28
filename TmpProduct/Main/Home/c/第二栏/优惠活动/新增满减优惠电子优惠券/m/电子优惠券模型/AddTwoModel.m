//
//	AddTwoModel.m

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.




#import "AddTwoModel.h"

NSString *const kAddTwoModelDesc = @"desc";
NSString *const kAddTwoModelEnd_time = @"end_time";
NSString *const kAddTwoModelMoney = @"money";
NSString *const kAddTwoModelName = @"name";
NSString *const kAddTwoModelProvide_num = @"provide_num";
NSString *const kAddTwoModelProvide_type = @"provide_type";
NSString *const kAddTwoModelShop_id = @"shop_id";
NSString *const kAddTwoModelShop_id_str = @"shop_id_str";
NSString *const kAddTwoModelShop_id_str_name = @"shop_id_str_name";
NSString *const kAddTwoModelStart_time = @"start_time";
NSString *const kAddTwoModelStatus = @"status";
NSString *const kAddTwoModelType = @"type";

@interface AddTwoModel ()
@end
@implementation AddTwoModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAddTwoModelDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kAddTwoModelDesc];
	}	
	if(![dictionary[kAddTwoModelEnd_time] isKindOfClass:[NSNull class]]){
		self.end_time = dictionary[kAddTwoModelEnd_time];
	}	
	if(![dictionary[kAddTwoModelMoney] isKindOfClass:[NSNull class]]){
		self.money = dictionary[kAddTwoModelMoney];
	}	
	if(![dictionary[kAddTwoModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kAddTwoModelName];
	}	
	if(![dictionary[kAddTwoModelProvide_num] isKindOfClass:[NSNull class]]){
		self.provide_num = dictionary[kAddTwoModelProvide_num];
	}	
	if(![dictionary[kAddTwoModelProvide_type] isKindOfClass:[NSNull class]]){
		self.provide_type = [dictionary[kAddTwoModelProvide_type] integerValue];
	}

	if(![dictionary[kAddTwoModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = dictionary[kAddTwoModelShop_id];
	}	
	if(![dictionary[kAddTwoModelShop_id_str] isKindOfClass:[NSNull class]]){
		self.shop_id_str = dictionary[kAddTwoModelShop_id_str];
	}
    if(![dictionary[kAddTwoModelShop_id_str_name] isKindOfClass:[NSNull class]]){
        self.shop_id_str_name = dictionary[kAddTwoModelShop_id_str_name];
    }
    
	if(![dictionary[kAddTwoModelStart_time] isKindOfClass:[NSNull class]]){
		self.start_time = dictionary[kAddTwoModelStart_time];
	}	
	if(![dictionary[kAddTwoModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kAddTwoModelStatus] integerValue];
	}

	if(![dictionary[kAddTwoModelType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kAddTwoModelType] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.desc != nil){
		dictionary[kAddTwoModelDesc] = self.desc;
	}
	if(self.end_time != nil){
		dictionary[kAddTwoModelEnd_time] = self.end_time;
	}
	if(self.money != nil){
		dictionary[kAddTwoModelMoney] = self.money;
	}
	if(self.name != nil){
		dictionary[kAddTwoModelName] = self.name;
	}
	if(self.provide_num != nil){
		dictionary[kAddTwoModelProvide_num] = self.provide_num;
	}
	dictionary[kAddTwoModelProvide_type] = @(self.provide_type);
	if(self.shop_id != nil){
		dictionary[kAddTwoModelShop_id] = self.shop_id;
	}
	if(self.shop_id_str != nil){
		dictionary[kAddTwoModelShop_id_str] = self.shop_id_str;
	}
    if(self.shop_id_str_name != nil){
        dictionary[kAddTwoModelShop_id_str_name] = self.shop_id_str_name;
    }
    
	if(self.start_time != nil){
		dictionary[kAddTwoModelStart_time] = self.start_time;
	}
	dictionary[kAddTwoModelStatus] = @(self.status);
	dictionary[kAddTwoModelType] = @(self.type);
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
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:kAddTwoModelDesc];
	}
	if(self.end_time != nil){
		[aCoder encodeObject:self.end_time forKey:kAddTwoModelEnd_time];
	}
	if(self.money != nil){
		[aCoder encodeObject:self.money forKey:kAddTwoModelMoney];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kAddTwoModelName];
	}
	if(self.provide_num != nil){
		[aCoder encodeObject:self.provide_num forKey:kAddTwoModelProvide_num];
	}
	[aCoder encodeObject:@(self.provide_type) forKey:kAddTwoModelProvide_type];	if(self.shop_id != nil){
		[aCoder encodeObject:self.shop_id forKey:kAddTwoModelShop_id];
	}
	if(self.shop_id_str != nil){
		[aCoder encodeObject:self.shop_id_str forKey:kAddTwoModelShop_id_str];
	}
    if(self.shop_id_str_name != nil){
        [aCoder encodeObject:self.shop_id_str_name forKey:kAddTwoModelShop_id_str_name];
    }
    
	if(self.start_time != nil){
		[aCoder encodeObject:self.start_time forKey:kAddTwoModelStart_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kAddTwoModelStatus];	[aCoder encodeObject:@(self.type) forKey:kAddTwoModelType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.desc = [aDecoder decodeObjectForKey:kAddTwoModelDesc];
	self.end_time = [aDecoder decodeObjectForKey:kAddTwoModelEnd_time];
	self.money = [aDecoder decodeObjectForKey:kAddTwoModelMoney];
	self.name = [aDecoder decodeObjectForKey:kAddTwoModelName];
	self.provide_num = [aDecoder decodeObjectForKey:kAddTwoModelProvide_num];
	self.provide_type = [[aDecoder decodeObjectForKey:kAddTwoModelProvide_type] integerValue];
	self.shop_id = [aDecoder decodeObjectForKey:kAddTwoModelShop_id];
	self.shop_id_str = [aDecoder decodeObjectForKey:kAddTwoModelShop_id_str];
    self.shop_id_str_name = [aDecoder decodeObjectForKey:kAddTwoModelShop_id_str_name];
	self.start_time = [aDecoder decodeObjectForKey:kAddTwoModelStart_time];
	self.status = [[aDecoder decodeObjectForKey:kAddTwoModelStatus] integerValue];
	self.type = [[aDecoder decodeObjectForKey:kAddTwoModelType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AddTwoModel *copy = [AddTwoModel new];

	copy.desc = [self.desc copy];
	copy.end_time = [self.end_time copy];
	copy.money = [self.money copy];
	copy.name = [self.name copy];
	copy.provide_num = [self.provide_num copy];
	copy.provide_type = self.provide_type;
	copy.shop_id = [self.shop_id copy];
	copy.shop_id_str = [self.shop_id_str copy];
    copy.shop_id_str_name = [self.shop_id_str_name copy];
	copy.start_time = [self.start_time copy];
	copy.status = self.status;
	copy.type = self.type;

	return copy;
}
@end
