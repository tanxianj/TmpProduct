//
//  CapitalFlowHeaderView.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "CapitalFlowHeaderView.h"
#import "NSString+TimeString.h"
#import "WSDatePickerView.h"
#import "NSDate+Extension.h"
#import "TxjSelectTimeSlot.h"
@interface CapitalFlowHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *saixuan;
@property (weak, nonatomic) IBOutlet UILabel *order_online_money;
@property (weak, nonatomic) IBOutlet UILabel *remit_account;
@property (weak, nonatomic) IBOutlet UILabel *order_offline_money;

@end
@implementation CapitalFlowHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    
     NSString * start_time = [NSString getMonthFirstAndLastDayWith:[NSString getNowTimeYY_MM_DD]][0];
    NSString * end_time = [NSString getNowTimeYY_MM_DD];
//    NSArray *str = [NSString getMonthFirstAndLastDayWith:[NSString getNowTimeYY_MM_DD]];
    [self.saixuan setTitle:[NSString stringWithFormat:@"%@——%@",start_time,end_time] forState:UIControlStateNormal];
}
- (IBAction)shaixuanBnAction:(id)sender {
//    [TXJSelectDateView showDateViewWithMaxLimitDate:[NSDate date] Title:@"请选择筛选日期" DateStyle:DateStyleShowYearMonth completelp:^(NSString *dateString) {
//        txjLog(@"当前选择时间为%@",dateString);
//
//    }];
    [TxjSelectTimeSlot showTxjSelectTimeSlot:^(NSString *start_time, NSString *end_time) {
//        txjLog(@"当前选择时间为%@-----%@",start_time,end_time);
        [self.saixuan setTitle:[NSString stringWithFormat:@"%@——%@",start_time,end_time] forState:UIControlStateNormal];
        if ([self.delegate respondsToSelector:@selector(backSelectDateString:end_time:)]) {
            [self.delegate backSelectDateString:start_time end_time:end_time];
        }
    }];
}
-(void)setModel:(CapitalFlowSectionHeaderModel *)model{
    _model = model;
    _order_online_money.text = [NSString stringWithFormat:@"平台收入:￥%.2f",_model.order_online_money];
    _remit_account.text = [NSString stringWithFormat:@"平台划账:￥%.2f",_model.remit_account];
    _order_offline_money.text = [NSString stringWithFormat:@"现金收入:￥%.2f",_model.order_offline_money];
}
@end
