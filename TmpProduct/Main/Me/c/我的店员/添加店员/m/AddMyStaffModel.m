//
//	AddMyStaffModel.m

//  创建于 22/4/2019
//	Copyright © 2019. All rights reserved.




#import "AddMyStaffModel.h"

NSString *const kAddMyStaffModelHead_pic = @"head_pic";
NSString *const kAddMyStaffModelMerchant_id = @"merchant_id";
NSString *const kAddMyStaffModelMobile = @"mobile";
NSString *const kAddMyStaffModelName = @"name";
NSString *const kAddMyStaffModelPassword = @"password";
NSString *const kAddMyStaffModelShop_id = @"shop_id";
NSString *const kAddMyStaffModelStatus = @"status";

@interface AddMyStaffModel ()
@end
@implementation AddMyStaffModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAddMyStaffModelHead_pic] isKindOfClass:[NSNull class]]){
		self.head_pic = dictionary[kAddMyStaffModelHead_pic];
	}	
	if(![dictionary[kAddMyStaffModelMerchant_id] isKindOfClass:[NSNull class]]){
		self.merchant_id = [dictionary[kAddMyStaffModelMerchant_id] integerValue];
	}

	if(![dictionary[kAddMyStaffModelMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kAddMyStaffModelMobile];
	}	
	if(![dictionary[kAddMyStaffModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kAddMyStaffModelName];
	}	
	if(![dictionary[kAddMyStaffModelPassword] isKindOfClass:[NSNull class]]){
		self.password = dictionary[kAddMyStaffModelPassword];
	}	
	if(![dictionary[kAddMyStaffModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = dictionary[kAddMyStaffModelShop_id];
	}	
	if(![dictionary[kAddMyStaffModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kAddMyStaffModelStatus] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.head_pic != nil){
		dictionary[kAddMyStaffModelHead_pic] = self.head_pic;
	}
	dictionary[kAddMyStaffModelMerchant_id] = @(self.merchant_id);
	if(self.mobile != nil){
		dictionary[kAddMyStaffModelMobile] = self.mobile;
	}
	if(self.name != nil){
		dictionary[kAddMyStaffModelName] = self.name;
	}
	if(self.password != nil){
		dictionary[kAddMyStaffModelPassword] = self.password;
	}
	if(self.shop_id != nil){
		dictionary[kAddMyStaffModelShop_id] = self.shop_id;
	}
	dictionary[kAddMyStaffModelStatus] = @(self.status);
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
	if(self.head_pic != nil){
		[aCoder encodeObject:self.head_pic forKey:kAddMyStaffModelHead_pic];
	}
	[aCoder encodeObject:@(self.merchant_id) forKey:kAddMyStaffModelMerchant_id];	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kAddMyStaffModelMobile];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kAddMyStaffModelName];
	}
	if(self.password != nil){
		[aCoder encodeObject:self.password forKey:kAddMyStaffModelPassword];
	}
	if(self.shop_id != nil){
		[aCoder encodeObject:self.shop_id forKey:kAddMyStaffModelShop_id];
	}
	[aCoder encodeObject:@(self.status) forKey:kAddMyStaffModelStatus];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.head_pic = [aDecoder decodeObjectForKey:kAddMyStaffModelHead_pic];
	self.merchant_id = [[aDecoder decodeObjectForKey:kAddMyStaffModelMerchant_id] integerValue];
	self.mobile = [aDecoder decodeObjectForKey:kAddMyStaffModelMobile];
	self.name = [aDecoder decodeObjectForKey:kAddMyStaffModelName];
	self.password = [aDecoder decodeObjectForKey:kAddMyStaffModelPassword];
	self.shop_id = [aDecoder decodeObjectForKey:kAddMyStaffModelShop_id];
	self.status = [[aDecoder decodeObjectForKey:kAddMyStaffModelStatus] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AddMyStaffModel *copy = [AddMyStaffModel new];

	copy.head_pic = [self.head_pic copy];
	copy.merchant_id = self.merchant_id;
	copy.mobile = [self.mobile copy];
	copy.name = [self.name copy];
	copy.password = [self.password copy];
	copy.shop_id = [self.shop_id copy];
	copy.status = self.status;

	return copy;
}
@end