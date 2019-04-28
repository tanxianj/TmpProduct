//
//  CapitalFlowHeaderView.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CapitalFlowSectionHeaderModel.h"
@protocol CapitalFlowHeaderViewDelegate <NSObject>
-(void)backSelectDateString:(NSString *)start_time end_time:(NSString *)end_time;
@end
@interface CapitalFlowHeaderView : UIView
@property (nonatomic, weak) id <CapitalFlowHeaderViewDelegate> delegate;
@property (nonatomic, strong) CapitalFlowSectionHeaderModel * model;
@end
