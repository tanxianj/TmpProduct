//
//  CapitalFlowSectionHeaderView.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "CapitalFlowSectionHeaderView.h"
#import "UIView+LSCore.h"
@interface CapitalFlowSectionHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *order_total_money;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UILabel *earnings;
@property (weak, nonatomic) IBOutlet UILabel *order_online_total_money;
@property (weak, nonatomic) IBOutlet UILabel *order_offline_total_money;
@property (weak, nonatomic) IBOutlet UILabel *order_affirm_money;

@end
@implementation CapitalFlowSectionHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.blueView addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight withRadii:CGSizeMake(6, 6) viewRect:CGRectMake(0, 0, kScreenWidth, 150)];
    [self LoadData];
}
-(void)LoadData{
    NSString *url = [NSString stringWithFormat:@"/api/system/capital/%@",[UserModel sharedUserModel].merchant_id];
    [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
        if (responseModel.status == 200) {
            self.model = [[CapitalFlowModel alloc]initWithDictionary:responseModel.data];
        }else{
            self.model = [[CapitalFlowModel alloc]initWithDictionary:@{}];
        }
    }];
}
-(void)setModel:(CapitalFlowModel *)model{
    _model = model;
    
    _earnings.text = [NSString stringWithFormat:@"￥%.2f",_model.earnings];
    _order_online_total_money.text = [NSString stringWithFormat:@"￥%.2f",_model.order_online_total_money];
    _order_offline_total_money.text = [NSString stringWithFormat:@"￥%.2f",_model.order_offline_total_money];
    _order_total_money.text = [NSString stringWithFormat:@"累计收入:￥%.2f",_model.order_total_money];
    _order_affirm_money.text = [NSString stringWithFormat:@"累计划账:￥%.2f",_model.order_affirm_money];
    
}
@end
