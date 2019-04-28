//
//	FullReductionModel.h

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FullReductionModel : NSObject

@property (nonatomic, assign) NSInteger admin_id;
@property (nonatomic, strong) NSString * amount;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSObject * deleted_at;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * discount;
@property (nonatomic, strong) NSString * end_time;
@property (nonatomic, assign) NSInteger grant_num;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, assign) NSInteger limit_num;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger shop_id;
@property (nonatomic, strong) NSString * start_time;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString * updated_at;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
