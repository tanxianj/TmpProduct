//
//  UncancelledOrdersSectionFooter.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "UncancelledOrdersSectionFooter.h"
#import "UIView+LSCore.h"
#import "TXJToslView.h"
@interface UncancelledOrdersSectionFooter ()
@property (weak, nonatomic) IBOutlet UIView *super_view;
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UIButton *left_btn;
@property (weak, nonatomic) IBOutlet UIButton *right_btn;

@end
@implementation UncancelledOrdersSectionFooter

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setBtnLayer:_left_btn color:UIColor.appBlueColor];
    [self setBtnLayer:_right_btn color:UIColor.appRedColor];
    
    [self.super_view addRoundedCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight withRadii:CGSizeMake(6, 6) viewRect:CGRectMake(0, 0, kScreenWidth-24, 50) ];
}
-(void)setBtnLayer:(UIButton *)btn color:(UIColor *)color{
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 12;
    btn.layer.borderWidth = kOnePx;
    btn.layer.borderColor = color.CGColor;
}
-(void)setModel:(OrderListModel *)model{
    _model = model;
    _title_lab.text = [NSString stringWithFormat:@"实际支付:￥%@",_model.order_money];
}
- (IBAction)callUserBtnAction:(id)sender {
    txjLog(@"联系用户");
    
    if (_model.mobile.length) {
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",_model.mobile];
        UIWebView * webview = [[UIWebView alloc] init];
        [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
        [[UIViewController getCurrentVC].view addSubview:webview];
    }else{
        [XCToast showWithMessage:@"暂无用户联系方式"];
    }
    
}
- (IBAction)hexiaoBtnAction:(id)sender {
    txjLog(@"核销");
    __weak typeof(self) weakSelf = self;
    if (_model.mobile.length) {
        [TXJToslView showToslViewWithContent:[NSString stringWithFormat:@"确认用户手机尾号(%@)到店了吗?",[[NSString stringWithFormat:@"%@",_model.mobile] substringFromIndex:7]] leftAction:nil rightAction:^{
            NSString *url = [NSString stringWithFormat:@"/api/order/verification/%li",weakSelf.model.idField];
            [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
                [XCToast showWithMessage:responseModel.message];
                if (responseModel.status == 200) {
                    if (self.reloadData) {
                        self.reloadData();
                    }
                }
            }];
        }];
    }else{
        [TXJToslView showToslViewWithContent:[NSString stringWithFormat:@"确认用户到店了吗?"] leftAction:nil rightAction:^{
            NSString *url = [NSString stringWithFormat:@"/api/order/verification/%li",weakSelf.model.idField];
            [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
                [XCToast showWithMessage:responseModel.message];
                if (responseModel.status == 200) {
                    if (self.reloadData) {
                        self.reloadData();
                    }
                }
            }];
        }];
    }
    
}
@end
