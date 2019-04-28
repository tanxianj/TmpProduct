//
//	OrderCommentModel.m

//  创建于 24/4/2019
//	Copyright © 2019. All rights reserved.




#import "OrderCommentModel.h"

NSString *const kOrderCommentModelContent = @"content";
NSString *const kOrderCommentModelCreated_at = @"created_at";
NSString *const kOrderCommentModelDeleted_at = @"deleted_at";
NSString *const kOrderCommentModelGoods_id = @"goods_id";
NSString *const kOrderCommentModelGoods_ratings = @"goods_ratings";
NSString *const kOrderCommentModelHead_pic = @"head_pic";
NSString *const kOrderCommentModelIdField = @"id";
NSString *const kOrderCommentModelImage = @"image";
NSString *const kOrderCommentModelName = @"name";
NSString *const kOrderCommentModelOrder_id = @"order_id";
NSString *const kOrderCommentModelUpdated_at = @"updated_at";
NSString *const kOrderCommentModelUser_id = @"user_id";

@interface OrderCommentModel ()
@end
@implementation OrderCommentModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kOrderCommentModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kOrderCommentModelContent];
	}	
	if(![dictionary[kOrderCommentModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kOrderCommentModelCreated_at];
	}	
	if(![dictionary[kOrderCommentModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kOrderCommentModelDeleted_at];
	}	
	if(![dictionary[kOrderCommentModelGoods_id] isKindOfClass:[NSNull class]]){
		self.goods_id = [dictionary[kOrderCommentModelGoods_id] integerValue];
	}

	if(![dictionary[kOrderCommentModelGoods_ratings] isKindOfClass:[NSNull class]]){
		self.goods_ratings = [dictionary[kOrderCommentModelGoods_ratings] floatValue];
	}

	if(![dictionary[kOrderCommentModelHead_pic] isKindOfClass:[NSNull class]]){
		self.head_pic = dictionary[kOrderCommentModelHead_pic];
	}	
	if(![dictionary[kOrderCommentModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kOrderCommentModelIdField] integerValue];
	}

	if(![dictionary[kOrderCommentModelImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kOrderCommentModelImage];
	}	
	if(![dictionary[kOrderCommentModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kOrderCommentModelName];
	}	
	if(![dictionary[kOrderCommentModelOrder_id] isKindOfClass:[NSNull class]]){
		self.order_id = [dictionary[kOrderCommentModelOrder_id] integerValue];
	}

	if(![dictionary[kOrderCommentModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kOrderCommentModelUpdated_at];
	}	
	if(![dictionary[kOrderCommentModelUser_id] isKindOfClass:[NSNull class]]){
		self.user_id = [dictionary[kOrderCommentModelUser_id] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.content != nil){
		dictionary[kOrderCommentModelContent] = self.content;
	}
	if(self.created_at != nil){
		dictionary[kOrderCommentModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kOrderCommentModelDeleted_at] = self.deleted_at;
	}
	dictionary[kOrderCommentModelGoods_id] = @(self.goods_id);
	dictionary[kOrderCommentModelGoods_ratings] = @(self.goods_ratings);
	if(self.head_pic != nil){
		dictionary[kOrderCommentModelHead_pic] = self.head_pic;
	}
	dictionary[kOrderCommentModelIdField] = @(self.idField);
	if(self.image != nil){
		dictionary[kOrderCommentModelImage] = self.image;
	}
	if(self.name != nil){
		dictionary[kOrderCommentModelName] = self.name;
	}
	dictionary[kOrderCommentModelOrder_id] = @(self.order_id);
	if(self.updated_at != nil){
		dictionary[kOrderCommentModelUpdated_at] = self.updated_at;
	}
	dictionary[kOrderCommentModelUser_id] = @(self.user_id);
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
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:kOrderCommentModelContent];
	}
	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kOrderCommentModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kOrderCommentModelDeleted_at];
	}
	[aCoder encodeObject:@(self.goods_id) forKey:kOrderCommentModelGoods_id];	[aCoder encodeObject:@(self.goods_ratings) forKey:kOrderCommentModelGoods_ratings];	if(self.head_pic != nil){
		[aCoder encodeObject:self.head_pic forKey:kOrderCommentModelHead_pic];
	}
	[aCoder encodeObject:@(self.idField) forKey:kOrderCommentModelIdField];	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:kOrderCommentModelImage];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kOrderCommentModelName];
	}
	[aCoder encodeObject:@(self.order_id) forKey:kOrderCommentModelOrder_id];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kOrderCommentModelUpdated_at];
	}
	[aCoder encodeObject:@(self.user_id) forKey:kOrderCommentModelUser_id];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.content = [aDecoder decodeObjectForKey:kOrderCommentModelContent];
	self.created_at = [aDecoder decodeObjectForKey:kOrderCommentModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kOrderCommentModelDeleted_at];
	self.goods_id = [[aDecoder decodeObjectForKey:kOrderCommentModelGoods_id] integerValue];
	self.goods_ratings = [[aDecoder decodeObjectForKey:kOrderCommentModelGoods_ratings] floatValue];
	self.head_pic = [aDecoder decodeObjectForKey:kOrderCommentModelHead_pic];
	self.idField = [[aDecoder decodeObjectForKey:kOrderCommentModelIdField] integerValue];
	self.image = [aDecoder decodeObjectForKey:kOrderCommentModelImage];
	self.name = [aDecoder decodeObjectForKey:kOrderCommentModelName];
	self.order_id = [[aDecoder decodeObjectForKey:kOrderCommentModelOrder_id] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kOrderCommentModelUpdated_at];
	self.user_id = [[aDecoder decodeObjectForKey:kOrderCommentModelUser_id] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	OrderCommentModel *copy = [OrderCommentModel new];

	copy.content = [self.content copy];
	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.goods_id = self.goods_id;
	copy.goods_ratings = self.goods_ratings;
	copy.head_pic = [self.head_pic copy];
	copy.idField = self.idField;
	copy.image = [self.image copy];
	copy.name = [self.name copy];
	copy.order_id = self.order_id;
	copy.updated_at = [self.updated_at copy];
	copy.user_id = self.user_id;

	return copy;
}
@end