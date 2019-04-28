//
//  ViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/12.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ViewController.h"

#import "HTTPSessionManager.h"
//#import "XHBLoginViewController.h"
//#import "XHBMobileViewController.h"
//#import <WXApi.h>
#import "LoginAPPViewController.h"


@implementation ViewController
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma mark -
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"设置路由参数错误,不存在Key: %@",key);
}

- (void)setNilValueForKey:(NSString *)key{
    NSLog(@"设置路由参数错误,Key为nil: %@",key);
}

- (void)addBackButton{
    self.navigationItem.leftBarButtonItem = [self setupNavigationItemWithLeft:NO imageName:@"return" title:nil callBack:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.fd_prefersNavigationBarHidden = [self xhb_preferredNavigationBarHidden];
    self.fd_interactivePopDisabled = [self xhb_interactivePopDisabled];
    self.view.backgroundColor = [UIColor appBackgroundColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initializeData];
    [self initializeSubViews];
    [self addSubViews];
    [self setupSubViewMargins];
    [self addTargerts];
    [self addObservers];
    [self setupNavigationItems];
    
    
//    self.topSeparatorLine = [BaseClassTool viewWithBackgroundColor:[UIColor appBackgroundColor]];
//    [self.view addSubview:self.topSeparatorLine];
//    [self.topSeparatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self.view);
//        make.height.mas_equalTo(kOnePx);
//    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //    if ([self xhb_preferredNavigationBarTintColor] != [UIColor whiteColor]) {
    //        [self.navigationController.navigationBar setBarTintColor:[self xhb_preferredNavigationBarTintColor]];
    //        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[self xhb_preferredNavigationTitleColor]}];
    //    }else{
    //        [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    //        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor blackColor]}];
    //    }
    
    //    [self.navigationController setNavigationBarHidden:[self xhb_preferredNavigationBarHidden] animated:NO];
    //    [self xhb_preferredNavigationBarCustomStyle];
    //
    [self.view bringSubviewToFront:self.topSeparatorLine];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if (self.deleteViewCount) {
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
        NSInteger removeCount = self.deleteViewCount;
        if (array.count >= removeCount + 1) {
            [array removeObjectsInRange:NSMakeRange(array.count - (removeCount + 1), removeCount)];
            self.navigationController.viewControllers = array;
        }
        self.deleteViewCount = 0;//保证只允许一次
    }
}
-(void)PushToViewControllerWithVCName:(NSString *)vcName vcTitle:(NSString *)vcTitle{
    ViewController *vc = (ViewController *)[[NSClassFromString(vcName) alloc] init];
    if (vc) {
        vc.hidesBottomBarWhenPushed = YES;
        [vc defaultNavigationBarSetWithTitle:vcTitle];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        if ([vcTitle isEqualToString:@"敬请期待"]) {
            [XCToast showWithMessage:@"敬请期待"];
        }else{
            [XCToast showWithMessage:@"没有控制器"];
        }
    }
}
-(void)jumpLoginInterface{
    txjLog(@"跳转到登录");
    /*
    //创建动画
    CATransition * transition = [CATransition animation];
    
    //设置动画类型（这个是字符串，可以搜索一些更好看的类型）
    transition.type = @"moveOut";
    
    //动画出现类型
    transition.subtype = @"fromCenter";
    
    //动画时间
    transition.duration = 0.3;
    
    //移除当前window的layer层的动画
    [self.view.window.layer removeAllAnimations];
    
    //将定制好的动画添加到当前控制器window的layer层
    [self.view.window.layer addAnimation:transition forKey:nil];
     */
    LoginAPPViewController *vc = [LoginAPPViewController new];
    //把当前控制器作为背景
    self.definesPresentationContext = YES;
    
    //设置模态视图弹出样式
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)dealloc {
    [self removeObservers];
}

- (BOOL)xhb_interactivePopDisabled{
    return NO;
}

//
//- (UIColor *)xhb_preferredNavigationTitleColor {
//    return [UIColor appBlackColor];
//}
//
//- (UIColor *)xhb_preferredNavigationBarTintColor {
//    return [UIColor whiteColor];
//}

- (BOOL)xhb_preferredNavigationBarHidden {
    return YES;
}


- (void)xhb_preferredNavigationBarCustomStyle {
    
}


#pragma mark - <Initialization>

- (void)initializeData {
    
}

- (void)initializeSubViews {
    
}

- (void)addSubViews {
    
}

- (void)setupSubViewMargins {
    
}

- (void)setupNavigationItems {
    
}

- (void)addTargerts {
    
}

- (void)addObservers {
    
}

- (void)removeObservers {
    
}
-(void)setTitle:(NSString *)title{
    self.navcBar.title = title;
}
-(void)defaultNavigationBarSetWithTitle:(NSString *)title{
    self.navcBar = [[NavigationBar alloc] initWithVC:self];
    self.navcBar.style = NavigationBarStyleLightContent;
    self.navcBar.backgroundColor = [UIColor appBlueColor];
    self.navcBar.title = title;
    [self.view addSubview:self.navcBar];
}
-(void)defaultNavigationBarSetWithTitle:(NSString *)title Right:(id)right rightItemBlock:(void(^)(void))click{
    self.navcBar = [[NavigationBar alloc] initWithVC:self];
    self.navcBar.style = NavigationBarStyleLightContent;
    self.navcBar.backgroundColor = [UIColor appBlueColor];
    self.navcBar.title = title;
    self.navcBar.rightItem = right;
    self.navcBar.rightBlock = ^{
        click();
    };
    [self.view addSubview:self.navcBar];
}
-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}
@end

