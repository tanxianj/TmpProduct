//
//	AddGoodsListModel.m

//  创建于 19/4/2019
//	Copyright © 2019. All rights reserved.




#import "AddGoodsListModel.h"

NSString *const kAddGoodsListModelAdmin_id = @"admin_id";
NSString *const kAddGoodsListModelCreated_at = @"created_at";
NSString *const kAddGoodsListModelDeleted_at = @"deleted_at";
NSString *const kAddGoodsListModelDiscount = @"discount";
NSString *const kAddGoodsListModelGoods_content = @"goods_content";
NSString *const kAddGoodsListModelGoods_desc = @"goods_desc";
NSString *const kAddGoodsListModelGoods_img = @"goods_img";
NSString *const kAddGoodsListModelGoods_img_f = @"goods_img_f";
NSString *const kAddGoodsListModelGoods_jm = @"goods_jm";
NSString *const kAddGoodsListModelGoods_name = @"goods_name";
NSString *const kAddGoodsListModelGoods_num = @"goods_num";
NSString *const kAddGoodsListModelGoods_price = @"goods_price";
NSString *const kAddGoodsListModelGoods_ratings = @"goods_ratings";
NSString *const kAddGoodsListModelGoods_sales = @"goods_sales";
NSString *const kAddGoodsListModelGoods_sn = @"goods_sn";
NSString *const kAddGoodsListModelGoods_tags = @"goods_tags";
NSString *const kAddGoodsListModelGoods_tags_name = @"goods_tags_name";
NSString *const kAddGoodsListModelGoods_tags_name_s = @"goods_tags_name_s";
NSString *const kAddGoodsListModelGoods_type = @"goods_type";
NSString *const kAddGoodsListModelIdField = @"id";
NSString *const kAddGoodsListModelIntegral_type = @"integral_type";
NSString *const kAddGoodsListModelIs_inventory = @"is_inventory";
NSString *const kAddGoodsListModelIs_on_sale = @"is_on_sale";
NSString *const kAddGoodsListModelIs_recommend = @"is_recommend";
NSString *const kAddGoodsListModelIs_yuyue = @"is_yuyue";
NSString *const kAddGoodsListModelOnline_price = @"online_price";
NSString *const kAddGoodsListModelPurchase_notes = @"purchase_notes";
NSString *const kAddGoodsListModelShop_id = @"shop_id";
NSString *const kAddGoodsListModelSort = @"sort";
NSString *const kAddGoodsListModelUnit = @"unit";
NSString *const kAddGoodsListModelUpdated_at = @"updated_at";

@interface AddGoodsListModel ()
@end
@implementation AddGoodsListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kAddGoodsListModelAdmin_id] isKindOfClass:[NSNull class]]){
		self.admin_id = [dictionary[kAddGoodsListModelAdmin_id] integerValue];
	}

	if(![dictionary[kAddGoodsListModelCreated_at] isKindOfClass:[NSNull class]]){
		self.created_at = dictionary[kAddGoodsListModelCreated_at];
	}	
	if(![dictionary[kAddGoodsListModelDeleted_at] isKindOfClass:[NSNull class]]){
		self.deleted_at = dictionary[kAddGoodsListModelDeleted_at];
	}	
	if(![dictionary[kAddGoodsListModelDiscount] isKindOfClass:[NSNull class]]){
		self.discount = dictionary[kAddGoodsListModelDiscount];
	}	
	if(![dictionary[kAddGoodsListModelGoods_content] isKindOfClass:[NSNull class]]){
		self.goods_content = dictionary[kAddGoodsListModelGoods_content];
	}	
	if(![dictionary[kAddGoodsListModelGoods_desc] isKindOfClass:[NSNull class]]){
		self.goods_desc = dictionary[kAddGoodsListModelGoods_desc];
	}	
	if(![dictionary[kAddGoodsListModelGoods_img] isKindOfClass:[NSNull class]]){
		self.goods_img = dictionary[kAddGoodsListModelGoods_img];
	}	
	if(![dictionary[kAddGoodsListModelGoods_img_f] isKindOfClass:[NSNull class]]){
		self.goods_img_f = dictionary[kAddGoodsListModelGoods_img_f];
	}	
	if(![dictionary[kAddGoodsListModelGoods_jm] isKindOfClass:[NSNull class]]){
		self.goods_jm = dictionary[kAddGoodsListModelGoods_jm];
	}	
	if(![dictionary[kAddGoodsListModelGoods_name] isKindOfClass:[NSNull class]]){
		self.goods_name = dictionary[kAddGoodsListModelGoods_name];
	}	
	if(![dictionary[kAddGoodsListModelGoods_num] isKindOfClass:[NSNull class]]){
		self.goods_num = dictionary[kAddGoodsListModelGoods_num];
	}	
	if(![dictionary[kAddGoodsListModelGoods_price] isKindOfClass:[NSNull class]]){
		self.goods_price = dictionary[kAddGoodsListModelGoods_price];
	}	
	if(![dictionary[kAddGoodsListModelGoods_ratings] isKindOfClass:[NSNull class]]){
		self.goods_ratings = [dictionary[kAddGoodsListModelGoods_ratings] integerValue];
	}

	if(![dictionary[kAddGoodsListModelGoods_sales] isKindOfClass:[NSNull class]]){
		self.goods_sales = [dictionary[kAddGoodsListModelGoods_sales] integerValue];
	}

	if(![dictionary[kAddGoodsListModelGoods_sn] isKindOfClass:[NSNull class]]){
		self.goods_sn = dictionary[kAddGoodsListModelGoods_sn];
	}	
	if(![dictionary[kAddGoodsListModelGoods_tags] isKindOfClass:[NSNull class]]){
		self.goods_tags = dictionary[kAddGoodsListModelGoods_tags];
	}	
	if(![dictionary[kAddGoodsListModelGoods_tags_name] isKindOfClass:[NSNull class]]){
		self.goods_tags_name = dictionary[kAddGoodsListModelGoods_tags_name];
	}	
	if(![dictionary[kAddGoodsListModelGoods_tags_name_s] isKindOfClass:[NSNull class]]){
		self.goods_tags_name_s = dictionary[kAddGoodsListModelGoods_tags_name_s];
	}	
	if(![dictionary[kAddGoodsListModelGoods_type] isKindOfClass:[NSNull class]]){
		self.goods_type = [dictionary[kAddGoodsListModelGoods_type] integerValue];
	}

	if(![dictionary[kAddGoodsListModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kAddGoodsListModelIdField];
	}

	if(![dictionary[kAddGoodsListModelIntegral_type] isKindOfClass:[NSNull class]]){
		self.integral_type = dictionary[kAddGoodsListModelIntegral_type];
	}	
	if(![dictionary[kAddGoodsListModelIs_inventory] isKindOfClass:[NSNull class]]){
		self.is_inventory = [dictionary[kAddGoodsListModelIs_inventory] integerValue];
	}

	if(![dictionary[kAddGoodsListModelIs_on_sale] isKindOfClass:[NSNull class]]){
		self.is_on_sale = [dictionary[kAddGoodsListModelIs_on_sale] integerValue];
	}

	if(![dictionary[kAddGoodsListModelIs_recommend] isKindOfClass:[NSNull class]]){
		self.is_recommend = [dictionary[kAddGoodsListModelIs_recommend] integerValue];
	}

	if(![dictionary[kAddGoodsListModelIs_yuyue] isKindOfClass:[NSNull class]]){
		self.is_yuyue = [dictionary[kAddGoodsListModelIs_yuyue] integerValue];
	}

	if(![dictionary[kAddGoodsListModelOnline_price] isKindOfClass:[NSNull class]]){
		self.online_price = dictionary[kAddGoodsListModelOnline_price];
	}	
	if(![dictionary[kAddGoodsListModelPurchase_notes] isKindOfClass:[NSNull class]]){
		self.purchase_notes = dictionary[kAddGoodsListModelPurchase_notes];
	}	
	if(![dictionary[kAddGoodsListModelShop_id] isKindOfClass:[NSNull class]]){
		self.shop_id = dictionary[kAddGoodsListModelShop_id];
	}

	if(![dictionary[kAddGoodsListModelSort] isKindOfClass:[NSNull class]]){
		self.sort = [dictionary[kAddGoodsListModelSort] integerValue];
	}

	if(![dictionary[kAddGoodsListModelUnit] isKindOfClass:[NSNull class]]){
		self.unit = [dictionary[kAddGoodsListModelUnit] integerValue];
	}

	if(![dictionary[kAddGoodsListModelUpdated_at] isKindOfClass:[NSNull class]]){
		self.updated_at = dictionary[kAddGoodsListModelUpdated_at];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kAddGoodsListModelAdmin_id] = @(self.admin_id);
	if(self.created_at != nil){
		dictionary[kAddGoodsListModelCreated_at] = self.created_at;
	}
	if(self.deleted_at != nil){
		dictionary[kAddGoodsListModelDeleted_at] = self.deleted_at;
	}
	if(self.discount != nil){
		dictionary[kAddGoodsListModelDiscount] = self.discount;
	}
	if(self.goods_content != nil){
		dictionary[kAddGoodsListModelGoods_content] = self.goods_content;
	}
	if(self.goods_desc != nil){
		dictionary[kAddGoodsListModelGoods_desc] = self.goods_desc;
	}
	if(self.goods_img != nil){
		dictionary[kAddGoodsListModelGoods_img] = self.goods_img;
	}
	if(self.goods_img_f != nil){
		dictionary[kAddGoodsListModelGoods_img_f] = self.goods_img_f;
	}
	if(self.goods_jm != nil){
		dictionary[kAddGoodsListModelGoods_jm] = self.goods_jm;
	}
	if(self.goods_name != nil){
		dictionary[kAddGoodsListModelGoods_name] = self.goods_name;
	}
	if(self.goods_num != nil){
		dictionary[kAddGoodsListModelGoods_num] = self.goods_num;
	}
	if(self.goods_price != nil){
		dictionary[kAddGoodsListModelGoods_price] = self.goods_price;
	}
	dictionary[kAddGoodsListModelGoods_ratings] = @(self.goods_ratings);
	dictionary[kAddGoodsListModelGoods_sales] = @(self.goods_sales);
	if(self.goods_sn != nil){
		dictionary[kAddGoodsListModelGoods_sn] = self.goods_sn;
	}
	if(self.goods_tags != nil){
		dictionary[kAddGoodsListModelGoods_tags] = self.goods_tags;
	}
	if(self.goods_tags_name != nil){
		dictionary[kAddGoodsListModelGoods_tags_name] = self.goods_tags_name;
	}
	if(self.goods_tags_name_s != nil){
		dictionary[kAddGoodsListModelGoods_tags_name_s] = self.goods_tags_name_s;
	}
	dictionary[kAddGoodsListModelGoods_type] = @(self.goods_type);
	dictionary[kAddGoodsListModelIdField] = self.idField;
	if(self.integral_type != nil){
		dictionary[kAddGoodsListModelIntegral_type] = self.integral_type;
	}
	dictionary[kAddGoodsListModelIs_inventory] = @(self.is_inventory);
	dictionary[kAddGoodsListModelIs_on_sale] = @(self.is_on_sale);
	dictionary[kAddGoodsListModelIs_recommend] = @(self.is_recommend);
	dictionary[kAddGoodsListModelIs_yuyue] = @(self.is_yuyue);
	if(self.online_price != nil){
		dictionary[kAddGoodsListModelOnline_price] = self.online_price;
	}
	if(self.purchase_notes != nil){
		dictionary[kAddGoodsListModelPurchase_notes] = self.purchase_notes;
	}
	dictionary[kAddGoodsListModelShop_id] = self.shop_id;
	dictionary[kAddGoodsListModelSort] = @(self.sort);
	dictionary[kAddGoodsListModelUnit] = @(self.unit);
	if(self.updated_at != nil){
		dictionary[kAddGoodsListModelUpdated_at] = self.updated_at;
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
	[aCoder encodeObject:@(self.admin_id) forKey:kAddGoodsListModelAdmin_id];	if(self.created_at != nil){
		[aCoder encodeObject:self.created_at forKey:kAddGoodsListModelCreated_at];
	}
	if(self.deleted_at != nil){
		[aCoder encodeObject:self.deleted_at forKey:kAddGoodsListModelDeleted_at];
	}
	if(self.discount != nil){
		[aCoder encodeObject:self.discount forKey:kAddGoodsListModelDiscount];
	}
	if(self.goods_content != nil){
		[aCoder encodeObject:self.goods_content forKey:kAddGoodsListModelGoods_content];
	}
	if(self.goods_desc != nil){
		[aCoder encodeObject:self.goods_desc forKey:kAddGoodsListModelGoods_desc];
	}
	if(self.goods_img != nil){
		[aCoder encodeObject:self.goods_img forKey:kAddGoodsListModelGoods_img];
	}
	if(self.goods_img_f != nil){
		[aCoder encodeObject:self.goods_img_f forKey:kAddGoodsListModelGoods_img_f];
	}
	if(self.goods_jm != nil){
		[aCoder encodeObject:self.goods_jm forKey:kAddGoodsListModelGoods_jm];
	}
	if(self.goods_name != nil){
		[aCoder encodeObject:self.goods_name forKey:kAddGoodsListModelGoods_name];
	}
	if(self.goods_num != nil){
		[aCoder encodeObject:self.goods_num forKey:kAddGoodsListModelGoods_num];
	}
	if(self.goods_price != nil){
		[aCoder encodeObject:self.goods_price forKey:kAddGoodsListModelGoods_price];
	}
	[aCoder encodeObject:@(self.goods_ratings) forKey:kAddGoodsListModelGoods_ratings];	[aCoder encodeObject:@(self.goods_sales) forKey:kAddGoodsListModelGoods_sales];	if(self.goods_sn != nil){
		[aCoder encodeObject:self.goods_sn forKey:kAddGoodsListModelGoods_sn];
	}
	if(self.goods_tags != nil){
		[aCoder encodeObject:self.goods_tags forKey:kAddGoodsListModelGoods_tags];
	}
	if(self.goods_tags_name != nil){
		[aCoder encodeObject:self.goods_tags_name forKey:kAddGoodsListModelGoods_tags_name];
	}
	if(self.goods_tags_name_s != nil){
		[aCoder encodeObject:self.goods_tags_name_s forKey:kAddGoodsListModelGoods_tags_name_s];
	}
	[aCoder encodeObject:@(self.goods_type) forKey:kAddGoodsListModelGoods_type];
    [aCoder encodeObject:self.idField forKey:kAddGoodsListModelIdField];	if(self.integral_type != nil){
		[aCoder encodeObject:self.integral_type forKey:kAddGoodsListModelIntegral_type];
	}
	[aCoder encodeObject:@(self.is_inventory) forKey:kAddGoodsListModelIs_inventory];	[aCoder encodeObject:@(self.is_on_sale) forKey:kAddGoodsListModelIs_on_sale];	[aCoder encodeObject:@(self.is_recommend) forKey:kAddGoodsListModelIs_recommend];	[aCoder encodeObject:@(self.is_yuyue) forKey:kAddGoodsListModelIs_yuyue];	if(self.online_price != nil){
		[aCoder encodeObject:self.online_price forKey:kAddGoodsListModelOnline_price];
	}
	if(self.purchase_notes != nil){
		[aCoder encodeObject:self.purchase_notes forKey:kAddGoodsListModelPurchase_notes];
	}
	[aCoder encodeObject:self.shop_id forKey:kAddGoodsListModelShop_id];	[aCoder encodeObject:@(self.sort) forKey:kAddGoodsListModelSort];	[aCoder encodeObject:@(self.unit) forKey:kAddGoodsListModelUnit];	if(self.updated_at != nil){
		[aCoder encodeObject:self.updated_at forKey:kAddGoodsListModelUpdated_at];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.admin_id = [[aDecoder decodeObjectForKey:kAddGoodsListModelAdmin_id] integerValue];
	self.created_at = [aDecoder decodeObjectForKey:kAddGoodsListModelCreated_at];
	self.deleted_at = [aDecoder decodeObjectForKey:kAddGoodsListModelDeleted_at];
	self.discount = [aDecoder decodeObjectForKey:kAddGoodsListModelDiscount];
	self.goods_content = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_content];
	self.goods_desc = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_desc];
	self.goods_img = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_img];
	self.goods_img_f = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_img_f];
	self.goods_jm = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_jm];
	self.goods_name = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_name];
	self.goods_num = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_num];
	self.goods_price = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_price];
	self.goods_ratings = [[aDecoder decodeObjectForKey:kAddGoodsListModelGoods_ratings] integerValue];
	self.goods_sales = [[aDecoder decodeObjectForKey:kAddGoodsListModelGoods_sales] integerValue];
	self.goods_sn = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_sn];
	self.goods_tags = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_tags];
	self.goods_tags_name = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_tags_name];
	self.goods_tags_name_s = [aDecoder decodeObjectForKey:kAddGoodsListModelGoods_tags_name_s];
	self.goods_type = [[aDecoder decodeObjectForKey:kAddGoodsListModelGoods_type] integerValue];
	self.idField = [aDecoder decodeObjectForKey:kAddGoodsListModelIdField];
	self.integral_type = [aDecoder decodeObjectForKey:kAddGoodsListModelIntegral_type];
	self.is_inventory = [[aDecoder decodeObjectForKey:kAddGoodsListModelIs_inventory] integerValue];
	self.is_on_sale = [[aDecoder decodeObjectForKey:kAddGoodsListModelIs_on_sale] integerValue];
	self.is_recommend = [[aDecoder decodeObjectForKey:kAddGoodsListModelIs_recommend] integerValue];
	self.is_yuyue = [[aDecoder decodeObjectForKey:kAddGoodsListModelIs_yuyue] integerValue];
	self.online_price = [aDecoder decodeObjectForKey:kAddGoodsListModelOnline_price];
	self.purchase_notes = [aDecoder decodeObjectForKey:kAddGoodsListModelPurchase_notes];
	self.shop_id = [aDecoder decodeObjectForKey:kAddGoodsListModelShop_id];
	self.sort = [[aDecoder decodeObjectForKey:kAddGoodsListModelSort] integerValue];
	self.unit = [[aDecoder decodeObjectForKey:kAddGoodsListModelUnit] integerValue];
	self.updated_at = [aDecoder decodeObjectForKey:kAddGoodsListModelUpdated_at];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	AddGoodsListModel *copy = [AddGoodsListModel new];

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
	copy.goods_num = [self.goods_num copy];
	copy.goods_price = [self.goods_price copy];
	copy.goods_ratings = self.goods_ratings;
	copy.goods_sales = self.goods_sales;
	copy.goods_sn = [self.goods_sn copy];
	copy.goods_tags = [self.goods_tags copy];
	copy.goods_tags_name = [self.goods_tags_name copy];
	copy.goods_tags_name_s = [self.goods_tags_name_s copy];
	copy.goods_type = self.goods_type;
	copy.idField = [self.idField copy];
	copy.integral_type = [self.integral_type copy];
	copy.is_inventory = self.is_inventory;
	copy.is_on_sale = self.is_on_sale;
	copy.is_recommend = self.is_recommend;
	copy.is_yuyue = self.is_yuyue;
	copy.online_price = [self.online_price copy];
	copy.purchase_notes = [self.purchase_notes copy];
	copy.shop_id = [self.shop_id copy];
	copy.sort = self.sort;
	copy.unit = self.unit;
	copy.updated_at = [self.updated_at copy];

	return copy;
}
@end
