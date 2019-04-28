//
//	AddMyStaffModel.h

//  创建于 22/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMyStaffModel : NSObject

@property (nonatomic, strong) NSString * head_pic;
@property (nonatomic, assign) NSInteger merchant_id;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSString * shop_id;
@property (nonatomic, assign) NSInteger status;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end