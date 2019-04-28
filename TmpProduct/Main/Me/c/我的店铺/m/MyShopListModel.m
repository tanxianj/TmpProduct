//
//	MyShopListModel.m

//  创建于 15/4/2019
//	Copyright © 2019. All rights reserved.




#import "MyShopListModel.h"

NSString *const kMyShopListModelAddress = @"address";
NSString *const kMyShopListModelArea = @"area";
NSString *const kMyShopListModelArea_name = @"area_name";
NSString *const kMyShopListModelBusiness_tag = @"business_tag";
NSString *const kMyShopListModelBusiness_tag_name = @"business_tag_name";
NSString *const kMyShopListModelBusiness_xkzz = @"business_xkzz";
NSString *const kMyShopListModelCate_id = @"cate_id";
NSString *const kMyShopListModelCate_id_name = @"cate_id_name";
NSString *const kMyShopListModelCity = @"city";
NSString *const kMyShopListModelCity_name = @"city_name";
NSString *const kMyShopListModelCreated_at = @"created_at";
NSString *const kMyShopListModelDeleted_at = @"deleted_at";
NSString *const kMyShopListModelDescriptionField = @"description";
NSString *const kMyShopListModelEarnings = @"earnings";
NSString *const kMyShopListModelEnd_time = @"end_time";
NSString *const kMyShopListModelIdField = @"id";
NSString *const kMyShopListModelLatitude = @"latitude";
NSString *const kMyShopListModelLongitude = @"longitude";
NSString *const kMyShopListModelMerchant_id = @"merchant_id";
NSString *const kMyShopListModelProvince = @"province";
NSString *const kMyShopListModelProvince_name = @"province_name";
NSString *const kMyShopListModelService_hotline = @"service_hotline";
NSString *const kMyShopListModelShop_img = @"shop_img";
NSString *const kMyShopListModelShop_name = @"shop_name";
NSString *const kMyShopListModelShop_ratings = @"shop_ratings";
NSString *const kMyShopListModelStart_time = @"start_time";
NSString *const kMyShopListModelStatus = @"status";
NSString *const kMyShopListModelUpdated_at = @"updated_at";

@interface MyShopListModel ()
@end
@implementation MyShopListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMyShopListModelAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kMyShopListModelAddress];
	}	
	if(![dictionary[kMyShopListModelArea] isKindOfClass:[NSNull class]]){
		self.area = [dictionary[kMyShopListModelArea] integerValue];
	}

	if(![dictionary[kMyShopListModelArea_name] isKindOfClass:[NSNull class]]){
		self.area_name = dictionary[kMyShopListModelArea_name];
	}	
	if(![dictionary[kMyShopListModelBusiness_tag] isKindOfClass:[NSNull class]]){
		self.business_tag = dictionary[kMyShopListModelBusiness_tag];
	}	
	if(![dictionary[kMyShopListModelBusiness_tag_name] isKindOfClass:[NSNull class]]){
		self.business_tag_name = dictionary[kMyShopListModelBusiness_tag_name];
	}	
	if(![dictionary[kMyShopListModelBusiness_xkzz] isKindOfClass:[NSNull class]]){
		self.business_xkzz = dictionary[kMyShopListModelBusiness_xkzz];
	}	
	if(![dictionary[kMyShopListModelCate_id] isKindOfClass:[NSNull class]]){
		self.cate_id = [dictionary[kMyShopListModelCate_id] integerValue];
	}

	if(![dictionary[kMyShopListModelCate_id_name] isKindOfClass:[NSNull class]]){
		self.cate_id_name = dictionary[kMyShopListModelCate_id_name];
	}	
	if(![dictionary[kMyShopListModelCity] isKindOfClass:[NSNull class]]){
		self.city = [dictionary[kMyShopListModelCity] integerValue];
	}

	if(![dictionary[kMyShopListModelCity_name] isKindOfClass:[NSNull class]]){
		self.city_name = dictionary[kMyShopListModelCity_name];
	}	
	if(![dictionary[kMyShopListModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kMyShopListModelCreated_at];
	}	
	if(![dictionary[kMyShopListModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kMyShopListModelDeleted_at];
	}	
	if(![dictionary[kMyShopListModelDescriptionField] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[kMyShopListModelDescriptionField];
	}	
	if(![dictionary[kMyShopListModelEarnings] isKindOfClass:[NSNull class]]){
		self.earnings = dictionary[kMyShopListModelEarnings];
	}	
	if(![dictionary[kMyShopListModelEnd_time] isKindOfClass:[NSNull class]]){
		self.end_time = dictionary[kMyShopListModelEnd_time];
	}	
	if(![dictionary[kMyShopListModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kMyShopListModelIdField];
	}

	if(![dictionary[kMyShopListModelLatitude] isKindOfClass:[NSNull class]]){
		self.latitude = dictionary[kMyShopListModelLatitude];
	}	
	if(![dictionary[kMyShopListModelLongitude] isKindOfClass:[NSNull class]]){
		self.longitude = dictionary[kMyShopListModelLongitude];
	}	
	if(![dictionary[kMyShopListModelMerchant_id] isKindOfClass:[NSNull class]]){
		self.merchant_id = [dictionary[kMyShopListModelMerchant_id] integerValue];
	}

	if(![dictionary[kMyShopListModelProvince] isKindOfClass:[NSNull class]]){
		self.province = [dictionary[kMyShopListModelProvince] integerValue];
	}

	if(![dictionary[kMyShopListModelProvince_name] isKindOfClass:[NSNull class]]){
		self.province_name = dictionary[kMyShopListModelProvince_name];
	}	
	if(![dictionary[kMyShopListModelService_hotline] isKindOfClass:[NSNull class]]){
		self.service_hotline = dictionary[kMyShopListModelService_hotline];
	}	
	if(![dictionary[kMyShopListModelShop_img] isKindOfClass:[NSNull class]]){
		self.shop_img = dictionary[kMyShopListModelShop_img];
	}	
	if(![dictionary[kMyShopListModelShop_name] isKindOfClass:[NSNull class]]){
		self.shop_name = dictionary[kMyShopListModelShop_name];
	}	
	if(![dictionary[kMyShopListModelShop_ratings] isKindOfClass:[NSNull class]]){
		self.shop_ratings = [dictionary[kMyShopListModelShop_ratings] integerValue];
	}

	if(![dictionary[kMyShopListModelStart_time] isKindOfClass:[NSNull class]]){
		self.start_time = dictionary[kMyShopListModelStart_time];
	}	
	if(![dictionary[kMyShopListModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kMyShopListModelStatus] integerValue];
	}

	if(![dictionary[kMyShopListModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kMyShopListModelUpdated_at];
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
		dictionary[kMyShopListModelAddress] = self.address;
	}
	dictionary[kMyShopListModelArea] = @(self.area);
	if(self.area_name != nil){
		dictionary[kMyShopListModelArea_name] = self.area_name;
	}
	if(self.business_tag != nil){
		dictionary[kMyShopListModelBusiness_tag] = self.business_tag;
	}
	if(self.business_tag_name != nil){
		dictionary[kMyShopListModelBusiness_tag_name] = self.business_tag_name;
	}
	if(self.business_xkzz != nil){
		dictionary[kMyShopListModelBusiness_xkzz] = self.business_xkzz;
	}
	dictionary[kMyShopListModelCate_id] = @(self.cate_id);
	if(self.cate_id_name != nil){
		dictionary[kMyShopListModelCate_id_name] = self.cate_id_name;
	}
	dictionary[kMyShopListModelCity] = @(self.city);
	if(self.city_name != nil){
		dictionary[kMyShopListModelCity_name] = self.city_name;
	}
	if(self.created_at != nil){
		dictionary[kMyShopListModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kMyShopListModelDeleted_at] = self.deleted_at;
	}
	if(self.descriptionField != nil){
		dictionary[kMyShopListModelDescriptionField] = self.descriptionField;
	}
	if(self.earnings != nil){
		dictionary[kMyShopListModelEarnings] = self.earnings;
	}
	if(self.end_time != nil){
		dictionary[kMyShopListModelEnd_time] = self.end_time;
	}
	dictionary[kMyShopListModelIdField] = self.idField;
	if(self.latitude != nil){
		dictionary[kMyShopListModelLatitude] = self.latitude;
	}
	if(self.longitude != nil){
		dictionary[kMyShopListModelLongitude] = self.longitude;
	}
	dictionary[kMyShopListModelMerchant_id] = @(self.merchant_id);
	dictionary[kMyShopListModelProvince] = @(self.province);
	if(self.province_name != nil){
		dictionary[kMyShopListModelProvince_name] = self.province_name;
	}
	if(self.service_hotline != nil){
		dictionary[kMyShopListModelService_hotline] = self.service_hotline;
	}
	if(self.shop_img != nil){
		dictionary[kMyShopListModelShop_img] = self.shop_img;
	}
	if(self.shop_name != nil){
		dictionary[kMyShopListModelShop_name] = self.shop_name;
	}
	dictionary[kMyShopListModelShop_ratings] = @(self.shop_ratings);
	if(self.start_time != nil){
		dictionary[kMyShopListModelStart_time] = self.start_time;
	}
	dictionary[kMyShopListModelStatus] = @(self.status);
	if(self.updated_at != nil){
		dictionary[kMyShopListModelUpdated_at] = self.updated_at;
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
		[aCoder encodeObject:self.address forKey:kMyShopListModelAddress];
	}
	[aCoder encodeObject:@(self.area) forKey:kMyShopListModelArea];	if(self.area_name != nil){
		[aCoder encodeObject:self.area_name forKey:kMyShopListModelArea_name];
	}
	if(self.business_tag != nil){
		[aCoder encodeObject:self.business_tag forKey:kMyShopListModelBusiness_tag];
	}
	if(self.business_tag_name != nil){
		[aCoder encodeObject:self.business_tag_name forKey:kMyShopListModelBusiness_tag_name];
	}
	if(self.business_xkzz != nil){
		[aCoder encodeObject:self.business_xkzz forKey:kMyShopListModelBusiness_xkzz];
	}
	[aCoder encodeObject:@(self.cate_id) forKey:kMyShopListModelCate_id];	if(self.cate_id_name != nil){
		[aCoder encodeObject:self.cate_id_name forKey:kMyShopListModelCate_id_name];
	}
	[aCoder encodeObject:@(self.city) forKey:kMyShopListModelCity];	if(self.city_name != nil){
		[aCoder encodeObject:self.city_name forKey:kMyShopListModelCity_name];
	}
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kMyShopListModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kMyShopListModelDeleted_at];
	}
	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:kMyShopListModelDescriptionField];
	}
	if(self.earnings != nil){
		[aCoder encodeObject:self.earnings forKey:kMyShopListModelEarnings];
	}
	if(self.end_time != nil){
		[aCoder encodeObject:self.end_time forKey:kMyShopListModelEnd_time];
	}
	[aCoder encodeObject:self.idField forKey:kMyShopListModelIdField];	if(self.latitude != nil){
		[aCoder encodeObject:self.latitude forKey:kMyShopListModelLatitude];
	}
	if(self.longitude != nil){
		[aCoder encodeObject:self.longitude forKey:kMyShopListModelLongitude];
	}
	[aCoder encodeObject:@(self.merchant_id) forKey:kMyShopListModelMerchant_id];	[aCoder encodeObject:@(self.province) forKey:kMyShopListModelProvince];	if(self.province_name != nil){
		[aCoder encodeObject:self.province_name forKey:kMyShopListModelProvince_name];
	}
	if(self.service_hotline != nil){
		[aCoder encodeObject:self.service_hotline forKey:kMyShopListModelService_hotline];
	}
	if(self.shop_img != nil){
		[aCoder encodeObject:self.shop_img forKey:kMyShopListModelShop_img];
	}
	if(self.shop_name != nil){
		[aCoder encodeObject:self.shop_name forKey:kMyShopListModelShop_name];
	}
	[aCoder encodeObject:@(self.shop_ratings) forKey:kMyShopListModelShop_ratings];	if(self.start_time != nil){
		[aCoder encodeObject:self.start_time forKey:kMyShopListModelStart_time];
	}
	[aCoder encodeObject:@(self.status) forKey:kMyShopListModelStatus];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kMyShopListModelUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kMyShopListModelAddress];
	self.area = [[aDecoder decodeObjectForKey:kMyShopListModelArea] integerValue];
	self.area_name = [aDecoder decodeObjectForKey:kMyShopListModelArea_name];
	self.business_tag = [aDecoder decodeObjectForKey:kMyShopListModelBusiness_tag];
	self.business_tag_name = [aDecoder decodeObjectForKey:kMyShopListModelBusiness_tag_name];
	self.business_xkzz = [aDecoder decodeObjectForKey:kMyShopListModelBusiness_xkzz];
	self.cate_id = [[aDecoder decodeObjectForKey:kMyShopListModelCate_id] integerValue];
	self.cate_id_name = [aDecoder decodeObjectForKey:kMyShopListModelCate_id_name];
	self.city = [[aDecoder decodeObjectForKey:kMyShopListModelCity] integerValue];
	self.city_name = [aDecoder decodeObjectForKey:kMyShopListModelCity_name];
	self.created_at = [aDecoder decodeObjectForKey:kMyShopListModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kMyShopListModelDeleted_at];
	self.descriptionField = [aDecoder decodeObjectForKey:kMyShopListModelDescriptionField];
	self.earnings = [aDecoder decodeObjectForKey:kMyShopListModelEarnings];
	self.end_time = [aDecoder decodeObjectForKey:kMyShopListModelEnd_time];
	self.idField = [aDecoder decodeObjectForKey:kMyShopListModelIdField];
	self.latitude = [aDecoder decodeObjectForKey:kMyShopListModelLatitude];
	self.longitude = [aDecoder decodeObjectForKey:kMyShopListModelLongitude];
	self.merchant_id = [[aDecoder decodeObjectForKey:kMyShopListModelMerchant_id] integerValue];
	self.province = [[aDecoder decodeObjectForKey:kMyShopListModelProvince] integerValue];
	self.province_name = [aDecoder decodeObjectForKey:kMyShopListModelProvince_name];
	self.service_hotline = [aDecoder decodeObjectForKey:kMyShopListModelService_hotline];
	self.shop_img = [aDecoder decodeObjectForKey:kMyShopListModelShop_img];
	self.shop_name = [aDecoder decodeObjectForKey:kMyShopListModelShop_name];
	self.shop_ratings = [[aDecoder decodeObjectForKey:kMyShopListModelShop_ratings] integerValue];
	self.start_time = [aDecoder decodeObjectForKey:kMyShopListModelStart_time];
	self.status = [[aDecoder decodeObjectForKey:kMyShopListModelStatus] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kMyShopListModelUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	MyShopListModel *copy = [MyShopListModel new];

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
