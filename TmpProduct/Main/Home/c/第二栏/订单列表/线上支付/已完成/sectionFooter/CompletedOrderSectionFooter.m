//
//  CompletedOrderSectionFooter.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "CompletedOrderSectionFooter.h"
#import "UIView+LSCore.h"
#import "StarView.h"
#import "OrderCommentDetailViewController.h"
@interface CompletedOrderSectionFooter ()
@property (weak, nonatomic) IBOutlet UIView *super_view;
@property (weak, nonatomic) IBOutlet UILabel *total_money;
@property (weak, nonatomic) IBOutlet UILabel *status_time;
@property (weak, nonatomic) IBOutlet UIButton *status;
@property (weak, nonatomic) IBOutlet UILabel *order_comments;
@property (nonatomic, strong) StarView *starView;
@property (weak, nonatomic) IBOutlet UIView *starView_super;

@end
@implementation CompletedOrderSectionFooter

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.super_view addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight withRadii:CGSizeMake(6, 6) viewRect:CGRectMake(0, 0, kScreenWidth-24, 70) ];
    
}
- (StarView *)starView {
    if (!_starView) {
        _starView = [[StarView alloc]initWithFrame:CGRectMake(0, 0, 100, 20) withTotalStar:5 withTotalPoint:10.0 starSpace:2];
        _starView.type = StarTypeComment;
        _starView.starAliment = StarAlimentCenter;
        _starView.commentPoint = _model.order_comments;
        _starView.userInteractionEnabled = NO;
    }
    return _starView;
}
-(void)setModel:(OrderListModel *)model{
    _model = model;
    _total_money.text = [NSString stringWithFormat:@"实际支付:￥%@",_model.order_money];
    [_status setTitle:@"  已完成" forState:UIControlStateNormal];
    _status_time.text = _model.status_time;
    _order_comments.text = @"用户评价:";
    [_starView_super addSubview:self.starView];
    __weak typeof(self) weakSelf = self;
    [_starView_super txj_whenTapped:^{
        txjLog(@"跳转到评论");
        OrderCommentDetailViewController *vc = [OrderCommentDetailViewController new];
        vc.idStr = [NSString stringWithFormat:@"%li",weakSelf.model.idField];
        [[UIViewController getCurrentVC].navigationController pushViewController:vc animated:YES];
    }];
}
@end
