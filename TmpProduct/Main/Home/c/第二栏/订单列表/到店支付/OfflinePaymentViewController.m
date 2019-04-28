//
//  OfflinePaymentViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "OfflinePaymentViewController.h"
#import "LLSegmentBarVC.h"
#import "OrderTodayViewController.h"
#import "AllOrdersViewController.h"

@interface OfflinePaymentViewController ()
@property (nonatomic,weak) LLSegmentBarVC * segmentVC;  //分段控制器
@end

@implementation OfflinePaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(0,0, kScreenWidth, 44);
    
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
       config.sBBackColor = UIColor.appBlueColor;
    }];
    self.segmentVC.contentView.scrollEnabled = YES;
    self.segmentVC.contentView.bounces = NO;
    [self.view addSubview: self.segmentVC.segmentBar];
    // 2 添加控制器的View
    CGFloat deleteheight = ISX?88:64;
    self.segmentVC.view.frame = CGRectMake(0, 44, kScreenWidth, kScreenHeight);
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"今日订单", @"全部订单"];
    OrderTodayViewController *shareholder = [[OrderTodayViewController alloc] init];
    AllOrdersViewController *turnover = [[AllOrdersViewController alloc] init];
    //3,添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[shareholder,turnover]];
    //4,配置基本设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.
        itemNormalColor([UIColor colorWithWhite:1 alpha:0.6]).
        itemSelectColor([UIColor whiteColor]).
        indicatorColor([UIColor whiteColor]);
        config.itemFont([UIFont systemFontOfSize:17]);
        config.indicatorHeight(2);
        config.indicatorExtraW(5);
        
    }];
    
}
- (void)setupNavigationItems {
    
    [self addBackButton];
    self.navigationItem.rightBarButtonItem = [self setupNavigationItemWithLeft:NO imageName:@"" title:@"" callBack:nil];
}
#pragma mark - segmentVC
- (LLSegmentBarVC *)segmentVC{
    if (!_segmentVC) {
        LLSegmentBarVC *vc = [[LLSegmentBarVC alloc]init];
        
        // 添加到到控制器
        [self addChildViewController:vc];
        _segmentVC = vc;
    }
    return _segmentVC;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
