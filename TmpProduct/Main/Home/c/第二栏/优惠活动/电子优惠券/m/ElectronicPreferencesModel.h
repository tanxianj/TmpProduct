//
//	ElectronicPreferencesModel.h

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ElectronicPreferencesModel : NSObject

@property (nonatomic, assign) NSInteger admin_id;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSObject * deleted_at;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * end_time;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * money;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger provide_num;
@property (nonatomic, assign) NSInteger provide_type;
@property (nonatomic, assign) NSInteger sent_num;
@property (nonatomic, assign) NSInteger shop_id;
@property (nonatomic, strong) NSObject * shop_id_str;
@property (nonatomic, strong) NSString * shop_id_str_name;
@property (nonatomic, assign) NSInteger sort;
@property (nonatomic, strong) NSString * start_time;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString * updated_at;
@property (nonatomic, assign) NSInteger use_num;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
