//
//	CapitalFlowSectionHeaderModel.h

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CapitalFlowSectionHeaderModel : NSObject

@property (nonatomic, assign) CGFloat order_offline_money;
@property (nonatomic, assign) CGFloat order_online_money;
@property (nonatomic, assign) CGFloat remit_account;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end