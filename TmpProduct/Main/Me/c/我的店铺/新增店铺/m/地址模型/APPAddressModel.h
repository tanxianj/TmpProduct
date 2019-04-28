//
//	APPAddressModel.h

//  创建于 18/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPAddressModel : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * cityCode;
@property (nonatomic, strong) NSString * province;
@property (nonatomic, strong) NSString * provinceCode;
@property (nonatomic, strong) NSString * town;
@property (nonatomic, strong) NSString * townCode;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
