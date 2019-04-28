//
//	UserInfoAndShopUser.m

//  创建于 15/4/2019
//	Copyright © 2019. All rights reserved.




#import "UserInfoAndShopUser.h"

NSString *const kUserInfoAndShopUserCreated_at = @"created_at";
NSString *const kUserInfoAndShopUserDeleted_at = @"deleted_at";
NSString *const kUserInfoAndShopUserHead_pic = @"head_pic";
NSString *const kUserInfoAndShopUserIdField = @"id";
NSString *const kUserInfoAndShopUserInshop = @"inshop";
NSString *const kUserInfoAndShopUserIs_merchant = @"is_merchant";
NSString *const kUserInfoAndShopUserLastlogin_at = @"lastlogin_at";
NSString *const kUserInfoAndShopUserMerchant_id = @"merchant_id";
NSString *const kUserInfoAndShopUserMobile = @"mobile";
NSString *const kUserInfoAndShopUserName = @"name";
NSString *const kUserInfoAndShopUserStatus = @"status";
NSString *const kUserInfoAndShopUserUpdated_at = @"updated_at";

@interface UserInfoAndShopUser ()
@end
@implementation UserInfoAndShopUser




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUserInfoAndShopUserCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kUserInfoAndShopUserCreated_at];
	}	
	if(![dictionary[kUserInfoAndShopUserDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kUserInfoAndShopUserDeleted_at];
	}	
	if(![dictionary[kUserInfoAndShopUserHead_pic] isKindOfClass:[NSNull class]]){
		self.head_pic = dictionary[kUserInfoAndShopUserHead_pic];
	}	
	if(![dictionary[kUserInfoAndShopUserIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kUserInfoAndShopUserIdField];
	}	
	if(![dictionary[kUserInfoAndShopUserInshop] isKindOfClass:[NSNull class]]){
		self.inshop = [dictionary[kUserInfoAndShopUserInshop] integerValue];
	}

	if(![dictionary[kUserInfoAndShopUserIs_merchant] isKindOfClass:[NSNull class]]){
		self.is_merchant = [dictionary[kUserInfoAndShopUserIs_merchant] integerValue];
	}

	if(![dictionary[kUserInfoAndShopUserLastlogin_at] isKindOfClass:[NSNull class]]){
		self.lastlogin_at = dictionary[kUserInfoAndShopUserLastlogin_at];
	}	
	if(![dictionary[kUserInfoAndShopUserMerchant_id] isKindOfClass:[NSNull class]]){
		self.merchant_id = [dictionary[kUserInfoAndShopUserMerchant_id] integerValue];
	}

	if(![dictionary[kUserInfoAndShopUserMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kUserInfoAndShopUserMobile];
	}	
	if(![dictionary[kUserInfoAndShopUserName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kUserInfoAndShopUserName];
	}	
	if(![dictionary[kUserInfoAndShopUserStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kUserInfoAndShopUserStatus] integerValue];
	}

	if(![dictionary[kUserInfoAndShopUserUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kUserInfoAndShopUserUpdated_at];
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
		dictionary[kUserInfoAndShopUserCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kUserInfoAndShopUserDeleted_at] = self.deleted_at;
	}
	if(self.head_pic != nil){
		dictionary[kUserInfoAndShopUserHead_pic] = self.head_pic;
	}
	if(self.idField != nil){
		dictionary[kUserInfoAndShopUserIdField] = self.idField;
	}
	dictionary[kUserInfoAndShopUserInshop] = @(self.inshop);
	dictionary[kUserInfoAndShopUserIs_merchant] = @(self.is_merchant);
	if(self.lastlogin_at != nil){
		dictionary[kUserInfoAndShopUserLastlogin_at] = self.lastlogin_at;
	}
	dictionary[kUserInfoAndShopUserMerchant_id] = @(self.merchant_id);
	if(self.mobile != nil){
		dictionary[kUserInfoAndShopUserMobile] = self.mobile;
	}
	if(self.name != nil){
		dictionary[kUserInfoAndShopUserName] = self.name;
	}
	dictionary[kUserInfoAndShopUserStatus] = @(self.status);
	if(self.updated_at != nil){
		dictionary[kUserInfoAndShopUserUpdated_at] = self.updated_at;
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
		[aCoder encodeObject:self.created_at forKey:kUserInfoAndShopUserCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kUserInfoAndShopUserDeleted_at];
	}
	if(self.head_pic != nil){
		[aCoder encodeObject:self.head_pic forKey:kUserInfoAndShopUserHead_pic];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kUserInfoAndShopUserIdField];
	}
	[aCoder encodeObject:@(self.inshop) forKey:kUserInfoAndShopUserInshop];	[aCoder encodeObject:@(self.is_merchant) forKey:kUserInfoAndShopUserIs_merchant];	if(self.lastlogin_at != nil){
		[aCoder encodeObject:self.lastlogin_at forKey:kUserInfoAndShopUserLastlogin_at];
	}
	[aCoder encodeObject:@(self.merchant_id) forKey:kUserInfoAndShopUserMerchant_id];	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kUserInfoAndShopUserMobile];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kUserInfoAndShopUserName];
	}
	[aCoder encodeObject:@(self.status) forKey:kUserInfoAndShopUserStatus];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kUserInfoAndShopUserUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.created_at = [aDecoder decodeObjectForKey:kUserInfoAndShopUserCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kUserInfoAndShopUserDeleted_at];
	self.head_pic = [aDecoder decodeObjectForKey:kUserInfoAndShopUserHead_pic];
	self.idField = [aDecoder decodeObjectForKey:kUserInfoAndShopUserIdField];
	self.inshop = [[aDecoder decodeObjectForKey:kUserInfoAndShopUserInshop] integerValue];
	self.is_merchant = [[aDecoder decodeObjectForKey:kUserInfoAndShopUserIs_merchant] integerValue];
	self.lastlogin_at = [aDecoder decodeObjectForKey:kUserInfoAndShopUserLastlogin_at];
	self.merchant_id = [[aDecoder decodeObjectForKey:kUserInfoAndShopUserMerchant_id] integerValue];
	self.mobile = [aDecoder decodeObjectForKey:kUserInfoAndShopUserMobile];
	self.name = [aDecoder decodeObjectForKey:kUserInfoAndShopUserName];
	self.status = [[aDecoder decodeObjectForKey:kUserInfoAndShopUserStatus] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kUserInfoAndShopUserUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UserInfoAndShopUser *copy = [UserInfoAndShopUser new];

	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.head_pic = [self.head_pic copy];
	copy.idField = [self.idField copy];
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