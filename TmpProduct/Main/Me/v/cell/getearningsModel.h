//
//	getearningsModel.h

//  创建于 23/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface getearningsModel : NSObject

@property (nonatomic, strong) NSString * count_earning;
@property (nonatomic, strong) NSString * today_earning;
@property (nonatomic, strong) NSString * yesterday_earning;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
+ (instancetype) sharedUserModel;
+(void)attempDealloc;
@end
