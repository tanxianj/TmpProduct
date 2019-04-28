//
//	Business_analysisModel.h

//  创建于 21/4/2019
//	Copyright © 2019. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Business_analysisModel : NSObject

@property (nonatomic, assign) CGFloat online_pay_money;
@property (nonatomic, assign) CGFloat online_pay_online_weixin_money;
@property (nonatomic, strong) NSString * online_pay_online_weixin_total;
@property (nonatomic, strong) NSString * online_pay_total;
@property (nonatomic, assign) CGFloat order_hexiao_money;
@property (nonatomic, strong) NSString * order_hexiao_total;
@property (nonatomic, assign) CGFloat order_offline_money;
@property (nonatomic, strong) NSString * order_offline_total;
@property (nonatomic, assign) CGFloat order_online_money;
@property (nonatomic, strong) NSString * order_online_total;
@property (nonatomic, assign) CGFloat order_refund_money;
@property (nonatomic, strong) NSString * order_refund_total;
@property (nonatomic, strong) NSString * order_total;
@property (nonatomic, assign) CGFloat order_total_money;
@property (nonatomic, assign) CGFloat shop_pay_money;
@property (nonatomic, assign) CGFloat shop_pay_offline_bank_money;
@property (nonatomic, strong) NSString * shop_pay_offline_bank_total;
@property (nonatomic, assign) CGFloat shop_pay_offline_cash_money;
@property (nonatomic, strong) NSString * shop_pay_offline_cash_total;
@property (nonatomic, assign) CGFloat shop_pay_online_alipay_money;
@property (nonatomic, strong) NSString * shop_pay_online_alipay_total;
@property (nonatomic, assign) CGFloat shop_pay_online_weixin_money;
@property (nonatomic, strong) NSString * shop_pay_online_weixin_total;
@property (nonatomic, strong) NSString * shop_pay_total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end