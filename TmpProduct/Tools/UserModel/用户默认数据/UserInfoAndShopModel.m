//
//	UserInfoAndShopModel.m

//  创建于 15/4/2019
//	Copyright © 2019. All rights reserved.




#import "UserInfoAndShopModel.h"
#import "LocalDataTool.h"
#import <YYModel.h>

NSString *const kUserInfoAndShopModelShop = @"shop";
NSString *const kUserInfoAndShopModelUser = @"user";

static UserInfoAndShopModel *model;
static dispatch_once_t onceToken;
@interface UserInfoAndShopModel ()

@end
@implementation UserInfoAndShopModel
#pragma mark -
+ (instancetype)sharedUserModel {
    dispatch_once(&onceToken, ^{
        NSDictionary *keepUserInfo = [LocalDataTool readUserInfoAndAshop];
        if (keepUserInfo) {
            model = [[UserInfoAndShopModel alloc]initWithDictionary:keepUserInfo];
        }
        else {
            model = [[UserInfoAndShopModel alloc] init];
        }
    });
    return model;
}
+(void)attempDealloc{
    onceToken = 0;// 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    model = nil;
}
/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUserInfoAndShopModelShop] isKindOfClass:[NSNull class]]){
		self.shop = [[UserInfoAndShopShop alloc] initWithDictionary:dictionary[kUserInfoAndShopModelShop]];
	}

	if(![dictionary[kUserInfoAndShopModelUser] isKindOfClass:[NSNull class]]){
		self.user = [[UserInfoAndShopUser alloc] initWithDictionary:dictionary[kUserInfoAndShopModelUser]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.shop != nil){
		dictionary[kUserInfoAndShopModelShop] = [self.shop toDictionary];
	}
	if(self.user != nil){
		dictionary[kUserInfoAndShopModelUser] = [self.user toDictionary];
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
	if(self.shop != nil){
		[aCoder encodeObject:self.shop forKey:kUserInfoAndShopModelShop];
	}
	if(self.user != nil){
		[aCoder encodeObject:self.user forKey:kUserInfoAndShopModelUser];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.shop = [aDecoder decodeObjectForKey:kUserInfoAndShopModelShop];
	self.user = [aDecoder decodeObjectForKey:kUserInfoAndShopModelUser];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UserInfoAndShopModel *copy = [UserInfoAndShopModel new];

	copy.shop = [self.shop copy];
	copy.user = [self.user copy];

	return copy;
}
@end
