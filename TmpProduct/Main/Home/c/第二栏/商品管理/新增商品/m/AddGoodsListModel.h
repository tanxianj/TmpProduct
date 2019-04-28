//
//	AddGoodsListModel.h

//  创建于 19/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddGoodsListModel : NSObject

@property (nonatomic, assign) NSInteger admin_id;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * deleted_at;
@property (nonatomic, strong) NSString * discount;
@property (nonatomic, strong) NSString * goods_content;
@property (nonatomic, strong) NSString * goods_desc;
@property (nonatomic, strong) NSString * goods_img;
@property (nonatomic, strong) NSString * goods_img_f;
@property (nonatomic, strong) NSString * goods_jm;
@property (nonatomic, strong) NSString * goods_name;
@property (nonatomic, strong) NSString * goods_num;
@property (nonatomic, strong) NSString * goods_price;
@property (nonatomic, assign) NSInteger goods_ratings;
@property (nonatomic, assign) NSInteger goods_sales;
@property (nonatomic, strong) NSString * goods_sn;
@property (nonatomic, strong) NSString * goods_tags;
@property (nonatomic, strong) NSString * goods_tags_name;
@property (nonatomic, strong) NSString * goods_tags_name_s;
@property (nonatomic, assign) NSInteger goods_type;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * integral_type;
@property (nonatomic, assign) NSInteger is_inventory;
@property (nonatomic, assign) NSInteger is_on_sale;
@property (nonatomic, assign) NSInteger is_recommend;
@property (nonatomic, assign) NSInteger is_yuyue;
@property (nonatomic, strong) NSString * online_price;
@property (nonatomic, strong) NSString * purchase_notes;
@property (nonatomic, strong) NSString * shop_id;
@property (nonatomic, assign) NSInteger sort;
@property (nonatomic, assign) NSInteger unit;
@property (nonatomic, strong) NSString * updated_at;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
