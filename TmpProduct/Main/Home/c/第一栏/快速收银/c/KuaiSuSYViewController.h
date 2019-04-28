//
//  FastCashRegisterViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ViewController.h"
#import "CouponCheckModel.h"
typedef enum : NSUInteger {
    FastCashRegisterTypeOne,//快速收银
    FastCashRegisterTypeTwo,//产品收银
} FastCashRegisterType;
@interface KuaiSuSYViewController : ViewController
@property (nonatomic, assign) FastCashRegisterType type;
@property (nonatomic, copy) NSArray <NSDictionary *> * goodsInfoArray;
@property (nonatomic, strong) CouponCheckModel * couponCheckModel;
@end
