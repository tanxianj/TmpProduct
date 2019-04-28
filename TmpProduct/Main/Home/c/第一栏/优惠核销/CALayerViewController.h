//
//  CALayerViewController.h
//  
//
//  Created by bang on 2018/1/23.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "ViewController.h"
#import "CouponCheckModel.h"

@interface CALayerViewController : ViewController
@property (nonatomic, assign) NSInteger saoMiaoType;//0:需要跳转到 快速收银 1：需要返回到 快速收银
@property (nonatomic, copy) void(^backCouponCheckModel) (CouponCheckModel * model);
@end
