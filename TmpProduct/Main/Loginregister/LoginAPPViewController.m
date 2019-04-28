//
//  LoginAPPViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/12.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "LoginAPPViewController.h"
#import "LocalDataTool.h"

@interface LoginAPPViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconMgTop;
@property (weak, nonatomic) IBOutlet UITextField *mobileTextFld;
@property (weak, nonatomic) IBOutlet UIButton *clearMobile;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextFld;
@property (weak, nonatomic) IBOutlet UIButton *showHiedPwd;
@property (assign, nonatomic) BOOL show;
@end

@implementation LoginAPPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _show = NO;
    // Do any additional setup after loading the view.
    _iconMgTop.constant = (ISX?88:64)+50;
    [self defaultNavigationBarSetWithTitle:@"登录"];
    self.navcBar.leftItem = nil;
#ifdef DEBUG
    _mobileTextFld.text = @"18990876953";
    _pwdTextFld.text = @"123456";
#endif
    //下滑关闭
    UIPanGestureRecognizer *tp = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenView:)];
    [self.view addGestureRecognizer:tp];
}
-(void)hiddenView:(UIPanGestureRecognizer *)gr{
    CGPoint translation = [gr translationInView:self.view];
    CGPoint center = self.view.center;
    CGFloat tmp = center.y;
    center.y+=translation.y;
    if (center.y - tmp >= 100.f) {
        [self goBack];
    }
    
}
- (void)goBack{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//MARK:清除手机号
- (IBAction)clearMobileBtnAction:(id)sender {
    _mobileTextFld.text = nil;
}
//MARK:显示隐藏密码
- (IBAction)showHiedPwdBtn:(id)sender {
    _show = !_show;
    _pwdTextFld.secureTextEntry = !_show;
    [self.showHiedPwd setImage:[UIImage imageNamed:_show?@"open":@"hide"] forState:UIControlStateNormal];
}
//MARK:登录
- (IBAction)loginBtnAction:(id)sender {
    txjLog(@"登录");
    [[HTTPSessionManager sharedManager] POST:@"/api/auth/login" parameters:@{@"mobile":_mobileTextFld.text,@"password":_pwdTextFld.text} callBack:^(RespondModel *responseModel) {
        [XCToast showWithMessage:responseModel.message];
        if (responseModel.status==200) {
            [LocalDataTool writeKeepUserInfo:responseModel.data];
            [HTTPSessionManager attempDealloc];
            [UserModel attempDealloc];
            [self goBack];
        }
    }];
}
//MARK:忘记密码
- (IBAction)iForGetPwd:(id)sender {
    txjLog(@"忘记密码");
    [XCToast showWithMessage:@"请联系管理员修改密码"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
