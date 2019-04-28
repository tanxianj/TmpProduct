//
//	UserShop.h

//  创建于 12/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserShop : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, assign) NSInteger area;
@property (nonatomic, strong) NSString * area_name;
@property (nonatomic, strong) NSString * business_tag;
@property (nonatomic, strong) NSArray * business_tag_name;
@property (nonatomic, strong) NSString * business_xkzz;
@property (nonatomic, assign) NSInteger cate_id;
@property (nonatomic, strong) NSString * cate_id_name;
@property (nonatomic, assign) NSInteger city;
@property (nonatomic, strong) NSString * city_name;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * deleted_at;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, strong) NSString * earnings;
@property (nonatomic, strong) NSString * end_time;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * latitude;
@property (nonatomic, strong) NSString * longitude;
@property (nonatomic, strong) NSString * merchant_id;
@property (nonatomic, assign) NSInteger province;
@property (nonatomic, strong) NSString * province_name;
@property (nonatomic, strong) NSString * service_hotline;
@property (nonatomic, strong) NSArray * shop_img;
@property (nonatomic, strong) NSString * shop_name;
@property (nonatomic, assign) NSInteger shop_ratings;
@property (nonatomic, strong) NSString * start_time;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * updated_at;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
