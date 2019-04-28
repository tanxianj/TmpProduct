//
//	AddShopTageModel.h

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddShopTageModel : NSObject

@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * label_color;
@property (nonatomic, strong) NSString * label_name;
@property (nonatomic, assign) NSInteger type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end