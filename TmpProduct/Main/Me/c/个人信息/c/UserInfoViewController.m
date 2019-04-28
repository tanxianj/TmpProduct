//
//  UserInfoViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoHeaderTableViewCell.h"
#import "UserInfodescTableViewCell.h"
#import "ChangeAvatarVC.h"
#import "LocalDataTool.h"
#import "ChangeNickNameViewController.h"

@interface UserInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) TableView * tableView;
@end

@implementation UserInfoViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadUserData:^{
        self.listArray = nil;
        [self.listArray addObjectsFromArray:@[
                                              @{@"title":@"",
                                                @"desc":@""
                                                },
                                              @{@"title":@"昵称",
                                                @"desc":[UserInfoAndShopModel sharedUserModel].user.name
                                                },
                                              @{@"title":@"手机号码",
                                                @"desc":[UserInfoAndShopModel sharedUserModel].user.mobile
                                                },
                                              ]];
        [UIView performWithoutAnimation:^{
            [self.tableView reloadData];
        }];
    }];
}
-(void)reloadUserData:(void(^)(void))complete{
    if ([UserModel sharedUserModel].token) {
        [[HTTPSessionManager sharedManager] POST:@"/api/user/me" parameters:@{} callBack:^(RespondModel *responseModel) {
            if (responseModel.status == 200) {
                [LocalDataTool writeUserInfoAndAshop:responseModel.data];
                [UserInfoAndShopModel attempDealloc];
                complete();
            }else{
                [XCToast showWithMessage:@"拉取用户数据失败"];
            }
        }];
    }else{
        complete();
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.listArray addObjectsFromArray:@[
                                          @{@"title":@"",
                                            @"desc":@""
                                            },
                                          @{@"title":@"昵称",
                                            @"desc":[UserInfoAndShopModel sharedUserModel].user.name
                                            },
                                          @{@"title":@"手机号码",
                                            @"desc":[UserInfoAndShopModel sharedUserModel].user.mobile
                                            },
                                          ]];
}
//MARK:初始化子视图
- (void)initializeSubViews{
    
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.tableView];
}
//MARK:设置约束
- (void)setupSubViewMargins{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake((ISX?88:64), 0, 24, 0));
    }];
}
//MARK:显示分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UserInfoHeaderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"UserInfoHeaderTableViewCell" owner:self options:nil] lastObject];
        [cell reloadData];
        return cell;
    }else{
        UserInfodescTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"UserInfodescTableViewCell" owner:self options:nil] lastObject];
        cell.model = self.listArray[indexPath.row];
        return cell;
    }
    return nil;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            txjLog(@"修改头像");
//            [self PushToViewControllerWithVCName:@"ChangeAvatarVC" vcTitle:@"修改头像"];
            ChangeAvatarVC *vc = [ChangeAvatarVC new];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 1:{
            txjLog(@"修改昵称");
            ChangeNickNameViewController *vc = [ChangeNickNameViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        default:
            break;
    }
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row?50:70;
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIView *header = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
        header.frame = CGRectMake(0, 0, kScreenWidth, 10);
        _tableView.tableHeaderView = header;
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
