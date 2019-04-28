//
//	GoodsCheckoutModel.h

//  创建于 19/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsCheckoutModel : NSObject

@property (nonatomic, strong) NSString * goods_id;
@property (nonatomic, strong) NSString * goods_name;
@property (nonatomic, strong) NSString * goods_num;
@property (nonatomic, strong) NSString * goods_price;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end