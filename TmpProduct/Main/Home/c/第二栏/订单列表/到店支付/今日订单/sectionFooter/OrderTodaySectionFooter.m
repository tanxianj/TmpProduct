//
//  OrderTodaySectionFooter.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "OrderTodaySectionFooter.h"
#import "UIView+LSCore.h"
@interface OrderTodaySectionFooter ()
@property (weak, nonatomic) IBOutlet UIView *super_view;
@property (weak, nonatomic) IBOutlet UILabel *total_money;
@property (weak, nonatomic) IBOutlet UIButton *status;
@end
@implementation OrderTodaySectionFooter

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.super_view addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight withRadii:CGSizeMake(6, 6) viewRect:CGRectMake(0, 0, kScreenWidth-24, 50) ];
}
-(void)setModel:(OrderListModel *)model{
    _model = model;
    _total_money.text = [NSString stringWithFormat:@"实际支付:￥%@",_model.order_money];
    switch (_model.status) {
        case 0:{
            [_status setTitle:@" 未完成" forState:UIControlStateNormal];
            [_status setImage:[UIImage imageNamed:@"time"] forState:UIControlStateNormal];
        }break;
        case 1:{
            [_status setTitle:@"  已完成" forState:UIControlStateNormal];
            [_status setImage:[UIImage imageNamed:@"checked-green"] forState:UIControlStateNormal];
        }break;
            
        default:
            break;
    }
}
@end
