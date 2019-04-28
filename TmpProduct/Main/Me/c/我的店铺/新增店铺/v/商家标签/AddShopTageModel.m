//
//	AddShopTageModel.m

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.




#import "AddShopTageModel.h"

NSString *const kAddShopTageModelCreated_at = @"created_at";
NSString *const kAddShopTageModelDesc = @"desc";
NSString *const kAddShopTageModelIdField = @"id";
NSString *const kAddShopTageModelLabel_color = @"label_color";
NSString *const kAddShopTageModelLabel_name = @"label_name";
NSString *const kAddShopTageModelType = @"type";

@interface AddShopTageModel ()
@end
@implementation AddShopTageModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAddShopTageModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kAddShopTageModelCreated_at];
	}	
	if(![dictionary[kAddShopTageModelDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kAddShopTageModelDesc];
	}	
	if(![dictionary[kAddShopTageModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kAddShopTageModelIdField];
	}	
	if(![dictionary[kAddShopTageModelLabel_color] isKindOfClass:[NSNull class]]){
		self.label_color = dictionary[kAddShopTageModelLabel_color];
	}	
	if(![dictionary[kAddShopTageModelLabel_name] isKindOfClass:[NSNull class]]){
		self.label_name = dictionary[kAddShopTageModelLabel_name];
	}	
	if(![dictionary[kAddShopTageModelType] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[kAddShopTageModelType] integerValue];
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
		dictionary[kAddShopTageModelCreated_at] = self.created_at;
	}
	if(self.desc != nil){
		dictionary[kAddShopTageModelDesc] = self.desc;
	}
	if(self.idField != nil){
		dictionary[kAddShopTageModelIdField] = self.idField;
	}
	if(self.label_color != nil){
		dictionary[kAddShopTageModelLabel_color] = self.label_color;
	}
	if(self.label_name != nil){
		dictionary[kAddShopTageModelLabel_name] = self.label_name;
	}
	dictionary[kAddShopTageModelType] = @(self.type);
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
		[aCoder encodeObject:self.created_at forKey:kAddShopTageModelCreated_at];
	}
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:kAddShopTageModelDesc];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kAddShopTageModelIdField];
	}
	if(self.label_color != nil){
		[aCoder encodeObject:self.label_color forKey:kAddShopTageModelLabel_color];
	}
	if(self.label_name != nil){
		[aCoder encodeObject:self.label_name forKey:kAddShopTageModelLabel_name];
	}
	[aCoder encodeObject:@(self.type) forKey:kAddShopTageModelType];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.created_at = [aDecoder decodeObjectForKey:kAddShopTageModelCreated_at];
	self.desc = [aDecoder decodeObjectForKey:kAddShopTageModelDesc];
	self.idField = [aDecoder decodeObjectForKey:kAddShopTageModelIdField];
	self.label_color = [aDecoder decodeObjectForKey:kAddShopTageModelLabel_color];
	self.label_name = [aDecoder decodeObjectForKey:kAddShopTageModelLabel_name];
	self.type = [[aDecoder decodeObjectForKey:kAddShopTageModelType] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AddShopTageModel *copy = [AddShopTageModel new];

	copy.created_at = [self.created_at copy];
	copy.desc = [self.desc copy];
	copy.idField = [self.idField copy];
	copy.label_color = [self.label_color copy];
	copy.label_name = [self.label_name copy];
	copy.type = self.type;

	return copy;
}
@end