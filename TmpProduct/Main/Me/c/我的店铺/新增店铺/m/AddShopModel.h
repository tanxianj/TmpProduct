//
//	AddShopModel.h

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddShopModel : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * area;
@property (nonatomic, strong) NSString * area_name;
@property (nonatomic, strong) NSString * business_tag;
@property (nonatomic, strong) NSString * business_xkzz;
@property (nonatomic, strong) NSString * cate_id;
@property (nonatomic, strong) NSString * cate_id_name;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * city_name;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, strong) NSString * latitude;
@property (nonatomic, strong) NSString * longitude;
@property (nonatomic, strong) NSString * merchant_id;
@property (nonatomic, strong) NSString * province;
@property (nonatomic, strong) NSString * province_name;
@property (nonatomic, strong) NSString * service_hotline;
@property (nonatomic, strong) NSString * shop_img;
@property (nonatomic, strong) NSString * shop_name;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * start_time;
@property (nonatomic, strong) NSString * end_time;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
