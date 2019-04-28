//
//  MeOneTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "MeOneTableViewCell.h"
#import "LoginAPPViewController.h"
#import "SetViewController.h"
#import "UserInfoViewController.h"
#import "LocalDataTool.h"
#import "getearningsModel.h"
@interface MeOneTableViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *setBtnMgTop;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray * labArray;
@property (weak, nonatomic) IBOutlet UIImageView *head_pic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *yesterday_earning;
@property (weak, nonatomic) IBOutlet UILabel *today_earning;
@property (weak, nonatomic) IBOutlet UILabel *count_earning;
@property (nonatomic, strong) NSString * yesterday_earning_str;
@property (nonatomic, strong) NSString * today_earning_str;
@property (nonatomic, strong) NSString * count_earning_str;
@end
@implementation MeOneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    for (UILabel *lab  in self.labArray) {
        [lab setFont:[UIFont fontWithName:@"Dosis-Medium" size:16.0]];
    }
    _setBtnMgTop.constant = ISX?64:44;
    if ([UserModel sharedUserModel].token) {
        if ([getearningsModel sharedUserModel].count_earning) {
            self.yesterday_earning.text = [NSString stringWithFormat:@"%.2f",[[getearningsModel sharedUserModel].yesterday_earning floatValue]];
            self.today_earning.text = [NSString stringWithFormat:@"%.2f",[[getearningsModel sharedUserModel].today_earning floatValue]];
            self.count_earning.text = [NSString stringWithFormat:@"%.2f",[[getearningsModel sharedUserModel].count_earning floatValue]];
        }
        NSString *url = [NSString stringWithFormat:@"/api/manager/getearnings/%@",[UserInfoAndShopModel sharedUserModel].shop.idField];
        [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
            [UIView performWithoutAnimation:^{
                if (responseModel.status == 200) {
                    [LocalDataTool writegetearnings:responseModel.data];
                    self.yesterday_earning.text = [NSString stringWithFormat:@"%.2f",[responseModel.data[@"yesterday_earning"] floatValue]];
                    self.today_earning.text = [NSString stringWithFormat:@"%.2f",[responseModel.data[@"today_earning"] floatValue]];
                    self.count_earning.text = [NSString stringWithFormat:@"%.2f",[responseModel.data[@"count_earning"] floatValue]];
                }
            }];
            
            
        }];
    }
    
}
-(void)reloadData{
    __weak typeof(self) weakSelf = self;
    [_head_pic sd_setImageWithURL:[NSURL URLWithString:[UserInfoAndShopModel sharedUserModel].user.head_pic] placeholderImage:[UIImage imageNamed:@"def-head"]];
    _name.text = [UserInfoAndShopModel sharedUserModel].user.name?:@"未登录";
    [_head_pic txj_whenTapped:^{
        [[UIViewController getCurrentVC].view endEditing:YES];
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([UserModel sharedUserModel].token) {
            
            [strongSelf PushToUserInfoViewController];
        }else{
            
            [strongSelf jumpLoginInterface];
        }
    }];
    [_name txj_whenTapped:^{
        [[UIViewController getCurrentVC].view endEditing:YES];
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([UserModel sharedUserModel].token) {
            
            [strongSelf PushToUserInfoViewController];
        }else{
            
            [strongSelf jumpLoginInterface];
        }
    }];
}
- (IBAction)setBtnAction:(id)sender {
    if ([UserModel sharedUserModel].token) {
    SetViewController *vc = [SetViewController new];
    [vc defaultNavigationBarSetWithTitle:@"设置"];
    vc.hidesBottomBarWhenPushed = YES;
    [[UIViewController getCurrentVC].navigationController pushViewController:vc animated:YES];
    }else{
        [self jumpLoginInterface];
    }
}
-(void)jumpLoginInterface{
    LoginAPPViewController *vc = [LoginAPPViewController new];
    //把当前控制器作为背景

    [UIViewController getCurrentVC].definesPresentationContext = YES;
    
    //设置模态视图弹出样式
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [[UIViewController getCurrentVC] presentViewController:vc animated:YES completion:nil];
}
-(void)PushToUserInfoViewController{
    UserInfoViewController *vc = [UserInfoViewController new];
    [vc defaultNavigationBarSetWithTitle:@"个人信息"];
    vc.hidesBottomBarWhenPushed = YES;
    [[UIViewController getCurrentVC].navigationController pushViewController:vc animated:YES];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
