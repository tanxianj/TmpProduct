//
//	UserModel.m

//  创建于 12/4/2019
//	Copyright © 2019. All rights reserved.




#import "UserModel.h"
#import <YYModel.h>
#import "LocalDataTool.h"

NSString *const kUserModelCreated_at = @"created_at";
NSString *const kUserModelDeleted_at = @"deleted_at";
NSString *const kUserModelHead_pic = @"head_pic";
NSString *const kUserModelIdField = @"id";
NSString *const kUserModelInshop = @"inshop";
NSString *const kUserModelIs_merchant = @"is_merchant";
NSString *const kUserModelLastlogin_at = @"lastlogin_at";
NSString *const kUserModelMerchant_id = @"merchant_id";
NSString *const kUserModelMobile = @"mobile";
NSString *const kUserModelName = @"name";
NSString *const kUserModelShops = @"shops";
NSString *const kUserModelStatus = @"status";
NSString *const kUserModelToken = @"token";
NSString *const kUserModelUpdated_at = @"updated_at";
static UserModel *model;
static dispatch_once_t onceToken;
@interface UserModel ()

@end

@implementation UserModel


#pragma mark -
+ (instancetype)sharedUserModel {
    
    dispatch_once(&onceToken, ^{
        NSDictionary *keepUserInfo = [LocalDataTool readKeepUserInfo];
        if (keepUserInfo) {
            model = [[UserModel alloc]initWithDictionary:keepUserInfo];
        }
        else {
            model = [[UserModel alloc] init];
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
	if(![dictionary[kUserModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kUserModelCreated_at];
	}	
	if(![dictionary[kUserModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kUserModelDeleted_at];
	}	
	if(![dictionary[kUserModelHead_pic] isKindOfClass:[NSNull class]]){
		self.head_pic = dictionary[kUserModelHead_pic];
	}	
	if(![dictionary[kUserModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kUserModelIdField] integerValue];
	}

	if(![dictionary[kUserModelInshop] isKindOfClass:[NSNull class]]){
		self.inshop = [dictionary[kUserModelInshop] integerValue];
	}

	if(![dictionary[kUserModelIs_merchant] isKindOfClass:[NSNull class]]){
		self.is_merchant = [dictionary[kUserModelIs_merchant] integerValue];
	}

	if(![dictionary[kUserModelLastlogin_at] isKindOfClass:[NSNull class]]){
		self.lastlogin_at = dictionary[kUserModelLastlogin_at];
	}	
	if(![dictionary[kUserModelMerchant_id] isKindOfClass:[NSNull class]]){
		self.merchant_id = dictionary[kUserModelMerchant_id];
	}

	if(![dictionary[kUserModelMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kUserModelMobile];
	}	
	if(![dictionary[kUserModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kUserModelName];
	}	
	if(dictionary[kUserModelShops] != nil && [dictionary[kUserModelShops] isKindOfClass:[NSArray class]]){
		NSArray * shopsDictionaries = dictionary[kUserModelShops];
		NSMutableArray * shopsItems = [NSMutableArray array];
		for(NSDictionary * shopsDictionary in shopsDictionaries){
			UserShop * shopsItem = [[UserShop alloc] initWithDictionary:shopsDictionary];
			[shopsItems addObject:shopsItem];
		}
		self.shops = shopsItems;
	}
	if(![dictionary[kUserModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kUserModelStatus] integerValue];
	}

	if(![dictionary[kUserModelToken] isKindOfClass:[NSNull class]]){
		self.token = dictionary[kUserModelToken];
	}	
	if(![dictionary[kUserModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kUserModelUpdated_at];
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
		dictionary[kUserModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kUserModelDeleted_at] = self.deleted_at;
	}
	if(self.head_pic != nil){
		dictionary[kUserModelHead_pic] = self.head_pic;
	}
	dictionary[kUserModelIdField] = @(self.idField);
	dictionary[kUserModelInshop] = @(self.inshop);
	dictionary[kUserModelIs_merchant] = @(self.is_merchant);
	if(self.lastlogin_at != nil){
		dictionary[kUserModelLastlogin_at] = self.lastlogin_at;
	}
	dictionary[kUserModelMerchant_id] = self.merchant_id;
	if(self.mobile != nil){
		dictionary[kUserModelMobile] = self.mobile;
	}
	if(self.name != nil){
		dictionary[kUserModelName] = self.name;
	}
	if(self.shops != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(UserShop * shopsElement in self.shops){
			[dictionaryElements addObject:[shopsElement toDictionary]];
		}
		dictionary[kUserModelShops] = dictionaryElements;
	}
	dictionary[kUserModelStatus] = @(self.status);
	if(self.token != nil){
		dictionary[kUserModelToken] = self.token;
	}
	if(self.updated_at != nil){
		dictionary[kUserModelUpdated_at] = self.updated_at;
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
		[aCoder encodeObject:self.created_at forKey:kUserModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kUserModelDeleted_at];
	}
	if(self.head_pic != nil){
		[aCoder encodeObject:self.head_pic forKey:kUserModelHead_pic];
	}
	[aCoder encodeObject:@(self.idField) forKey:kUserModelIdField];	[aCoder encodeObject:@(self.inshop) forKey:kUserModelInshop];	[aCoder encodeObject:@(self.is_merchant) forKey:kUserModelIs_merchant];	if(self.lastlogin_at != nil){
		[aCoder encodeObject:self.lastlogin_at forKey:kUserModelLastlogin_at];
	}
	[aCoder encodeObject:self.merchant_id forKey:kUserModelMerchant_id];	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kUserModelMobile];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kUserModelName];
	}
	if(self.shops != nil){
		[aCoder encodeObject:self.shops forKey:kUserModelShops];
	}
	[aCoder encodeObject:@(self.status) forKey:kUserModelStatus];	if(self.token != nil){
		[aCoder encodeObject:self.token forKey:kUserModelToken];
	}
	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kUserModelUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.created_at = [aDecoder decodeObjectForKey:kUserModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kUserModelDeleted_at];
	self.head_pic = [aDecoder decodeObjectForKey:kUserModelHead_pic];
	self.idField = [[aDecoder decodeObjectForKey:kUserModelIdField] integerValue];
	self.inshop = [[aDecoder decodeObjectForKey:kUserModelInshop] integerValue];
	self.is_merchant = [[aDecoder decodeObjectForKey:kUserModelIs_merchant] integerValue];
	self.lastlogin_at = [aDecoder decodeObjectForKey:kUserModelLastlogin_at];
	self.merchant_id = [aDecoder decodeObjectForKey:kUserModelMerchant_id];
	self.mobile = [aDecoder decodeObjectForKey:kUserModelMobile];
	self.name = [aDecoder decodeObjectForKey:kUserModelName];
	self.shops = [aDecoder decodeObjectForKey:kUserModelShops];
	self.status = [[aDecoder decodeObjectForKey:kUserModelStatus] integerValue];
	self.token = [aDecoder decodeObjectForKey:kUserModelToken];
	self.updated_at = [aDecoder decodeObjectForKey:kUserModelUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UserModel *copy = [UserModel new];

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
	copy.shops = [self.shops copy];
	copy.status = self.status;
	copy.token = [self.token copy];
	copy.updated_at = [self.updated_at copy];

	return copy;
}

@end
