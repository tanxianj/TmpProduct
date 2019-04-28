//
//  ChangeNickNameViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ChangeNickNameViewController.h"

@interface ChangeNickNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextFld;
@end

@implementation ChangeNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultNavigationBarSetWithTitle:@"修改昵称"];
    _nickNameTextFld.text = [UserInfoAndShopModel sharedUserModel].user.name;;
    
    
}
- (IBAction)clearBtnAction:(id)sender {
    _nickNameTextFld.text = nil;
}
- (IBAction)saveBtnAction:(id)sender {
    [[HTTPSessionManager sharedManager] POST:@"/api/user/setNickname" parameters:@{@"name":_nickNameTextFld.text} callBack:^(RespondModel *responseModel) {
        [XCToast showWithMessage:responseModel.message];
        if (responseModel.status == 200) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
