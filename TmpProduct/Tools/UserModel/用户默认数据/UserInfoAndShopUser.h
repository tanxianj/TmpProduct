//
//	UserInfoAndShopUser.h

//  创建于 15/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoAndShopUser : NSObject

@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * deleted_at;
@property (nonatomic, strong) NSString * head_pic;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, assign) NSInteger inshop;
@property (nonatomic, assign) NSInteger is_merchant;
@property (nonatomic, strong) NSString * lastlogin_at;
@property (nonatomic, assign) NSInteger merchant_id;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * updated_at;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end