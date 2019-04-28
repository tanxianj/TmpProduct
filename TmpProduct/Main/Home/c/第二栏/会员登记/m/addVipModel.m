//
//	addVipModel.m

//  创建于 19/4/2019
//	Copyright © 2019. All rights reserved.




#import "addVipModel.h"

NSString *const kaddVipModelBirthday = @"birthday";
NSString *const kaddVipModelDesc = @"desc";
NSString *const kaddVipModelHead_pic = @"head_pic";
NSString *const kaddVipModelMobile = @"mobile";
NSString *const kaddVipModelName = @"name";
NSString *const kaddVipModelSex = @"sex";

@interface addVipModel ()
@end
@implementation addVipModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kaddVipModelBirthday] isKindOfClass:[NSNull class]]){
		self.birthday = dictionary[kaddVipModelBirthday];
	}	
	if(![dictionary[kaddVipModelDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kaddVipModelDesc];
	}	
	if(![dictionary[kaddVipModelHead_pic] isKindOfClass:[NSNull class]]){
		self.head_pic = dictionary[kaddVipModelHead_pic];
	}	
	if(![dictionary[kaddVipModelMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kaddVipModelMobile];
	}	
	if(![dictionary[kaddVipModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kaddVipModelName];
	}	
	if(![dictionary[kaddVipModelSex] isKindOfClass:[NSNull class]]){
		self.sex = dictionary[kaddVipModelSex];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.birthday != nil){
		dictionary[kaddVipModelBirthday] = self.birthday;
	}
	if(self.desc != nil){
		dictionary[kaddVipModelDesc] = self.desc;
	}
	if(self.head_pic != nil){
		dictionary[kaddVipModelHead_pic] = self.head_pic;
	}
	if(self.mobile != nil){
		dictionary[kaddVipModelMobile] = self.mobile;
	}
	if(self.name != nil){
		dictionary[kaddVipModelName] = self.name;
	}
	if(self.sex != nil){
		dictionary[kaddVipModelSex] = self.sex;
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
	if(self.birthday != nil){
		[aCoder encodeObject:self.birthday forKey:kaddVipModelBirthday];
	}
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:kaddVipModelDesc];
	}
	if(self.head_pic != nil){
		[aCoder encodeObject:self.head_pic forKey:kaddVipModelHead_pic];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kaddVipModelMobile];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kaddVipModelName];
	}
	if(self.sex != nil){
		[aCoder encodeObject:self.sex forKey:kaddVipModelSex];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.birthday = [aDecoder decodeObjectForKey:kaddVipModelBirthday];
	self.desc = [aDecoder decodeObjectForKey:kaddVipModelDesc];
	self.head_pic = [aDecoder decodeObjectForKey:kaddVipModelHead_pic];
	self.mobile = [aDecoder decodeObjectForKey:kaddVipModelMobile];
	self.name = [aDecoder decodeObjectForKey:kaddVipModelName];
	self.sex = [aDecoder decodeObjectForKey:kaddVipModelSex];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	addVipModel *copy = [addVipModel new];

	copy.birthday = [self.birthday copy];
	copy.desc = [self.desc copy];
	copy.head_pic = [self.head_pic copy];
	copy.mobile = [self.mobile copy];
	copy.name = [self.name copy];
	copy.sex = [self.sex copy];

	return copy;
}
@end