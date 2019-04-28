//
//	UserShop.m

//  创建于 12/4/2019
//	Copyright © 2019. All rights reserved.




#import "UserShop.h"

NSString *const kUserShopAddress = @"address";
NSString *const kUserShopArea = @"area";
NSString *const kUserShopArea_name = @"area_name";
NSString *const kUserShopBusiness_tag = @"business_tag";
NSString *const kUserShopBusiness_tag_name = @"business_tag_name";
NSString *const kUserShopBusiness_xkzz = @"business_xkzz";
NSString *const kUserShopCate_id = @"cate_id";
NSString *const kUserShopCate_id_name = @"cate_id_name";
NSString *const kUserShopCity = @"city";
NSString *const kUserShopCity_name = @"city_name";
NSString *const kUserShopCreated_at = @"created_at";
NSString *const kUserShopDeleted_at = @"deleted_at";
NSString *const kUserShopDescriptionField = @"description";
NSString *const kUserShopEarnings = @"earnings";
NSString *const kUserShopEnd_time = @"end_time";
NSString *const kUserShopIdField = @"id";
NSString *const kUserShopLatitude = @"latitude";
NSString *const kUserShopLongitude = @"longitude";
NSString *const kUserShopMerchant_id = @"merchant_id";
NSString *const kUserShopProvince = @"province";
NSString *const kUserShopProvince_name = @"province_name";
NSString *const kUserShopService_hotline = @"service_hotline";
NSString *const kUserShopShop_img = @"shop_img";
NSString *const kUserShopShop_name = @"shop_name";
NSString *const kUserShopShop_ratings = @"shop_ratings";
NSString *const kUserShopStart_time = @"start_time";
NSString *const kUserShopStatus = @"status";
NSString *const kUserShopUpdated_at = @"updated_at";

@interface UserShop ()
@end
@implementation UserShop




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUserShopAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kUserShopAddress];
	}	
	if(![dictionary[kUserShopArea] isKindOfClass:[NSNull class]]){
		self.area = [dictionary[kUserShopArea] integerValue];
	}

	if(![dictionary[kUserShopArea_name] isKindOfClass:[NSNull class]]){
		self.area_name = dictionary[kUserShopArea_name];
	}	
	if(![dictionary[kUserShopBusiness_tag] isKindOfClass:[NSNull class]]){
		self.business_tag = dictionary[kUserShopBusiness_tag];
	}	
	if(![dictionary[kUserShopBusiness_tag_name] isKindOfClass:[NSNull class]]){
		self.business_tag_name = dictionary[kUserShopBusiness_tag_name];
	}	
	if(![dictionary[kUserShopBusiness_xkzz] isKindOfClass:[NSNull class]]){
		self.business_xkzz = dictionary[kUserShopBusiness_xkzz];
	}	
	if(![dictionary[kUserShopCate_id] isKindOfClass:[NSNull class]]){
		self.cate_id = [dictionary[kUserShopCate_id] integerValue];
	}

	if(![dictionary[kUserShopCate_id_name] isKindOfClass:[NSNull class]]){
		self.cate_id_name = dictionary[kUserShopCate_id_name];
	}	
	if(![dictionary[kUserShopCity] isKindOfClass:[NSNull class]]){
		self.city = [dictionary[kUserShopCity] integerValue];
	}

	if(![dictionary[kUserShopCity_name] isKindOfClass:[NSNull class]]){
		self.city_name = dictionary[kUserShopCity_name];
	}	
	if(![dictionary[kUserShopCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kUserShopCreated_at];
	}	
	if(![dictionary[kUserShopDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kUserShopDeleted_at];
	}	
	if(![dictionary[kUserShopDescriptionField] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[kUserShopDescriptionField];
	}	
	if(![dictionary[kUserShopEarnings] isKindOfClass:[NSNull class]]){
		self.earnings = dictionary[kUserShopEarnings];
	}	
	if(![dictionary[kUserShopEnd_time] isKindOfClass:[NSNull class]]){
		self.end_time = dictionary[kUserShopEnd_time];
	}	
	if(![dictionary[kUserShopIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kUserShopIdField] integerValue];
	}

	if(![dictionary[kUserShopLatitude] isKindOfClass:[NSNull class]]){
		self.latitude = dictionary[kUserShopLatitude];
	}	
	if(![dictionary[kUserShopLongitude] isKindOfClass:[NSNull class]]){
		self.longitude = dictionary[kUserShopLongitude];
	}	
	if(![dictionary[kUserShopMerchant_id] isKindOfClass:[NSNull class]]){
		self.merchant_id = dictionary[kUserShopMerchant_id];
	}

	if(![dictionary[kUserShopProvince] isKindOfClass:[NSNull class]]){
		self.province = [dictionary[kUserShopProvince] integerValue];
	}

	if(![dictionary[kUserShopProvince_name] isKindOfClass:[NSNull class]]){
		self.province_name = dictionary[kUserShopProvince_name];
	}	
	if(![dictionary[kUserShopService_hotline] isKindOfClass:[NSNull class]]){
		self.service_hotline = dictionary[kUserShopService_hotline];
	}	
	if(![dictionary[kUserShopShop_img] isKindOfClass:[NSNull class]]){
		self.shop_img = dictionary[kUserShopShop_img];
	}	
	if(![dictionary[kUserShopShop_name] isKindOfClass:[NSNull class]]){
		self.shop_name = dictionary[kUserShopShop_name];
	}	
	if(![dictionary[kUserShopShop_ratings] isKindOfClass:[NSNull class]]){
		self.shop_ratings = [dictionary[kUserShopShop_ratings] integerValue];
	}

	if(![dictionary[kUserShopStart_time] isKindOfClass:[NSNull class]]){
		self.start_time = dictionary[kUserShopStart_time];
	}	
	if(![dictionary[kUserShopStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kUserShopStatus] integerValue];
	}

	if(![dictionary[kUserShopUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kUserShopUpdated_at];
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
		dictionary[kUserShopAddress] = self.address;
	}
	dictionary[kUserShopArea] = @(self.area);
	if(self.area_name != nil){
		dictionary[kUserShopArea_name] = self.area_name;
	}
	if(self.business_tag != nil){
		dictionary[kUserShopBusiness_tag] = self.business_tag;
	}
	if(self.business_tag_name != nil){
		dictionary[kUserShopBusiness_tag_name] = self.business_tag_name;
	}
	if(self.business_xkzz != nil){
		dictionary[kUserShopBusiness_xkzz] = self.business_xkzz;
	}
	dictionary[kUserShopCate_id] = @(self.cate_id);
	if(self.cate_id_name != nil){
		dictionary[kUserShopCate_id_name] = self.cate_id_name;
	}
	dictionary[kUserShopCity] = @(self.city);
	if(self.city_name != nil){
		dictionary[kUserShopCity_name] = self.city_name;
	}
	if(self.created_at != nil){
		dictionary[kUserShopCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kUserShopDeleted_at] = self.deleted_at;
	}
	if(self.descriptionField != nil){
		dictionary[kUserShopDescriptionField] = self.descriptionField;
	}
	if(self.earnings != nil){
		dictionary[kUserShopEarnings] = self.earnings;
	}
	if(self.end_time != nil){
		dictionary[kUserShopEnd_time] = self.end_time;
	}
	dictionary[kUserShopIdField] = @(self.idField);
	if(self.latitude != nil){
		dictionary[kUserShopLatitude] = self.latitude;
	}
	if(self.longitude != nil){
		dictionary[kUserShopLongitude] = self.longitude;
	}
	dictionary[kUserShopMerchant_id] = self.merchant_id;
	dictionary[kUserShopProvince] = @(self.province);
	if(self.province_name != nil){
		dictionary[kUserShopProvince_name] = self.province_name;
	}
	if(self.service_hotline != nil){
		dictionary[kUserShopService_hotline] = self.service_hotline;
	}
	if(self.shop_img != nil){
		dictionary[kUserShopShop_img] = self.shop_img;
	}
	if(self.shop_name != nil){
		dictionary[kUserShopShop_name] = self.shop_name;
	}
	dictionary[kUserShopShop_ratings] = @(self.shop_ratings);
	if(self.start_time != nil){
		dictionary[kUserShopStart_time] = self.start_time;
	}
	dictionary[kUserShopStatus] = @(self.status);
	if(self.updated_at != nil){
		dictionary[kUserShopUpdated_at] = self.updated_at;
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
		[aCoder encodeObject:self.address forKey:kUserShopAddress];
	}
	[aCoder encodeObject:@(self.area) forKey:kUserShopArea];	if(self.area_name != nil){
		[aCoder encodeObject:self.area_name forKey:kUserShopArea_name];
	}
	if(self.business_tag != nil){
		[aCoder encodeObject:self.business_tag forKey:kUserShopBusiness_tag];
	}
	if(self.business_tag_name != nil){
		[aCoder encodeObject:self.business_tag_name forKey:kUserShopBusiness_tag_name];
	}
	if(self.business_xkzz != nil){
		[aCoder encodeObject:self.business_xkzz forKey:kUserShopBusiness_xkzz];
	}
	[aCoder encodeObject:@(self.cate_id) forKey:kUserShopCate_id];	if(self.cate_id_name != nil){
		[aCoder encodeObject:self.cate_id_name forKey:kUserShopCate_id_name];
	}
	[aCoder encodeObject:@(self.city) forKey:kUserShopCity];	if(self.city_name != nil){
		[aCoder encodeObject:self.city_name forKey:kUserShopCity_name];
	}
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kUserShopCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kUserShopDeleted_at];
	}
	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:kUserShopDescriptionField];
	}
	if(self.earnings != nil){
		[aCoder encodeObject:self.earnings forKey:kUserShopEarnings];
	}
	if(self.end_time != nil){
		[aCoder encodeObject:self.end_time forKey:kUserShopEnd_time];
	}
	[aCoder encodeObject:@(self.idField) forKey:kUserShopIdField];	if(self.latitude != nil){
		[aCoder encodeObject:self.latitude forKey:kUserShopLatitude];
	}
	if(self.longitude != nil){
		[aCoder encodeObject:self.longitude forKey:kUserShopLongitude];
	}
	[aCoder encodeObject:self.merchant_id forKey:kUserShopMerchant_id];	[aCoder encodeObject:@(self.province) forKey:kUserShopProvince];	if(self.province_name != nil){
		[aCoder encodeObject:self.province_name forKey:kUserShopProvince_name];
	}
	if(self.service_hotline != nil){
		[aCoder encodeObject:self.service_hotline forKey:kUserShopService_hotline];
	}
	if(self.shop_img != nil){
		[aCoder encodeObject:self.shop_img forKey:kUserShopShop_img];
	}
	if(self.shop_name != nil){
		[aCoder encodeObject:self.shop_name forKey:kUserShopShop_name];
	}
	[aCoder encodeObject:@(self.shop_ratings) forKey:kUserShopShop_ratings];	if(self.start_time != nil){
		[aCoder encodeObject:self.start_time forKey:kUserShopStart_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kUserShopStatus];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kUserShopUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kUserShopAddress];
	self.area = [[aDecoder decodeObjectForKey:kUserShopArea] integerValue];
	self.area_name = [aDecoder decodeObjectForKey:kUserShopArea_name];
	self.business_tag = [aDecoder decodeObjectForKey:kUserShopBusiness_tag];
	self.business_tag_name = [aDecoder decodeObjectForKey:kUserShopBusiness_tag_name];
	self.business_xkzz = [aDecoder decodeObjectForKey:kUserShopBusiness_xkzz];
	self.cate_id = [[aDecoder decodeObjectForKey:kUserShopCate_id] integerValue];
	self.cate_id_name = [aDecoder decodeObjectForKey:kUserShopCate_id_name];
	self.city = [[aDecoder decodeObjectForKey:kUserShopCity] integerValue];
	self.city_name = [aDecoder decodeObjectForKey:kUserShopCity_name];
	self.created_at = [aDecoder decodeObjectForKey:kUserShopCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kUserShopDeleted_at];
	self.descriptionField = [aDecoder decodeObjectForKey:kUserShopDescriptionField];
	self.earnings = [aDecoder decodeObjectForKey:kUserShopEarnings];
	self.end_time = [aDecoder decodeObjectForKey:kUserShopEnd_time];
	self.idField = [[aDecoder decodeObjectForKey:kUserShopIdField] integerValue];
	self.latitude = [aDecoder decodeObjectForKey:kUserShopLatitude];
	self.longitude = [aDecoder decodeObjectForKey:kUserShopLongitude];
	self.merchant_id = [aDecoder decodeObjectForKey:kUserShopMerchant_id];
	self.province = [[aDecoder decodeObjectForKey:kUserShopProvince] integerValue];
	self.province_name = [aDecoder decodeObjectForKey:kUserShopProvince_name];
	self.service_hotline = [aDecoder decodeObjectForKey:kUserShopService_hotline];
	self.shop_img = [aDecoder decodeObjectForKey:kUserShopShop_img];
	self.shop_name = [aDecoder decodeObjectForKey:kUserShopShop_name];
	self.shop_ratings = [[aDecoder decodeObjectForKey:kUserShopShop_ratings] integerValue];
	self.start_time = [aDecoder decodeObjectForKey:kUserShopStart_time];
	self.status = [[aDecoder decodeObjectForKey:kUserShopStatus] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kUserShopUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UserShop *copy = [UserShop new];

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
	copy.idField = self.idField;
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
