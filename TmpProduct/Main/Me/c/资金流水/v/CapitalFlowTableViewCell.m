//
//  CapitalFlowTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "CapitalFlowTableViewCell.h"
#import "NSString+TimeString.h"
@interface CapitalFlowTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *order_sn;
@property (weak, nonatomic) IBOutlet UILabel *pay_name;
@property (weak, nonatomic) IBOutlet UILabel *pay_time;

@property (weak, nonatomic) IBOutlet UILabel *order_money;

@end
@implementation CapitalFlowTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(CapitalFlowListModel *)model{
    _model = model;
    _order_sn.text = _model.order_sn;
    _pay_name.text = _model.pay_name;
    _pay_time.text = [NSString friendTime:_model.pay_time];
    _order_money.text = [NSString stringWithFormat:@"+%@",_model.order_money];
    if ([_model.order_money floatValue]<=0) {
        _order_money.textColor = UIColor.appRedColor;
    }else{
        _order_money.textColor = UIColor.appGreenColor;
    }
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
