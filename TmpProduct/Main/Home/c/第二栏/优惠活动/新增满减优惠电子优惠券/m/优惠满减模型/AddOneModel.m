//
//	AddOneModel.m

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.




#import "AddOneModel.h"

NSString *const kAddOneModelAmount = @"amount";
NSString *const kAddOneModelDesc = @"desc";
NSString *const kAddOneModelDiscount = @"discount";
NSString *const kAddOneModelEnd_time = @"end_time";
NSString *const kAddOneModelName = @"name";
NSString *const kAddOneModelShop_id = @"shop_id";
NSString *const kAddOneModelStart_time = @"start_time";
NSString *const kAddOneModelStatus = @"status";
NSString *const kAddOneModelType = @"type";

@interface AddOneModel ()
@end
@implementation AddOneModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAddOneModelAmount] isKindOfClass:[NSNull class]]){
		self.amount = dictionary[kAddOneModelAmount];
	}	
	if(![dictionary[kAddOneModelDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kAddOneModelDesc];
	}	
	if(![dictionary[kAddOneModelDiscount] isKindOfClass:[NSNull class]]){
		self.discount = dictionary[kAddOneModelDiscount];
	}	
	if(![dictionary[kAddOneModelEnd_time] isKindOfClass:[NSNull class]]){
		self.end_time = dictionary[kAddOneModelEnd_time];
	}	
	if(![dictionary[kAddOneModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kAddOneModelName];
	}	
	if(![dictionary[kAddOneModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = dictionary[kAddOneModelShop_id];
	}	
	if(![dictionary[kAddOneModelStart_time] isKindOfClass:[NSNull class]]){
		self.start_time = dictionary[kAddOneModelStart_time];
	}	
	if(![dictionary[kAddOneModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kAddOneModelStatus] integerValue];
	}

	if(![dictionary[kAddOneModelType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kAddOneModelType] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.amount != nil){
		dictionary[kAddOneModelAmount] = self.amount;
	}
	if(self.desc != nil){
		dictionary[kAddOneModelDesc] = self.desc;
	}
	if(self.discount != nil){
		dictionary[kAddOneModelDiscount] = self.discount;
	}
	if(self.end_time != nil){
		dictionary[kAddOneModelEnd_time] = self.end_time;
	}
	if(self.name != nil){
		dictionary[kAddOneModelName] = self.name;
	}
	if(self.shop_id != nil){
		dictionary[kAddOneModelShop_id] = self.shop_id;
	}
	if(self.start_time != nil){
		dictionary[kAddOneModelStart_time] = self.start_time;
	}
	dictionary[kAddOneModelStatus] = @(self.status);
	dictionary[kAddOneModelType] = @(self.type);
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
	if(self.amount != nil){
		[aCoder encodeObject:self.amount forKey:kAddOneModelAmount];
	}
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:kAddOneModelDesc];
	}
	if(self.discount != nil){
		[aCoder encodeObject:self.discount forKey:kAddOneModelDiscount];
	}
	if(self.end_time != nil){
		[aCoder encodeObject:self.end_time forKey:kAddOneModelEnd_time];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kAddOneModelName];
	}
	if(self.shop_id != nil){
		[aCoder encodeObject:self.shop_id forKey:kAddOneModelShop_id];
	}
	if(self.start_time != nil){
		[aCoder encodeObject:self.start_time forKey:kAddOneModelStart_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kAddOneModelStatus];	[aCoder encodeObject:@(self.type) forKey:kAddOneModelType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.amount = [aDecoder decodeObjectForKey:kAddOneModelAmount];
	self.desc = [aDecoder decodeObjectForKey:kAddOneModelDesc];
	self.discount = [aDecoder decodeObjectForKey:kAddOneModelDiscount];
	self.end_time = [aDecoder decodeObjectForKey:kAddOneModelEnd_time];
	self.name = [aDecoder decodeObjectForKey:kAddOneModelName];
	self.shop_id = [aDecoder decodeObjectForKey:kAddOneModelShop_id];
	self.start_time = [aDecoder decodeObjectForKey:kAddOneModelStart_time];
	self.status = [[aDecoder decodeObjectForKey:kAddOneModelStatus] integerValue];
	self.type = [[aDecoder decodeObjectForKey:kAddOneModelType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AddOneModel *copy = [AddOneModel new];

	copy.amount = [self.amount copy];
	copy.desc = [self.desc copy];
	copy.discount = [self.discount copy];
	copy.end_time = [self.end_time copy];
	copy.name = [self.name copy];
	copy.shop_id = [self.shop_id copy];
	copy.start_time = [self.start_time copy];
	copy.status = self.status;
	copy.type = self.type;

	return copy;
}
@end