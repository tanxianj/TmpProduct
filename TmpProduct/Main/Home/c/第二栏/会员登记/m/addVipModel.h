//
//	addVipModel.h

//  创建于 19/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addVipModel : NSObject

@property (nonatomic, strong) NSString * birthday;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * head_pic;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * sex;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
