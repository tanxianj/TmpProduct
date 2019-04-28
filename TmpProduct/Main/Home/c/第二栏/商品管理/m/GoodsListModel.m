//
//	GoodsListModel.m

//  创建于 19/4/2019
//	Copyright © 2019. All rights reserved.




#import "GoodsListModel.h"

NSString *const kGoodsListModelAdmin_id = @"admin_id";
NSString *const kGoodsListModelCreated_at = @"created_at";
NSString *const kGoodsListModelDeleted_at = @"deleted_at";
NSString *const kGoodsListModelDiscount = @"discount";
NSString *const kGoodsListModelGoods_content = @"goods_content";
NSString *const kGoodsListModelGoods_desc = @"goods_desc";
NSString *const kGoodsListModelGoods_img = @"goods_img";
NSString *const kGoodsListModelGoods_img_f = @"goods_img_f";
NSString *const kGoodsListModelGoods_jm = @"goods_jm";
NSString *const kGoodsListModelGoods_name = @"goods_name";
NSString *const kGoodsListModelGoods_num = @"goods_num";
NSString *const kGoodsListModelGoods_price = @"goods_price";
NSString *const kGoodsListModelGoods_ratings = @"goods_ratings";
NSString *const kGoodsListModelGoods_sales = @"goods_sales";
NSString *const kGoodsListModelGoods_sn = @"goods_sn";
NSString *const kGoodsListModelGoods_tags = @"goods_tags";
NSString *const kGoodsListModelGoods_tags_name = @"goods_tags_name";
NSString *const kGoodsListModelGoods_tags_name_s = @"goods_tags_name_s";
NSString *const kGoodsListModelGoods_type = @"goods_type";
NSString *const kGoodsListModelIdField = @"id";
NSString *const kGoodsListModelIntegral_type = @"integral_type";
NSString *const kGoodsListModelIs_inventory = @"is_inventory";
NSString *const kGoodsListModelIs_on_sale = @"is_on_sale";
NSString *const kGoodsListModelIs_recommend = @"is_recommend";
NSString *const kGoodsListModelIs_yuyue = @"is_yuyue";
NSString *const kGoodsListModelOnline_price = @"online_price";
NSString *const kGoodsListModelPurchase_notes = @"purchase_notes";
NSString *const kGoodsListModelShop_id = @"shop_id";
NSString *const kGoodsListModelSort = @"sort";
NSString *const kGoodsListModelUnit = @"unit";
NSString *const kGoodsListModelUpdated_at = @"updated_at";

@interface GoodsListModel ()
@end
@implementation GoodsListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGoodsListModelAdmin_id] isKindOfClass:[NSNull class]]){
		self.admin_id = [dictionary[kGoodsListModelAdmin_id] integerValue];
	}

	if(![dictionary[kGoodsListModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kGoodsListModelCreated_at];
	}	
	if(![dictionary[kGoodsListModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kGoodsListModelDeleted_at];
	}	
	if(![dictionary[kGoodsListModelDiscount] isKindOfClass:[NSNull class]]){
		self.discount = dictionary[kGoodsListModelDiscount];
	}	
	if(![dictionary[kGoodsListModelGoods_content] isKindOfClass:[NSNull class]]){
		self.goods_content = dictionary[kGoodsListModelGoods_content];
	}	
	if(![dictionary[kGoodsListModelGoods_desc] isKindOfClass:[NSNull class]]){
		self.goods_desc = dictionary[kGoodsListModelGoods_desc];
	}	
	if(![dictionary[kGoodsListModelGoods_img] isKindOfClass:[NSNull class]]){
		self.goods_img = dictionary[kGoodsListModelGoods_img];
	}	
	if(![dictionary[kGoodsListModelGoods_img_f] isKindOfClass:[NSNull class]]){
		self.goods_img_f = dictionary[kGoodsListModelGoods_img_f];
	}	
	if(![dictionary[kGoodsListModelGoods_jm] isKindOfClass:[NSNull class]]){
		self.goods_jm = dictionary[kGoodsListModelGoods_jm];
	}	
	if(![dictionary[kGoodsListModelGoods_name] isKindOfClass:[NSNull class]]){
		self.goods_name = dictionary[kGoodsListModelGoods_name];
	}	
	if(![dictionary[kGoodsListModelGoods_num] isKindOfClass:[NSNull class]]){
		self.goods_num = [dictionary[kGoodsListModelGoods_num] integerValue];
	}

	if(![dictionary[kGoodsListModelGoods_price] isKindOfClass:[NSNull class]]){
		self.goods_price = dictionary[kGoodsListModelGoods_price];
	}	
	if(![dictionary[kGoodsListModelGoods_ratings] isKindOfClass:[NSNull class]]){
		self.goods_ratings = [dictionary[kGoodsListModelGoods_ratings] integerValue];
	}

	if(![dictionary[kGoodsListModelGoods_sales] isKindOfClass:[NSNull class]]){
		self.goods_sales = [dictionary[kGoodsListModelGoods_sales] integerValue];
	}

	if(![dictionary[kGoodsListModelGoods_sn] isKindOfClass:[NSNull class]]){
		self.goods_sn = dictionary[kGoodsListModelGoods_sn];
	}	
	if(![dictionary[kGoodsListModelGoods_tags] isKindOfClass:[NSNull class]]){
		self.goods_tags = dictionary[kGoodsListModelGoods_tags];
	}	
	if(![dictionary[kGoodsListModelGoods_tags_name] isKindOfClass:[NSNull class]]){
		self.goods_tags_name = dictionary[kGoodsListModelGoods_tags_name];
	}	
	if(![dictionary[kGoodsListModelGoods_tags_name_s] isKindOfClass:[NSNull class]]){
		self.goods_tags_name_s = dictionary[kGoodsListModelGoods_tags_name_s];
	}	
	if(![dictionary[kGoodsListModelGoods_type] isKindOfClass:[NSNull class]]){
		self.goods_type = [dictionary[kGoodsListModelGoods_type] integerValue];
	}

	if(![dictionary[kGoodsListModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kGoodsListModelIdField] integerValue];
	}

	if(![dictionary[kGoodsListModelIntegral_type] isKindOfClass:[NSNull class]]){
		self.integral_type = dictionary[kGoodsListModelIntegral_type];
	}	
	if(![dictionary[kGoodsListModelIs_inventory] isKindOfClass:[NSNull class]]){
		self.is_inventory = [dictionary[kGoodsListModelIs_inventory] integerValue];
	}

	if(![dictionary[kGoodsListModelIs_on_sale] isKindOfClass:[NSNull class]]){
		self.is_on_sale = [dictionary[kGoodsListModelIs_on_sale] integerValue];
	}

	if(![dictionary[kGoodsListModelIs_recommend] isKindOfClass:[NSNull class]]){
		self.is_recommend = [dictionary[kGoodsListModelIs_recommend] integerValue];
	}

	if(![dictionary[kGoodsListModelIs_yuyue] isKindOfClass:[NSNull class]]){
		self.is_yuyue = [dictionary[kGoodsListModelIs_yuyue] integerValue];
	}

	if(![dictionary[kGoodsListModelOnline_price] isKindOfClass:[NSNull class]]){
		self.online_price = dictionary[kGoodsListModelOnline_price];
	}	
	if(![dictionary[kGoodsListModelPurchase_notes] isKindOfClass:[NSNull class]]){
		self.purchase_notes = dictionary[kGoodsListModelPurchase_notes];
	}	
	if(![dictionary[kGoodsListModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = [dictionary[kGoodsListModelShop_id] integerValue];
	}

	if(![dictionary[kGoodsListModelSort] isKindOfClass:[NSNull class]]){
		self.sort = [dictionary[kGoodsListModelSort] integerValue];
	}

	if(![dictionary[kGoodsListModelUnit] isKindOfClass:[NSNull class]]){
		self.unit = [dictionary[kGoodsListModelUnit] integerValue];
	}

	if(![dictionary[kGoodsListModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kGoodsListModelUpdated_at];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kGoodsListModelAdmin_id] = @(self.admin_id);
	if(self.created_at != nil){
		dictionary[kGoodsListModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kGoodsListModelDeleted_at] = self.deleted_at;
	}
	if(self.discount != nil){
		dictionary[kGoodsListModelDiscount] = self.discount;
	}
	if(self.goods_content != nil){
		dictionary[kGoodsListModelGoods_content] = self.goods_content;
	}
	if(self.goods_desc != nil){
		dictionary[kGoodsListModelGoods_desc] = self.goods_desc;
	}
	if(self.goods_img != nil){
		dictionary[kGoodsListModelGoods_img] = self.goods_img;
	}
	if(self.goods_img_f != nil){
		dictionary[kGoodsListModelGoods_img_f] = self.goods_img_f;
	}
	if(self.goods_jm != nil){
		dictionary[kGoodsListModelGoods_jm] = self.goods_jm;
	}
	if(self.goods_name != nil){
		dictionary[kGoodsListModelGoods_name] = self.goods_name;
	}
	dictionary[kGoodsListModelGoods_num] = @(self.goods_num);
	if(self.goods_price != nil){
		dictionary[kGoodsListModelGoods_price] = self.goods_price;
	}
	dictionary[kGoodsListModelGoods_ratings] = @(self.goods_ratings);
	dictionary[kGoodsListModelGoods_sales] = @(self.goods_sales);
	if(self.goods_sn != nil){
		dictionary[kGoodsListModelGoods_sn] = self.goods_sn;
	}
	if(self.goods_tags != nil){
		dictionary[kGoodsListModelGoods_tags] = self.goods_tags;
	}
	if(self.goods_tags_name != nil){
		dictionary[kGoodsListModelGoods_tags_name] = self.goods_tags_name;
	}
	if(self.goods_tags_name_s != nil){
		dictionary[kGoodsListModelGoods_tags_name_s] = self.goods_tags_name_s;
	}
	dictionary[kGoodsListModelGoods_type] = @(self.goods_type);
	dictionary[kGoodsListModelIdField] = @(self.idField);
	if(self.integral_type != nil){
		dictionary[kGoodsListModelIntegral_type] = self.integral_type;
	}
	dictionary[kGoodsListModelIs_inventory] = @(self.is_inventory);
	dictionary[kGoodsListModelIs_on_sale] = @(self.is_on_sale);
	dictionary[kGoodsListModelIs_recommend] = @(self.is_recommend);
	dictionary[kGoodsListModelIs_yuyue] = @(self.is_yuyue);
	if(self.online_price != nil){
		dictionary[kGoodsListModelOnline_price] = self.online_price;
	}
	if(self.purchase_notes != nil){
		dictionary[kGoodsListModelPurchase_notes] = self.purchase_notes;
	}
	dictionary[kGoodsListModelShop_id] = @(self.shop_id);
	dictionary[kGoodsListModelSort] = @(self.sort);
	dictionary[kGoodsListModelUnit] = @(self.unit);
	if(self.updated_at != nil){
		dictionary[kGoodsListModelUpdated_at] = self.updated_at;
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
	[aCoder encodeObject:@(self.admin_id) forKey:kGoodsListModelAdmin_id];	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kGoodsListModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kGoodsListModelDeleted_at];
	}
	if(self.discount != nil){
		[aCoder encodeObject:self.discount forKey:kGoodsListModelDiscount];
	}
	if(self.goods_content != nil){
		[aCoder encodeObject:self.goods_content forKey:kGoodsListModelGoods_content];
	}
	if(self.goods_desc != nil){
		[aCoder encodeObject:self.goods_desc forKey:kGoodsListModelGoods_desc];
	}
	if(self.goods_img != nil){
		[aCoder encodeObject:self.goods_img forKey:kGoodsListModelGoods_img];
	}
	if(self.goods_img_f != nil){
		[aCoder encodeObject:self.goods_img_f forKey:kGoodsListModelGoods_img_f];
	}
	if(self.goods_jm != nil){
		[aCoder encodeObject:self.goods_jm forKey:kGoodsListModelGoods_jm];
	}
	if(self.goods_name != nil){
		[aCoder encodeObject:self.goods_name forKey:kGoodsListModelGoods_name];
	}
	[aCoder encodeObject:@(self.goods_num) forKey:kGoodsListModelGoods_num];	if(self.goods_price != nil){
		[aCoder encodeObject:self.goods_price forKey:kGoodsListModelGoods_price];
	}
	[aCoder encodeObject:@(self.goods_ratings) forKey:kGoodsListModelGoods_ratings];	[aCoder encodeObject:@(self.goods_sales) forKey:kGoodsListModelGoods_sales];	if(self.goods_sn != nil){
		[aCoder encodeObject:self.goods_sn forKey:kGoodsListModelGoods_sn];
	}
	if(self.goods_tags != nil){
		[aCoder encodeObject:self.goods_tags forKey:kGoodsListModelGoods_tags];
	}
	if(self.goods_tags_name != nil){
		[aCoder encodeObject:self.goods_tags_name forKey:kGoodsListModelGoods_tags_name];
	}
	if(self.goods_tags_name_s != nil){
		[aCoder encodeObject:self.goods_tags_name_s forKey:kGoodsListModelGoods_tags_name_s];
	}
	[aCoder encodeObject:@(self.goods_type) forKey:kGoodsListModelGoods_type];	[aCoder encodeObject:@(self.idField) forKey:kGoodsListModelIdField];	if(self.integral_type != nil){
		[aCoder encodeObject:self.integral_type forKey:kGoodsListModelIntegral_type];
	}
	[aCoder encodeObject:@(self.is_inventory) forKey:kGoodsListModelIs_inventory];	[aCoder encodeObject:@(self.is_on_sale) forKey:kGoodsListModelIs_on_sale];	[aCoder encodeObject:@(self.is_recommend) forKey:kGoodsListModelIs_recommend];	[aCoder encodeObject:@(self.is_yuyue) forKey:kGoodsListModelIs_yuyue];	if(self.online_price != nil){
		[aCoder encodeObject:self.online_price forKey:kGoodsListModelOnline_price];
	}
	if(self.purchase_notes != nil){
		[aCoder encodeObject:self.purchase_notes forKey:kGoodsListModelPurchase_notes];
	}
	[aCoder encodeObject:@(self.shop_id) forKey:kGoodsListModelShop_id];	[aCoder encodeObject:@(self.sort) forKey:kGoodsListModelSort];	[aCoder encodeObject:@(self.unit) forKey:kGoodsListModelUnit];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kGoodsListModelUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.admin_id = [[aDecoder decodeObjectForKey:kGoodsListModelAdmin_id] integerValue];
	self.created_at = [aDecoder decodeObjectForKey:kGoodsListModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kGoodsListModelDeleted_at];
	self.discount = [aDecoder decodeObjectForKey:kGoodsListModelDiscount];
	self.goods_content = [aDecoder decodeObjectForKey:kGoodsListModelGoods_content];
	self.goods_desc = [aDecoder decodeObjectForKey:kGoodsListModelGoods_desc];
	self.goods_img = [aDecoder decodeObjectForKey:kGoodsListModelGoods_img];
	self.goods_img_f = [aDecoder decodeObjectForKey:kGoodsListModelGoods_img_f];
	self.goods_jm = [aDecoder decodeObjectForKey:kGoodsListModelGoods_jm];
	self.goods_name = [aDecoder decodeObjectForKey:kGoodsListModelGoods_name];
	self.goods_num = [[aDecoder decodeObjectForKey:kGoodsListModelGoods_num] integerValue];
	self.goods_price = [aDecoder decodeObjectForKey:kGoodsListModelGoods_price];
	self.goods_ratings = [[aDecoder decodeObjectForKey:kGoodsListModelGoods_ratings] integerValue];
	self.goods_sales = [[aDecoder decodeObjectForKey:kGoodsListModelGoods_sales] integerValue];
	self.goods_sn = [aDecoder decodeObjectForKey:kGoodsListModelGoods_sn];
	self.goods_tags = [aDecoder decodeObjectForKey:kGoodsListModelGoods_tags];
	self.goods_tags_name = [aDecoder decodeObjectForKey:kGoodsListModelGoods_tags_name];
	self.goods_tags_name_s = [aDecoder decodeObjectForKey:kGoodsListModelGoods_tags_name_s];
	self.goods_type = [[aDecoder decodeObjectForKey:kGoodsListModelGoods_type] integerValue];
	self.idField = [[aDecoder decodeObjectForKey:kGoodsListModelIdField] integerValue];
	self.integral_type = [aDecoder decodeObjectForKey:kGoodsListModelIntegral_type];
	self.is_inventory = [[aDecoder decodeObjectForKey:kGoodsListModelIs_inventory] integerValue];
	self.is_on_sale = [[aDecoder decodeObjectForKey:kGoodsListModelIs_on_sale] integerValue];
	self.is_recommend = [[aDecoder decodeObjectForKey:kGoodsListModelIs_recommend] integerValue];
	self.is_yuyue = [[aDecoder decodeObjectForKey:kGoodsListModelIs_yuyue] integerValue];
	self.online_price = [aDecoder decodeObjectForKey:kGoodsListModelOnline_price];
	self.purchase_notes = [aDecoder decodeObjectForKey:kGoodsListModelPurchase_notes];
	self.shop_id = [[aDecoder decodeObjectForKey:kGoodsListModelShop_id] integerValue];
	self.sort = [[aDecoder decodeObjectForKey:kGoodsListModelSort] integerValue];
	self.unit = [[aDecoder decodeObjectForKey:kGoodsListModelUnit] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kGoodsListModelUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	GoodsListModel *copy = [GoodsListModel new];

	copy.admin_id = self.admin_id;
	copy.created_at = [self.created_at copy];
	copy.deleted_at = [self.deleted_at copy];
	copy.discount = [self.discount copy];
	copy.goods_content = [self.goods_content copy];
	copy.goods_desc = [self.goods_desc copy];
	copy.goods_img = [self.goods_img copy];
	copy.goods_img_f = [self.goods_img_f copy];
	copy.goods_jm = [self.goods_jm copy];
	copy.goods_name = [self.goods_name copy];
	copy.goods_num = self.goods_num;
	copy.goods_price = [self.goods_price copy];
	copy.goods_ratings = self.goods_ratings;
	copy.goods_sales = self.goods_sales;
	copy.goods_sn = [self.goods_sn copy];
	copy.goods_tags = [self.goods_tags copy];
	copy.goods_tags_name = [self.goods_tags_name copy];
	copy.goods_tags_name_s = [self.goods_tags_name_s copy];
	copy.goods_type = self.goods_type;
	copy.idField = self.idField;
	copy.integral_type = [self.integral_type copy];
	copy.is_inventory = self.is_inventory;
	copy.is_on_sale = self.is_on_sale;
	copy.is_recommend = self.is_recommend;
	copy.is_yuyue = self.is_yuyue;
	copy.online_price = [self.online_price copy];
	copy.purchase_notes = [self.purchase_notes copy];
	copy.shop_id = self.shop_id;
	copy.sort = self.sort;
	copy.unit = self.unit;
	copy.updated_at = [self.updated_at copy];

	return copy;
}
@end