//
//	MyStaffModel.m

//  创建于 16/4/2019
//	Copyright © 2019. All rights reserved.




#import "MyStaffModel.h"

NSString *const kMyStaffModelCreated_at = @"created_at";
NSString *const kMyStaffModelDeleted_at = @"deleted_at";
NSString *const kMyStaffModelHead_pic = @"head_pic";
NSString *const kMyStaffModelIdField = @"id";
NSString *const kMyStaffModelInshop = @"inshop";
NSString *const kMyStaffModelIs_merchant = @"is_merchant";
NSString *const kMyStaffModelLastlogin_at = @"lastlogin_at";
NSString *const kMyStaffModelMerchant_id = @"merchant_id";
NSString *const kMyStaffModelMobile = @"mobile";
NSString *const kMyStaffModelName = @"name";
NSString *const kMyStaffModelStatus = @"status";
NSString *const kMyStaffModelUpdated_at = @"updated_at";

@interface MyStaffModel ()
@end
@implementation MyStaffModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyStaffModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kMyStaffModelCreated_at];
	}	
	if(![dictionary[kMyStaffModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kMyStaffModelDeleted_at];
	}	
	if(![dictionary[kMyStaffModelHead_pic] isKindOfClass:[NSNull class]]){
		self.head_pic = dictionary[kMyStaffModelHead_pic];
	}	
	if(![dictionary[kMyStaffModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kMyStaffModelIdField] integerValue];
	}

	if(![dictionary[kMyStaffModelInshop] isKindOfClass:[NSNull class]]){
		self.inshop = [dictionary[kMyStaffModelInshop] integerValue];
	}

	if(![dictionary[kMyStaffModelIs_merchant] isKindOfClass:[NSNull class]]){
		self.is_merchant = [dictionary[kMyStaffModelIs_merchant] integerValue];
	}

	if(![dictionary[kMyStaffModelLastlogin_at] isKindOfClass:[NSNull class]]){
		self.lastlogin_at = dictionary[kMyStaffModelLastlogin_at];
	}	
	if(![dictionary[kMyStaffModelMerchant_id] isKindOfClass:[NSNull class]]){
		self.merchant_id = [dictionary[kMyStaffModelMerchant_id] integerValue];
	}

	if(![dictionary[kMyStaffModelMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kMyStaffModelMobile];
	}	
	if(![dictionary[kMyStaffModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kMyStaffModelName];
	}	
	if(![dictionary[kMyStaffModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kMyStaffModelStatus] integerValue];
	}

	if(![dictionary[kMyStaffModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kMyStaffModelUpdated_at];
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
		dictionary[kMyStaffModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kMyStaffModelDeleted_at] = self.deleted_at;
	}
	if(self.head_pic != nil){
		dictionary[kMyStaffModelHead_pic] = self.head_pic;
	}
	dictionary[kMyStaffModelIdField] = @(self.idField);
	dictionary[kMyStaffModelInshop] = @(self.inshop);
	dictionary[kMyStaffModelIs_merchant] = @(self.is_merchant);
	if(self.lastlogin_at != nil){
		dictionary[kMyStaffModelLastlogin_at] = self.lastlogin_at;
	}
	dictionary[kMyStaffModelMerchant_id] = @(self.merchant_id);
	if(self.mobile != nil){
		dictionary[kMyStaffModelMobile] = self.mobile;
	}
	if(self.name != nil){
		dictionary[kMyStaffModelName] = self.name;
	}
	dictionary[kMyStaffModelStatus] = @(self.status);
	if(self.updated_at != nil){
		dictionary[kMyStaffModelUpdated_at] = self.updated_at;
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
		[aCoder encodeObject:self.created_at forKey:kMyStaffModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kMyStaffModelDeleted_at];
	}
	if(self.head_pic != nil){
		[aCoder encodeObject:self.head_pic forKey:kMyStaffModelHead_pic];
	}
	[aCoder encodeObject:@(self.idField) forKey:kMyStaffModelIdField];	[aCoder encodeObject:@(self.inshop) forKey:kMyStaffModelInshop];	[aCoder encodeObject:@(self.is_merchant) forKey:kMyStaffModelIs_merchant];	if(self.lastlogin_at != nil){
		[aCoder encodeObject:self.lastlogin_at forKey:kMyStaffModelLastlogin_at];
	}
	[aCoder encodeObject:@(self.merchant_id) forKey:kMyStaffModelMerchant_id];	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kMyStaffModelMobile];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kMyStaffModelName];
	}
	[aCoder encodeObject:@(self.status) forKey:kMyStaffModelStatus];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kMyStaffModelUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.created_at = [aDecoder decodeObjectForKey:kMyStaffModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kMyStaffModelDeleted_at];
	self.head_pic = [aDecoder decodeObjectForKey:kMyStaffModelHead_pic];
	self.idField = [[aDecoder decodeObjectForKey:kMyStaffModelIdField] integerValue];
	self.inshop = [[aDecoder decodeObjectForKey:kMyStaffModelInshop] integerValue];
	self.is_merchant = [[aDecoder decodeObjectForKey:kMyStaffModelIs_merchant] integerValue];
	self.lastlogin_at = [aDecoder decodeObjectForKey:kMyStaffModelLastlogin_at];
	self.merchant_id = [[aDecoder decodeObjectForKey:kMyStaffModelMerchant_id] integerValue];
	self.mobile = [aDecoder decodeObjectForKey:kMyStaffModelMobile];
	self.name = [aDecoder decodeObjectForKey:kMyStaffModelName];
	self.status = [[aDecoder decodeObjectForKey:kMyStaffModelStatus] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kMyStaffModelUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyStaffModel *copy = [MyStaffModel new];

	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.head_pic = [self.head_pic copy];
	copy.idField = self.idField;
	copy.inshop = self.inshop;
	copy.is_merchant = self.is_merchant;
	copy.lastlogin_at = [self.lastlogin_at copy];
	copy.merchant_id = self.merchant_id;
	copy.mobile = [self.mobile copy];
	copy.name = [self.name copy];
	copy.status = self.status;
	copy.updated_at = [self.updated_at copy];

	return copy;
}
@end