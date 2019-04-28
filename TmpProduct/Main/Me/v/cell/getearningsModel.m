//
//	getearningsModel.m

//  创建于 23/4/2019
//	Copyright © 2019. All rights reserved.




#import "getearningsModel.h"
#import "LocalDataTool.h"

NSString *const kgetearningsModelCount_earning = @"count_earning";
NSString *const kgetearningsModelToday_earning = @"today_earning";
NSString *const kgetearningsModelYesterday_earning = @"yesterday_earning";

@interface getearningsModel ()
@end
static getearningsModel *model;
static dispatch_once_t onceToken;
@implementation getearningsModel


#pragma mark -
+ (instancetype)sharedUserModel {
    dispatch_once(&onceToken, ^{
        NSDictionary *keepUserInfo = [LocalDataTool readgetearnings];
        if (keepUserInfo) {
            model = [[getearningsModel alloc]initWithDictionary:keepUserInfo];
        }
        else {
            model = [[getearningsModel alloc] init];
        }
    });
    return model;
}
+(void)attempDealloc{
    onceToken = 0;// 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    model = nil;
}


/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kgetearningsModelCount_earning] isKindOfClass:[NSNull class]]){
		self.count_earning = dictionary[kgetearningsModelCount_earning];
	}	
	if(![dictionary[kgetearningsModelToday_earning] isKindOfClass:[NSNull class]]){
		self.today_earning = dictionary[kgetearningsModelToday_earning];
	}	
	if(![dictionary[kgetearningsModelYesterday_earning] isKindOfClass:[NSNull class]]){
		self.yesterday_earning = dictionary[kgetearningsModelYesterday_earning];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.count_earning != nil){
		dictionary[kgetearningsModelCount_earning] = self.count_earning;
	}
	if(self.today_earning != nil){
		dictionary[kgetearningsModelToday_earning] = self.today_earning;
	}
	if(self.yesterday_earning != nil){
		dictionary[kgetearningsModelYesterday_earning] = self.yesterday_earning;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.count_earning != nil){
		[aCoder encodeObject:self.count_earning forKey:kgetearningsModelCount_earning];
	}
	if(self.today_earning != nil){
		[aCoder encodeObject:self.today_earning forKey:kgetearningsModelToday_earning];
	}
	if(self.yesterday_earning != nil){
		[aCoder encodeObject:self.yesterday_earning forKey:kgetearningsModelYesterday_earning];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.count_earning = [aDecoder decodeObjectForKey:kgetearningsModelCount_earning];
	self.today_earning = [aDecoder decodeObjectForKey:kgetearningsModelToday_earning];
	self.yesterday_earning = [aDecoder decodeObjectForKey:kgetearningsModelYesterday_earning];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	getearningsModel *copy = [getearningsModel new];

	copy.count_earning = [self.count_earning copy];
	copy.today_earning = [self.today_earning copy];
	copy.yesterday_earning = [self.yesterday_earning copy];

	return copy;
}
@end
