//
//	CouponCheckModel.h

//  创建于 20/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponCheckModel : NSObject

@property (nonatomic, assign) NSInteger cid;
@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSObject * deleted_at;
@property (nonatomic, assign) NSInteger get_order_id;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * money;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger order_id;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString * updated_at;
@property (nonatomic, strong) NSObject * use_time;
@property (nonatomic, assign) NSInteger user_id;
@property (nonatomic, strong) NSString * username;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end