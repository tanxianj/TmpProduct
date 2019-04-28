//
//  RefundAfterSaleSectionFooter.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "RefundAfterSaleSectionFooter.h"
#import "UIView+LSCore.h"
@interface RefundAfterSaleSectionFooter ()

@property (weak, nonatomic) IBOutlet UIView *super_view;

@property (weak, nonatomic) IBOutlet UILabel *total_money;
@property (weak, nonatomic) IBOutlet UIButton *status;
@property (weak, nonatomic) IBOutlet UILabel *created_at;

@end
@implementation RefundAfterSaleSectionFooter

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.super_view addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight withRadii:CGSizeMake(6, 6) viewRect:CGRectMake(0, 0, kScreenWidth-24, 70) ];
}
-(void)setModel:(OrderListModel *)model{
    _model = model;
    _total_money.text = [NSString stringWithFormat:@"实际支付:￥%@",_model.order_money];
    switch (_model.is_refund) {
        case 0:{
            [_status setTitle:@"  无操作" forState:UIControlStateNormal];
            [_status setImage:[UIImage imageNamed:@"time"] forState:UIControlStateNormal];
        }break;
        case 1:{
            [_status setTitle:@"  待确认" forState:UIControlStateNormal];
            [_status setImage:[UIImage imageNamed:@"time"] forState:UIControlStateNormal];
        }break;
        case 2:{
            [_status setTitle:@"  退款中" forState:UIControlStateNormal];
            [_status setImage:[UIImage imageNamed:@"time"] forState:UIControlStateNormal];
        }break;
        case 3:{
            [_status setTitle:@"  已退款" forState:UIControlStateNormal];
            [_status setImage:[UIImage imageNamed:@"checked-green"] forState:UIControlStateNormal];
        }break;
        default:
            break;
    }
    _created_at.text = _model.created_at;
}
@end
