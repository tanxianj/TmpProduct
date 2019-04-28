//
//	AddOneModel.h

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddOneModel : NSObject

@property (nonatomic, strong) NSString * amount;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * discount;
@property (nonatomic, strong) NSString * end_time;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * shop_id;
@property (nonatomic, strong) NSString * start_time;
@property (nonatomic, assign) NSInteger status;

/**
 1 店铺满减优惠
 2 电子优惠券
 */
@property (nonatomic, assign) NSInteger type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
