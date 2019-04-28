//
//  PayCodeViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "PayCodeViewController.h"
#import "UIImage+Category.h"
#import <objc/runtime.h>
#import "TXJNotificationViewController.h"

@interface PayCodeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Price_lab;
@property (weak, nonatomic) IBOutlet UIImageView *qr_code_image;
@property (weak, nonatomic) IBOutlet UIButton *tostBtn;
@property (weak, nonatomic) IBOutlet UIView *super_view;
@property (nonatomic, strong) NSTimer * timer;

@end

@implementation PayCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor appBlueColor];
    self.super_view.layer.masksToBounds = YES;
    self.super_view.layer.cornerRadius = 6;
    [self defaultNavigationBarSetWithTitle:@"等待用户扫码"];
    self.Price_lab.text = [NSString stringWithFormat:@"￥%@",_priceStr];
    [self.tostBtn setTitle:_pay_type==0?@"等待用户支付宝扫码付款":@"等待用户微信扫码付款" forState:UIControlStateNormal];
    __weak typeof(self) weakSelf = self;
    self.qr_code_image.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadData];
    }];
    [self LoadData];
    // 创建定时器
    _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(ReloadData) userInfo:nil repeats:YES];
    // 将定时器添加到runloop中，否则定时器不会启动
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
    
}
-(void)LoadData{
    [self.qr_code_image.sy_loadingView beginRefreshing];
    NSString *url = [NSString stringWithFormat:@"/api/payment/pay/%@",_idStr?:@""];
    [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
        if (responseModel.status == 200) {
            UIImage *img = [UIImage qrCodeImageWithContent:responseModel.data width:self.qr_code_image.mj_w padding:10 red:255.0 green:255.0 blue:255.0];
            self.qr_code_image.image = img;
            [self.qr_code_image.sy_loadingView endRefreshing];
        }else{
            [self.qr_code_image.sy_loadingView endRefreshingWithErrorString:responseModel.message];
        }
    }];
}
-(void)ReloadData{
    NSString *url = [NSString stringWithFormat:@"/api/payment/search/%@",_idStr];
    [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
        if (responseModel.status == 200) {
            [XCToast showWithMessage:responseModel.message];
            // 停止定时器
            [self.timer invalidate];
            switch (self.pay_type) {
                case 0:{//alipay
                    [TXJNotificationViewController addLocalNoticeWithNotificationType:NotificationTypeOne title:@"收款到账通知" body:[NSString stringWithFormat:@"支付宝收款到账:%@元",self.priceStr]];
                }break;
                case 1:{//weichat
                    [TXJNotificationViewController addLocalNoticeWithNotificationType:NotificationTypeOne title:@"收款到账通知" body:[NSString stringWithFormat:@"微信收款到账:%@元",self.priceStr]];
                }break;
                default:
                    break;
            }
            
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
}
-(void)dealloc{
    // 停止定时器
    [self.timer invalidate];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 停止定时器
    [self.timer invalidate];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
