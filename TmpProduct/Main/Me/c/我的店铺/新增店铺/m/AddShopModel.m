//
//	AddShopModel.m

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.




#import "AddShopModel.h"

NSString *const kAddShopModelAddress = @"address";
NSString *const kAddShopModelArea = @"area";
NSString *const kAddShopModelArea_name = @"area_name";
NSString *const kAddShopModelBusiness_tag = @"business_tag";
NSString *const kAddShopModelBusiness_xkzz = @"business_xkzz";
NSString *const kAddShopModelCate_id = @"cate_id";
NSString *const kAddShopModelCate_id_name = @"cate_id_name";
NSString *const kAddShopModelCity = @"city";
NSString *const kAddShopModelCity_name = @"city_name";
NSString *const kAddShopModelDescriptionField = @"description";
NSString *const kAddShopModelLatitude = @"latitude";
NSString *const kAddShopModelLongitude = @"longitude";
NSString *const kAddShopModelMerchant_id = @"merchant_id";
NSString *const kAddShopModelProvince = @"province";
NSString *const kAddShopModelProvince_name = @"province_name";
NSString *const kAddShopModelStart_time = @"start_time";
NSString *const kAddShopModelEnd_time = @"end_time";
NSString *const kAddShopModelService_hotline = @"service_hotline";
NSString *const kAddShopModelShop_img = @"shop_img";
NSString *const kAddShopModelShop_name = @"shop_name";
NSString *const kAddShopModelStatus = @"status";

@interface AddShopModel ()
@end
@implementation AddShopModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAddShopModelAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kAddShopModelAddress];
	}	
	if(![dictionary[kAddShopModelArea] isKindOfClass:[NSNull class]]){
		self.area = dictionary[kAddShopModelArea];
	}	
	if(![dictionary[kAddShopModelArea_name] isKindOfClass:[NSNull class]]){
		self.area_name = dictionary[kAddShopModelArea_name];
	}	
	if(![dictionary[kAddShopModelBusiness_tag] isKindOfClass:[NSNull class]]){
		self.business_tag = dictionary[kAddShopModelBusiness_tag];
	}	
	if(![dictionary[kAddShopModelBusiness_xkzz] isKindOfClass:[NSNull class]]){
		self.business_xkzz = dictionary[kAddShopModelBusiness_xkzz];
	}	
	if(![dictionary[kAddShopModelCate_id] isKindOfClass:[NSNull class]]){
		self.cate_id = dictionary[kAddShopModelCate_id];
	}	
	if(![dictionary[kAddShopModelCate_id_name] isKindOfClass:[NSNull class]]){
		self.cate_id_name = dictionary[kAddShopModelCate_id_name];
	}	
	if(![dictionary[kAddShopModelCity] isKindOfClass:[NSNull class]]){
		self.city = dictionary[kAddShopModelCity];
	}	
	if(![dictionary[kAddShopModelCity_name] isKindOfClass:[NSNull class]]){
		self.city_name = dictionary[kAddShopModelCity_name];
	}	
	if(![dictionary[kAddShopModelDescriptionField] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[kAddShopModelDescriptionField];
	}	
	if(![dictionary[kAddShopModelLatitude] isKindOfClass:[NSNull class]]){
		self.latitude = dictionary[kAddShopModelLatitude];
	}	
	if(![dictionary[kAddShopModelLongitude] isKindOfClass:[NSNull class]]){
		self.longitude = dictionary[kAddShopModelLongitude];
	}	
	if(![dictionary[kAddShopModelMerchant_id] isKindOfClass:[NSNull class]]){
		self.merchant_id = dictionary[kAddShopModelMerchant_id];
	}	
	if(![dictionary[kAddShopModelProvince] isKindOfClass:[NSNull class]]){
		self.province = dictionary[kAddShopModelProvince];
	}	
	if(![dictionary[kAddShopModelProvince_name] isKindOfClass:[NSNull class]]){
		self.province_name = dictionary[kAddShopModelProvince_name];
	}
    if(![dictionary[kAddShopModelStart_time] isKindOfClass:[NSNull class]]){
        self.start_time = dictionary[kAddShopModelStart_time];
    }
    if(![dictionary[kAddShopModelEnd_time] isKindOfClass:[NSNull class]]){
        self.end_time = dictionary[kAddShopModelEnd_time];
    }
    
	if(![dictionary[kAddShopModelService_hotline] isKindOfClass:[NSNull class]]){
		self.service_hotline = dictionary[kAddShopModelService_hotline];
	}	
	if(![dictionary[kAddShopModelShop_img] isKindOfClass:[NSNull class]]){
		self.shop_img = dictionary[kAddShopModelShop_img];
	}	
	if(![dictionary[kAddShopModelShop_name] isKindOfClass:[NSNull class]]){
		self.shop_name = dictionary[kAddShopModelShop_name];
	}	
	if(![dictionary[kAddShopModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kAddShopModelStatus] integerValue];
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
		dictionary[kAddShopModelAddress] = self.address;
	}
	if(self.area != nil){
		dictionary[kAddShopModelArea] = self.area;
	}
	if(self.area_name != nil){
		dictionary[kAddShopModelArea_name] = self.area_name;
	}
	if(self.business_tag != nil){
		dictionary[kAddShopModelBusiness_tag] = self.business_tag;
	}
	if(self.business_xkzz != nil){
		dictionary[kAddShopModelBusiness_xkzz] = self.business_xkzz;
	}
	if(self.cate_id != nil){
		dictionary[kAddShopModelCate_id] = self.cate_id;
	}
	if(self.cate_id_name != nil){
		dictionary[kAddShopModelCate_id_name] = self.cate_id_name;
	}
	if(self.city != nil){
		dictionary[kAddShopModelCity] = self.city;
	}
	if(self.city_name != nil){
		dictionary[kAddShopModelCity_name] = self.city_name;
	}
	if(self.descriptionField != nil){
		dictionary[kAddShopModelDescriptionField] = self.descriptionField;
	}
	if(self.latitude != nil){
		dictionary[kAddShopModelLatitude] = self.latitude;
	}
	if(self.longitude != nil){
		dictionary[kAddShopModelLongitude] = self.longitude;
	}
	if(self.merchant_id != nil){
		dictionary[kAddShopModelMerchant_id] = self.merchant_id;
	}
	if(self.province != nil){
		dictionary[kAddShopModelProvince] = self.province;
	}
	if(self.province_name != nil){
		dictionary[kAddShopModelProvince_name] = self.province_name;
	}
    if(self.start_time != nil){
        dictionary[kAddShopModelStart_time] = self.start_time;
    }
    if(self.end_time != nil){
        dictionary[kAddShopModelEnd_time] = self.end_time;
    }
    
	if(self.service_hotline != nil){
		dictionary[kAddShopModelService_hotline] = self.service_hotline;
	}
	if(self.shop_img != nil){
		dictionary[kAddShopModelShop_img] = self.shop_img;
	}
	if(self.shop_name != nil){
		dictionary[kAddShopModelShop_name] = self.shop_name;
	}
	dictionary[kAddShopModelStatus] = @(self.status);
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
		[aCoder encodeObject:self.address forKey:kAddShopModelAddress];
	}
	if(self.area != nil){
		[aCoder encodeObject:self.area forKey:kAddShopModelArea];
	}
	if(self.area_name != nil){
		[aCoder encodeObject:self.area_name forKey:kAddShopModelArea_name];
	}
	if(self.business_tag != nil){
		[aCoder encodeObject:self.business_tag forKey:kAddShopModelBusiness_tag];
	}
	if(self.business_xkzz != nil){
		[aCoder encodeObject:self.business_xkzz forKey:kAddShopModelBusiness_xkzz];
	}
	if(self.cate_id != nil){
		[aCoder encodeObject:self.cate_id forKey:kAddShopModelCate_id];
	}
	if(self.cate_id_name != nil){
		[aCoder encodeObject:self.cate_id_name forKey:kAddShopModelCate_id_name];
	}
	if(self.city != nil){
		[aCoder encodeObject:self.city forKey:kAddShopModelCity];
	}
	if(self.city_name != nil){
		[aCoder encodeObject:self.city_name forKey:kAddShopModelCity_name];
	}
	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:kAddShopModelDescriptionField];
	}
	if(self.latitude != nil){
		[aCoder encodeObject:self.latitude forKey:kAddShopModelLatitude];
	}
	if(self.longitude != nil){
		[aCoder encodeObject:self.longitude forKey:kAddShopModelLongitude];
	}
	if(self.merchant_id != nil){
		[aCoder encodeObject:self.merchant_id forKey:kAddShopModelMerchant_id];
	}
	if(self.province != nil){
		[aCoder encodeObject:self.province forKey:kAddShopModelProvince];
	}
	if(self.province_name != nil){
		[aCoder encodeObject:self.province_name forKey:kAddShopModelProvince_name];
	}
    if(self.start_time != nil){
        [aCoder encodeObject:self.start_time forKey:kAddShopModelStart_time];
    }
    if(self.end_time != nil){
        [aCoder encodeObject:self.end_time forKey:kAddShopModelEnd_time];
    }
    
	if(self.service_hotline != nil){
		[aCoder encodeObject:self.service_hotline forKey:kAddShopModelService_hotline];
	}
	if(self.shop_img != nil){
		[aCoder encodeObject:self.shop_img forKey:kAddShopModelShop_img];
	}
	if(self.shop_name != nil){
		[aCoder encodeObject:self.shop_name forKey:kAddShopModelShop_name];
	}
	[aCoder encodeObject:@(self.status) forKey:kAddShopModelStatus];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.address = [aDecoder decodeObjectForKey:kAddShopModelAddress];
	self.area = [aDecoder decodeObjectForKey:kAddShopModelArea];
	self.area_name = [aDecoder decodeObjectForKey:kAddShopModelArea_name];
	self.business_tag = [aDecoder decodeObjectForKey:kAddShopModelBusiness_tag];
	self.business_xkzz = [aDecoder decodeObjectForKey:kAddShopModelBusiness_xkzz];
	self.cate_id = [aDecoder decodeObjectForKey:kAddShopModelCate_id];
	self.cate_id_name = [aDecoder decodeObjectForKey:kAddShopModelCate_id_name];
	self.city = [aDecoder decodeObjectForKey:kAddShopModelCity];
	self.city_name = [aDecoder decodeObjectForKey:kAddShopModelCity_name];
	self.descriptionField = [aDecoder decodeObjectForKey:kAddShopModelDescriptionField];
	self.latitude = [aDecoder decodeObjectForKey:kAddShopModelLatitude];
	self.longitude = [aDecoder decodeObjectForKey:kAddShopModelLongitude];
	self.merchant_id = [aDecoder decodeObjectForKey:kAddShopModelMerchant_id];
	self.province = [aDecoder decodeObjectForKey:kAddShopModelProvince];
	self.province_name = [aDecoder decodeObjectForKey:kAddShopModelProvince_name];
    self.start_time = [aDecoder decodeObjectForKey:kAddShopModelStart_time];
    self.end_time = [aDecoder decodeObjectForKey:kAddShopModelEnd_time];
    
	self.service_hotline = [aDecoder decodeObjectForKey:kAddShopModelService_hotline];
	self.shop_img = [aDecoder decodeObjectForKey:kAddShopModelShop_img];
	self.shop_name = [aDecoder decodeObjectForKey:kAddShopModelShop_name];
	self.status = [[aDecoder decodeObjectForKey:kAddShopModelStatus] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AddShopModel *copy = [AddShopModel new];

	copy.address = [self.address copy];
	copy.area = [self.area copy];
	copy.area_name = [self.area_name copy];
	copy.business_tag = [self.business_tag copy];
	copy.business_xkzz = [self.business_xkzz copy];
	copy.cate_id = [self.cate_id copy];
	copy.cate_id_name = [self.cate_id_name copy];
	copy.city = [self.city copy];
	copy.city_name = [self.city_name copy];
	copy.descriptionField = [self.descriptionField copy];
	copy.latitude = [self.latitude copy];
	copy.longitude = [self.longitude copy];
	copy.merchant_id = [self.merchant_id copy];
	copy.province = [self.province copy];
	copy.province_name = [self.province_name copy];
    copy.start_time = [self.start_time copy];
    copy.end_time = [self.end_time copy];
	copy.service_hotline = [self.service_hotline copy];
	copy.shop_img = [self.shop_img copy];
	copy.shop_name = [self.shop_name copy];
	copy.status = self.status;

	return copy;
}
@end
