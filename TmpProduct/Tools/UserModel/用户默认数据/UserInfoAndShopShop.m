//
//	UserInfoAndShopShop.m

//  创建于 15/4/2019
//	Copyright © 2019. All rights reserved.




#import "UserInfoAndShopShop.h"

NSString *const kUserInfoAndShopShopAddress = @"address";
NSString *const kUserInfoAndShopShopArea = @"area";
NSString *const kUserInfoAndShopShopArea_name = @"area_name";
NSString *const kUserInfoAndShopShopBusiness_tag = @"business_tag";
NSString *const kUserInfoAndShopShopBusiness_tag_name = @"business_tag_name";
NSString *const kUserInfoAndShopShopBusiness_xkzz = @"business_xkzz";
NSString *const kUserInfoAndShopShopCate_id = @"cate_id";
NSString *const kUserInfoAndShopShopCate_id_name = @"cate_id_name";
NSString *const kUserInfoAndShopShopCity = @"city";
NSString *const kUserInfoAndShopShopCity_name = @"city_name";
NSString *const kUserInfoAndShopShopCreated_at = @"created_at";
NSString *const kUserInfoAndShopShopDeleted_at = @"deleted_at";
NSString *const kUserInfoAndShopShopDescriptionField = @"description";
NSString *const kUserInfoAndShopShopEarnings = @"earnings";
NSString *const kUserInfoAndShopShopEnd_time = @"end_time";
NSString *const kUserInfoAndShopShopIdField = @"id";
NSString *const kUserInfoAndShopShopLatitude = @"latitude";
NSString *const kUserInfoAndShopShopLongitude = @"longitude";
NSString *const kUserInfoAndShopShopMerchant_id = @"merchant_id";
NSString *const kUserInfoAndShopShopProvince = @"province";
NSString *const kUserInfoAndShopShopProvince_name = @"province_name";
NSString *const kUserInfoAndShopShopService_hotline = @"service_hotline";
NSString *const kUserInfoAndShopShopShop_img = @"shop_img";
NSString *const kUserInfoAndShopShopShop_name = @"shop_name";
NSString *const kUserInfoAndShopShopShop_ratings = @"shop_ratings";
NSString *const kUserInfoAndShopShopStart_time = @"start_time";
NSString *const kUserInfoAndShopShopStatus = @"status";
NSString *const kUserInfoAndShopShopUpdated_at = @"updated_at";

@interface UserInfoAndShopShop ()
@end
@implementation UserInfoAndShopShop




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    if (!dictionary.count) {
        return self;
    }
	if(![dictionary[kUserInfoAndShopShopAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kUserInfoAndShopShopAddress];
	}	
	if(![dictionary[kUserInfoAndShopShopArea] isKindOfClass:[NSNull class]]){
		self.area = [dictionary[kUserInfoAndShopShopArea] integerValue];
	}

	if(![dictionary[kUserInfoAndShopShopArea_name] isKindOfClass:[NSNull class]]){
		self.area_name = dictionary[kUserInfoAndShopShopArea_name];
	}	
	if(![dictionary[kUserInfoAndShopShopBusiness_tag] isKindOfClass:[NSNull class]]){
		self.business_tag = dictionary[kUserInfoAndShopShopBusiness_tag];
	}	
	if(![dictionary[kUserInfoAndShopShopBusiness_tag_name] isKindOfClass:[NSNull class]]){
		self.business_tag_name = dictionary[kUserInfoAndShopShopBusiness_tag_name];
	}	
	if(![dictionary[kUserInfoAndShopShopBusiness_xkzz] isKindOfClass:[NSNull class]]){
		self.business_xkzz = dictionary[kUserInfoAndShopShopBusiness_xkzz];
	}	
	if(![dictionary[kUserInfoAndShopShopCate_id] isKindOfClass:[NSNull class]]){
		self.cate_id = [dictionary[kUserInfoAndShopShopCate_id] integerValue];
	}

	if(![dictionary[kUserInfoAndShopShopCate_id_name] isKindOfClass:[NSNull class]]){
		self.cate_id_name = dictionary[kUserInfoAndShopShopCate_id_name];
	}	
	if(![dictionary[kUserInfoAndShopShopCity] isKindOfClass:[NSNull class]]){
		self.city = [dictionary[kUserInfoAndShopShopCity] integerValue];
	}

	if(![dictionary[kUserInfoAndShopShopCity_name] isKindOfClass:[NSNull class]]){
		self.city_name = dictionary[kUserInfoAndShopShopCity_name];
	}	
	if(![dictionary[kUserInfoAndShopShopCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kUserInfoAndShopShopCreated_at];
	}	
	if(![dictionary[kUserInfoAndShopShopDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kUserInfoAndShopShopDeleted_at];
	}	
	if(![dictionary[kUserInfoAndShopShopDescriptionField] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[kUserInfoAndShopShopDescriptionField];
	}	
	if(![dictionary[kUserInfoAndShopShopEarnings] isKindOfClass:[NSNull class]]){
		self.earnings = dictionary[kUserInfoAndShopShopEarnings];
	}	
	if(![dictionary[kUserInfoAndShopShopEnd_time] isKindOfClass:[NSNull class]]){
		self.end_time = dictionary[kUserInfoAndShopShopEnd_time];
	}	
	if(![dictionary[kUserInfoAndShopShopIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kUserInfoAndShopShopIdField];
	}	
	if(![dictionary[kUserInfoAndShopShopLatitude] isKindOfClass:[NSNull class]]){
		self.latitude = dictionary[kUserInfoAndShopShopLatitude];
	}	
	if(![dictionary[kUserInfoAndShopShopLongitude] isKindOfClass:[NSNull class]]){
		self.longitude = dictionary[kUserInfoAndShopShopLongitude];
	}	
	if(![dictionary[kUserInfoAndShopShopMerchant_id] isKindOfClass:[NSNull class]]){
		self.merchant_id = [dictionary[kUserInfoAndShopShopMerchant_id] integerValue];
	}

	if(![dictionary[kUserInfoAndShopShopProvince] isKindOfClass:[NSNull class]]){
		self.province = [dictionary[kUserInfoAndShopShopProvince] integerValue];
	}

	if(![dictionary[kUserInfoAndShopShopProvince_name] isKindOfClass:[NSNull class]]){
		self.province_name = dictionary[kUserInfoAndShopShopProvince_name];
	}	
	if(![dictionary[kUserInfoAndShopShopService_hotline] isKindOfClass:[NSNull class]]){
		self.service_hotline = dictionary[kUserInfoAndShopShopService_hotline];
	}	
	if(![dictionary[kUserInfoAndShopShopShop_img] isKindOfClass:[NSNull class]]){
		self.shop_img = dictionary[kUserInfoAndShopShopShop_img];
	}	
	if(![dictionary[kUserInfoAndShopShopShop_name] isKindOfClass:[NSNull class]]){
		self.shop_name = dictionary[kUserInfoAndShopShopShop_name];
	}	
	if(![dictionary[kUserInfoAndShopShopShop_ratings] isKindOfClass:[NSNull class]]){
		self.shop_ratings = [dictionary[kUserInfoAndShopShopShop_ratings] integerValue];
	}

	if(![dictionary[kUserInfoAndShopShopStart_time] isKindOfClass:[NSNull class]]){
		self.start_time = dictionary[kUserInfoAndShopShopStart_time];
	}	
	if(![dictionary[kUserInfoAndShopShopStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kUserInfoAndShopShopStatus] integerValue];
	}

	if(![dictionary[kUserInfoAndShopShopUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kUserInfoAndShopShopUpdated_at];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.address != nil){
		dictionary[kUserInfoAndShopShopAddress] = self.address;
	}
	dictionary[kUserInfoAndShopShopArea] = @(self.area);
	if(self.area_name != nil){
		dictionary[kUserInfoAndShopShopArea_name] = self.area_name;
	}
	if(self.business_tag != nil){
		dictionary[kUserInfoAndShopShopBusiness_tag] = self.business_tag;
	}
	if(self.business_tag_name != nil){
		dictionary[kUserInfoAndShopShopBusiness_tag_name] = self.business_tag_name;
	}
	if(self.business_xkzz != nil){
		dictionary[kUserInfoAndShopShopBusiness_xkzz] = self.business_xkzz;
	}
	dictionary[kUserInfoAndShopShopCate_id] = @(self.cate_id);
	if(self.cate_id_name != nil){
		dictionary[kUserInfoAndShopShopCate_id_name] = self.cate_id_name;
	}
	dictionary[kUserInfoAndShopShopCity] = @(self.city);
	if(self.city_name != nil){
		dictionary[kUserInfoAndShopShopCity_name] = self.city_name;
	}
	if(self.created_at != nil){
		dictionary[kUserInfoAndShopShopCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kUserInfoAndShopShopDeleted_at] = self.deleted_at;
	}
	if(self.descriptionField != nil){
		dictionary[kUserInfoAndShopShopDescriptionField] = self.descriptionField;
	}
	if(self.earnings != nil){
		dictionary[kUserInfoAndShopShopEarnings] = self.earnings;
	}
	if(self.end_time != nil){
		dictionary[kUserInfoAndShopShopEnd_time] = self.end_time;
	}
	if(self.idField != nil){
		dictionary[kUserInfoAndShopShopIdField] = self.idField;
	}
	if(self.latitude != nil){
		dictionary[kUserInfoAndShopShopLatitude] = self.latitude;
	}
	if(self.longitude != nil){
		dictionary[kUserInfoAndShopShopLongitude] = self.longitude;
	}
	dictionary[kUserInfoAndShopShopMerchant_id] = @(self.merchant_id);
	dictionary[kUserInfoAndShopShopProvince] = @(self.province);
	if(self.province_name != nil){
		dictionary[kUserInfoAndShopShopProvince_name] = self.province_name;
	}
	if(self.service_hotline != nil){
		dictionary[kUserInfoAndShopShopService_hotline] = self.service_hotline;
	}
	if(self.shop_img != nil){
		dictionary[kUserInfoAndShopShopShop_img] = self.shop_img;
	}
	if(self.shop_name != nil){
		dictionary[kUserInfoAndShopShopShop_name] = self.shop_name;
	}
	dictionary[kUserInfoAndShopShopShop_ratings] = @(self.shop_ratings);
	if(self.start_time != nil){
		dictionary[kUserInfoAndShopShopStart_time] = self.start_time;
	}
	dictionary[kUserInfoAndShopShopStatus] = @(self.status);
	if(self.updated_at != nil){
		dictionary[kUserInfoAndShopShopUpdated_at] = self.updated_at;
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
	if(self.address != nil){
		[aCoder encodeObject:self.address forKey:kUserInfoAndShopShopAddress];
	}
	[aCoder encodeObject:@(self.area) forKey:kUserInfoAndShopShopArea];	if(self.area_name != nil){
		[aCoder encodeObject:self.area_name forKey:kUserInfoAndShopShopArea_name];
	}
	if(self.business_tag != nil){
		[aCoder encodeObject:self.business_tag forKey:kUserInfoAndShopShopBusiness_tag];
	}
	if(self.business_tag_name != nil){
		[aCoder encodeObject:self.business_tag_name forKey:kUserInfoAndShopShopBusiness_tag_name];
	}
	if(self.business_xkzz != nil){
		[aCoder encodeObject:self.business_xkzz forKey:kUserInfoAndShopShopBusiness_xkzz];
	}
	[aCoder encodeObject:@(self.cate_id) forKey:kUserInfoAndShopShopCate_id];	if(self.cate_id_name != nil){
		[aCoder encodeObject:self.cate_id_name forKey:kUserInfoAndShopShopCate_id_name];
	}
	[aCoder encodeObject:@(self.city) forKey:kUserInfoAndShopShopCity];	if(self.city_name != nil){
		[aCoder encodeObject:self.city_name forKey:kUserInfoAndShopShopCity_name];
	}
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kUserInfoAndShopShopCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kUserInfoAndShopShopDeleted_at];
	}
	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:kUserInfoAndShopShopDescriptionField];
	}
	if(self.earnings != nil){
		[aCoder encodeObject:self.earnings forKey:kUserInfoAndShopShopEarnings];
	}
	if(self.end_time != nil){
		[aCoder encodeObject:self.end_time forKey:kUserInfoAndShopShopEnd_time];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kUserInfoAndShopShopIdField];
	}
	if(self.latitude != nil){
		[aCoder encodeObject:self.latitude forKey:kUserInfoAndShopShopLatitude];
	}
	if(self.longitude != nil){
		[aCoder encodeObject:self.longitude forKey:kUserInfoAndShopShopLongitude];
	}
	[aCoder encodeObject:@(self.merchant_id) forKey:kUserInfoAndShopShopMerchant_id];	[aCoder encodeObject:@(self.province) forKey:kUserInfoAndShopShopProvince];	if(self.province_name != nil){
		[aCoder encodeObject:self.province_name forKey:kUserInfoAndShopShopProvince_name];
	}
	if(self.service_hotline != nil){
		[aCoder encodeObject:self.service_hotline forKey:kUserInfoAndShopShopService_hotline];
	}
	if(self.shop_img != nil){
		[aCoder encodeObject:self.shop_img forKey:kUserInfoAndShopShopShop_img];
	}
	if(self.shop_name != nil){
		[aCoder encodeObject:self.shop_name forKey:kUserInfoAndShopShopShop_name];
	}
	[aCoder encodeObject:@(self.shop_ratings) forKey:kUserInfoAndShopShopShop_ratings];	if(self.start_time != nil){
		[aCoder encodeObject:self.start_time forKey:kUserInfoAndShopShopStart_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kUserInfoAndShopShopStatus];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kUserInfoAndShopShopUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kUserInfoAndShopShopAddress];
	self.area = [[aDecoder decodeObjectForKey:kUserInfoAndShopShopArea] integerValue];
	self.area_name = [aDecoder decodeObjectForKey:kUserInfoAndShopShopArea_name];
	self.business_tag = [aDecoder decodeObjectForKey:kUserInfoAndShopShopBusiness_tag];
	self.business_tag_name = [aDecoder decodeObjectForKey:kUserInfoAndShopShopBusiness_tag_name];
	self.business_xkzz = [aDecoder decodeObjectForKey:kUserInfoAndShopShopBusiness_xkzz];
	self.cate_id = [[aDecoder decodeObjectForKey:kUserInfoAndShopShopCate_id] integerValue];
	self.cate_id_name = [aDecoder decodeObjectForKey:kUserInfoAndShopShopCate_id_name];
	self.city = [[aDecoder decodeObjectForKey:kUserInfoAndShopShopCity] integerValue];
	self.city_name = [aDecoder decodeObjectForKey:kUserInfoAndShopShopCity_name];
	self.created_at = [aDecoder decodeObjectForKey:kUserInfoAndShopShopCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kUserInfoAndShopShopDeleted_at];
	self.descriptionField = [aDecoder decodeObjectForKey:kUserInfoAndShopShopDescriptionField];
	self.earnings = [aDecoder decodeObjectForKey:kUserInfoAndShopShopEarnings];
	self.end_time = [aDecoder decodeObjectForKey:kUserInfoAndShopShopEnd_time];
	self.idField = [aDecoder decodeObjectForKey:kUserInfoAndShopShopIdField];
	self.latitude = [aDecoder decodeObjectForKey:kUserInfoAndShopShopLatitude];
	self.longitude = [aDecoder decodeObjectForKey:kUserInfoAndShopShopLongitude];
	self.merchant_id = [[aDecoder decodeObjectForKey:kUserInfoAndShopShopMerchant_id] integerValue];
	self.province = [[aDecoder decodeObjectForKey:kUserInfoAndShopShopProvince] integerValue];
	self.province_name = [aDecoder decodeObjectForKey:kUserInfoAndShopShopProvince_name];
	self.service_hotline = [aDecoder decodeObjectForKey:kUserInfoAndShopShopService_hotline];
	self.shop_img = [aDecoder decodeObjectForKey:kUserInfoAndShopShopShop_img];
	self.shop_name = [aDecoder decodeObjectForKey:kUserInfoAndShopShopShop_name];
	self.shop_ratings = [[aDecoder decodeObjectForKey:kUserInfoAndShopShopShop_ratings] integerValue];
	self.start_time = [aDecoder decodeObjectForKey:kUserInfoAndShopShopStart_time];
	self.status = [[aDecoder decodeObjectForKey:kUserInfoAndShopShopStatus] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kUserInfoAndShopShopUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UserInfoAndShopShop *copy = [UserInfoAndShopShop new];

	copy.address = [self.address copy];
	copy.area = self.area;
	copy.area_name = [self.area_name copy];
	copy.business_tag = [self.business_tag copy];
	copy.business_tag_name = [self.business_tag_name copy];
	copy.business_xkzz = [self.business_xkzz copy];
	copy.cate_id = self.cate_id;
	copy.cate_id_name = [self.cate_id_name copy];
	copy.city = self.city;
	copy.city_name = [self.city_name copy];
	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.descriptionField = [self.descriptionField copy];
	copy.earnings = [self.earnings copy];
	copy.end_time = [self.end_time copy];
	copy.idField = [self.idField copy];
	copy.latitude = [self.latitude copy];
	copy.longitude = [self.longitude copy];
	copy.merchant_id = self.merchant_id;
	copy.province = self.province;
	copy.province_name = [self.province_name copy];
	copy.service_hotline = [self.service_hotline copy];
	copy.shop_img = [self.shop_img copy];
	copy.shop_name = [self.shop_name copy];
	copy.shop_ratings = self.shop_ratings;
	copy.start_time = [self.start_time copy];
	copy.status = self.status;
	copy.updated_at = [self.updated_at copy];

	return copy;
}
@end
