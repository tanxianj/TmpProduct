//
//	CapitalFlowModel.h

//  创建于 17/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CapitalFlowModel : NSObject

@property (nonatomic, assign) CGFloat earnings;
@property (nonatomic, assign) CGFloat order_affirm_money;
@property (nonatomic, assign) CGFloat order_offline_total_money;
@property (nonatomic, assign) CGFloat order_online_total_money;
@property (nonatomic, assign) CGFloat order_total_money;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end