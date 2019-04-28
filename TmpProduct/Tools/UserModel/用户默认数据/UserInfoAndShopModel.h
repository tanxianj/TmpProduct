//
//	UserInfoAndShopModel.h

//  创建于 15/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoAndShopShop.h"
#import "UserInfoAndShopUser.h"

@interface UserInfoAndShopModel : NSObject

@property (nonatomic, strong) UserInfoAndShopShop * shop;
@property (nonatomic, strong) UserInfoAndShopUser * user;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
+ (instancetype)sharedUserModel;
+(void)attempDealloc;
@end
