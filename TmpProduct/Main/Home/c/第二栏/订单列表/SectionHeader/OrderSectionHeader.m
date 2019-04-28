//
//  OrderSectionHeader.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "OrderSectionHeader.h"
#import "UIView+LSCore.h"
@interface OrderSectionHeader ()
@property (weak, nonatomic) IBOutlet UIView *super_view;
@property (weak, nonatomic) IBOutlet UILabel *order_sn;
@property (weak, nonatomic) IBOutlet UILabel *pay_time;
@property (weak, nonatomic) IBOutlet UILabel *hexiao_time;
@property (weak, nonatomic) IBOutlet UILabel *pay_name;
@property (weak, nonatomic) IBOutlet UILabel *top_lab;

@end
@implementation OrderSectionHeader

-(void)awakeFromNib{
    [super awakeFromNib];
    _top_lab.backgroundColor = [UIColor appBackgroundColor];
    [self.super_view addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight withRadii:CGSizeMake(6, 6) viewRect:CGRectMake(0, 0, kScreenWidth-24, 90)];
}
-(void)setModel:(OrderListModel *)model{
    _model = model;
    _order_sn.text = [NSString stringWithFormat:@"订单编号:%@",_model.order_sn];
    _pay_time.text = [NSString stringWithFormat:@"支付时间:%@",_model.pay_time?:@"无"];
    _hexiao_time.text = [NSString stringWithFormat:@"核销时间:%@",_model.hexiao_time?:@"无"];
    _pay_name.text = [NSString stringWithFormat:@"%@",_model.pay_name];
    __weak typeof(self) weakSelf = self;
    [_order_sn txj_whenTapped:^{
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = [NSString stringWithFormat:@"%@",weakSelf.model.order_sn];
        [XCToast showWithMessage:@"订单编号复制成功"];
    }];
}
@end
