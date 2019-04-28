//
//  TabBarController.m
//  TmoProduct
//
//  Created by 谭显敬 on 2019/1/4.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "TabBarController.h"
/*
#import "ShakeViewController.h"
#import "ShakeTmpViewController.h"
#import "ShakeCoinController.h"
#import "AppConfigModel.h"
*/

static NSString *const kAppPersonGuideShow = @"NewPersonGuideShowed";

@interface TabBarController ()<UITabBarControllerDelegate>

@property (nonatomic,assign) NSInteger  indexFlag;
@property (nonatomic, weak  ) UIViewController *shakeViewController;


@end

@implementation TabBarController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarProperties];
//    self.tabBar.translucent = NO;
    
//    self.shakeIV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 2.0 - 30.5, - 12, 61, 61)];
//    self.shakeIV.image = [UIImage imageNamed:@"tab_shake"];
//    
//    self.shakeTimesLB = [[UILabel alloc] init];
//    self.shakeTimesLB.font = [UIFont fontWithName:@"FolioBT-BoldCondensed" size:10];
//    self.shakeTimesLB.textColor = kColorWithRGB(210, 210, 210);
//    self.shakeTimesLB.textAlignment = NSTextAlignmentCenter;
//    self.shakeTimesLB.frame = self.shakeIV.frame;
//    [self.tabBar addSubview:self.shakeIV];
//    [self.tabBar addSubview:self.shakeTimesLB];
    
    self.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 摇动手势

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [self.shakeViewController motionBegan:motion withEvent:event];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (![viewController isEqual: tabBarController.viewControllers.lastObject]) {
        return YES;
    }
    
    if ([self isFirstLauch]) {
        
    }
    
    return YES;
}


- (BOOL)isFirstLauch{
    //获取当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentAppVersion = infoDic[@"CFBundleShortVersionString"];
    //获取上次启动应用保存的appVersion
    NSString *version = [[NSUserDefaults standardUserDefaults] objectForKey:kAppPersonGuideShow];
    //版本升级或首次登录
    if (version == nil || ![version isEqualToString:currentAppVersion]) {
        return YES;
    }else{
        return NO;
    }
}




-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
//    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry addObject:btn];
            }
        }
        //添加动画
        //放大效果，并回到原位
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
        animation.fromValue = [NSNumber numberWithFloat:1];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:1.2];     //结束伸缩倍数
        [[arry[index] layer] addAnimation:animation forKey:nil];
        
        self.indexFlag = index;
//    }
}
#pragma mark - 布局

- (void) setupTabBarProperties {
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_back"]];
    [self.tabBar setShadowImage:[UIImage new]];
    
}

@end
