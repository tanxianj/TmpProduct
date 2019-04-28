//
//	APPAddressModel.m

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.




#import "APPAddressModel.h"

NSString *const kAPPAddressModelCity = @"city";
NSString *const kAPPAddressModelCityCode = @"cityCode";
NSString *const kAPPAddressModelProvince = @"province";
NSString *const kAPPAddressModelProvinceCode = @"provinceCode";
NSString *const kAPPAddressModelTown = @"town";
NSString *const kAPPAddressModelTownCode = @"townCode";

@interface APPAddressModel ()
@end
@implementation APPAddressModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAPPAddressModelCity] isKindOfClass:[NSNull class]]){
		self.city = dictionary[kAPPAddressModelCity];
	}	
	if(![dictionary[kAPPAddressModelCityCode] isKindOfClass:[NSNull class]]){
		self.cityCode = dictionary[kAPPAddressModelCityCode];
	}	
	if(![dictionary[kAPPAddressModelProvince] isKindOfClass:[NSNull class]]){
		self.province = dictionary[kAPPAddressModelProvince];
	}	
	if(![dictionary[kAPPAddressModelProvinceCode] isKindOfClass:[NSNull class]]){
		self.provinceCode = dictionary[kAPPAddressModelProvinceCode];
	}	
	if(![dictionary[kAPPAddressModelTown] isKindOfClass:[NSNull class]]){
		self.town = dictionary[kAPPAddressModelTown];
	}	
	if(![dictionary[kAPPAddressModelTownCode] isKindOfClass:[NSNull class]]){
		self.townCode = dictionary[kAPPAddressModelTownCode];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.city != nil){
		dictionary[kAPPAddressModelCity] = self.city;
	}
	if(self.cityCode != nil){
		dictionary[kAPPAddressModelCityCode] = self.cityCode;
	}
	if(self.province != nil){
		dictionary[kAPPAddressModelProvince] = self.province;
	}
	if(self.provinceCode != nil){
		dictionary[kAPPAddressModelProvinceCode] = self.provinceCode;
	}
	if(self.town != nil){
		dictionary[kAPPAddressModelTown] = self.town;
	}
	dictionary[kAPPAddressModelTownCode] = self.townCode;
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
	if(self.city != nil){
		[aCoder encodeObject:self.city forKey:kAPPAddressModelCity];
	}
	if(self.cityCode != nil){
		[aCoder encodeObject:self.cityCode forKey:kAPPAddressModelCityCode];
	}
	if(self.province != nil){
		[aCoder encodeObject:self.province forKey:kAPPAddressModelProvince];
	}
	if(self.provinceCode != nil){
		[aCoder encodeObject:self.provinceCode forKey:kAPPAddressModelProvinceCode];
	}
	if(self.town != nil){
		[aCoder encodeObject:self.town forKey:kAPPAddressModelTown];
	}
	[aCoder encodeObject:self.townCode forKey:kAPPAddressModelTownCode];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.city = [aDecoder decodeObjectForKey:kAPPAddressModelCity];
	self.cityCode = [aDecoder decodeObjectForKey:kAPPAddressModelCityCode];
	self.province = [aDecoder decodeObjectForKey:kAPPAddressModelProvince];
	self.provinceCode = [aDecoder decodeObjectForKey:kAPPAddressModelProvinceCode];
	self.town = [aDecoder decodeObjectForKey:kAPPAddressModelTown];
	self.townCode = [aDecoder decodeObjectForKey:kAPPAddressModelTownCode];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	APPAddressModel *copy = [APPAddressModel new];

	copy.city = [self.city copy];
	copy.cityCode = [self.cityCode copy];
	copy.province = [self.province copy];
	copy.provinceCode = [self.provinceCode copy];
	copy.town = [self.town copy];
	copy.townCode = [self.townCode copy];

	return copy;
}
@end
