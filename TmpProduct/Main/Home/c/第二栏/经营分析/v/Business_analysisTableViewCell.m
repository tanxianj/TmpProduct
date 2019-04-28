//
//  Business_analysisTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "Business_analysisTableViewCell.h"
#import "TxjSelectTimeSlot.h"
#import "ZYCalendarView.h"
@interface Business_analysisTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *shop_name;

//数据预览
@property (weak, nonatomic) IBOutlet UILabel *order_total;
@property (weak, nonatomic) IBOutlet UILabel *order_total_money;
@property (weak, nonatomic) IBOutlet UILabel *order_offline_total;
@property (weak, nonatomic) IBOutlet UILabel *order_offline_money;
@property (weak, nonatomic) IBOutlet UILabel *order_online_total;
@property (weak, nonatomic) IBOutlet UILabel *order_online_money;
@property (weak, nonatomic) IBOutlet UILabel *order_refund_total;
@property (weak, nonatomic) IBOutlet UILabel *order_refund_money;
//
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_total;
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_money;
@property (weak, nonatomic) IBOutlet UILabel *online_pay_total;
@property (weak, nonatomic) IBOutlet UILabel *online_pay_money;

//订单统计
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_offline_cash_total;
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_offline_cash_money;
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_offline_bank_total;
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_offline_bank_money;
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_online_weixin_total;
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_online_weixin_money;
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_online_alipay_total;
@property (weak, nonatomic) IBOutlet UILabel *shop_pay_online_alipay_money;
@property (weak, nonatomic) IBOutlet UILabel *online_pay_online_weixin_total;
@property (weak, nonatomic) IBOutlet UILabel *online_pay_online_weixin_money;


//其他统计
@property (weak, nonatomic) IBOutlet UILabel *order_hexiao_total;
@property (weak, nonatomic) IBOutlet UILabel *order_hexiao_money;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray  * LabArray;

@property (weak, nonatomic) IBOutlet UILabel *tmpTimeLab;


@property (nonatomic, strong) UIButton * grayView;
@property (nonatomic,strong)ZYCalendarView *zyCalendarview;
@end
@implementation Business_analysisTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _shop_name.text = [NSString stringWithFormat:@"  %@",[UserInfoAndShopModel sharedUserModel].shop.shop_name];
}
-(void)setModel:(Business_analysisModel *)model{
    _model = model;
//    数据预览
    _order_total.text = [NSString stringWithFormat:@"%@",_model.order_total];
    _order_total_money.text = [NSString stringWithFormat:@"%.2f",_model.order_total_money];
    
    _order_offline_total.text = [NSString stringWithFormat:@"%@",_model.order_offline_total];
    _order_offline_money.text = [NSString stringWithFormat:@"%.2f",_model.order_offline_money];
    
    _order_online_total.text = [NSString stringWithFormat:@"%@",_model.order_online_total];
    _order_online_money.text = [NSString stringWithFormat:@"%.2f",_model.order_online_money];
    
    _order_refund_total.text = [NSString stringWithFormat:@"%@",_model.order_refund_total];
    _order_refund_money.text = [NSString stringWithFormat:@"%.2f",_model.order_refund_money];
//
    _shop_pay_total.text = [NSString stringWithFormat:@"%@",_model.shop_pay_total];
    _shop_pay_money.text = [NSString stringWithFormat:@"%.2f",_model.shop_pay_money];
    
    _online_pay_total.text = [NSString stringWithFormat:@"%@",_model.online_pay_total];
    _online_pay_money.text = [NSString stringWithFormat:@"%.2f",_model.online_pay_money];
//  订单统计
    _shop_pay_offline_cash_total.text = [NSString stringWithFormat:@"%@",_model.shop_pay_offline_cash_total];
    _shop_pay_offline_cash_money.text = [NSString stringWithFormat:@"%.2f",_model.shop_pay_offline_cash_money];
    
    _shop_pay_offline_bank_total.text = [NSString stringWithFormat:@"%@",_model.shop_pay_offline_bank_total];
    _shop_pay_offline_bank_money.text = [NSString stringWithFormat:@"%.2f",_model.shop_pay_offline_bank_money];
    
    _shop_pay_online_weixin_total.text = [NSString stringWithFormat:@"%@",_model.shop_pay_online_weixin_total];
    _shop_pay_online_weixin_money.text = [NSString stringWithFormat:@"%.2f",_model.shop_pay_online_weixin_money];
    
    _shop_pay_online_alipay_total.text = [NSString stringWithFormat:@"%@",_model.shop_pay_online_alipay_total];
    _shop_pay_online_alipay_money.text = [NSString stringWithFormat:@"%.2f",_model.shop_pay_online_alipay_money];
    
    _online_pay_online_weixin_total.text = [NSString stringWithFormat:@"%@",_model.online_pay_online_weixin_total];
    _online_pay_online_weixin_money.text = [NSString stringWithFormat:@"%.2f",_model.online_pay_online_weixin_money];
    _order_hexiao_total.text = [NSString stringWithFormat:@"%@",_model.order_hexiao_total];
    _order_hexiao_money.text = [NSString stringWithFormat:@"%.2f",_model.order_hexiao_money];
}
//今日数据
- (IBAction)date_type_todayBtnAction:(id)sender {
    [self ProtocolFunction:@"1" start_time:nil end_tiem:nil];
    
}
//本月数据
- (IBAction)date_type_monthBtnAction:(id)sender {
    [self ProtocolFunction:@"2" start_time:nil end_tiem:nil];
}
//选择时间
- (IBAction)selectTimeBtnAction:(id)sender {
    [TxjSelectTimeSlot showTxjSelectTimeSlot:^(NSString *start_time, NSString *end_time) {
        txjLog(@"cell 打印 %@  %@",start_time,end_time);
        [self ProtocolFunction:@"3" start_time:start_time end_tiem:end_time];
    }];
}
-(void)setDate_type:(NSString *)date_type{
    _date_type = date_type;
    for (UILabel *lab in self.LabArray) {
        lab.hidden = lab.tag == [_date_type integerValue]?NO:YES;
    }
    switch ([_date_type integerValue]) {
        case 1:{
            _tmpTimeLab.text = @"今日数据";
        }break;
        case 2:{
            _tmpTimeLab.text = @"本月数据";
        }break;
        case 3:{
            _tmpTimeLab.text = [NSString stringWithFormat:@"%@ - %@",self.tmpstart_time,self.tmpend_time];
        }break;
        default:
            break;
    }
}
-(void)setTmpstart_time:(NSString *)tmpstart_time{
    _tmpstart_time = tmpstart_time;
}
-(void)setTmpend_time:(NSString *)tmpend_time{
    _tmpend_time = tmpend_time;
}
-(void)ProtocolFunction:(NSString *)date_type start_time:(NSString *)start_time end_tiem:(NSString *)end_tiem{
    if (self.delegate && [self.delegate respondsToSelector:@selector(Business_analysisTableViewCell:start_time:end_tiem:)]) {
        [self.delegate Business_analysisTableViewCell:date_type start_time:start_time end_tiem:end_tiem];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
