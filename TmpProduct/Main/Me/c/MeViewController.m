//
//  MeViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/12.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "MeViewController.h"
#import "MeOneTableViewCell.h"
#import "MeTwoTableViewCell.h"
#import "LocalDataTool.h"
#import "WebLoadingViewController.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) TableView * tableView;
@end
@implementation MeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadUserData:^{
        [self.tableView reloadData];
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
    // Do any additional setup after loading the view.
    [self.listArray addObjectsFromArray:@[@{
                                              @"image":@"shop",
                                              @"title":@"我的店铺",
                                              @"ViewController":@"MyShopListViewController",
                                              @"showDesc":@"YES"
                                              },
                                          @{
                                              @"image":@"shop assistant",
                                              @"title":@"我的店员",
                                              @"ViewController":@"MyStaffViewController",
                                              @"showDesc":@"NO"
                                              },
                                          @{
                                              @"image":@"bill",
                                              @"title":@"资金流水",
                                              @"ViewController":@"CapitalFlowViewController",
                                              @"showDesc":@"NO"
                                              },
                                          @{
                                              @"image":@"suggest",
                                              @"title":@"意见反馈",
                                              @"ViewController":@"FeedbackViewController",
                                              @"showDesc":@"NO"
                                              },
                                          @{
                                              @"image":@"help",
                                              @"title":@"帮助中心",
                                              @"ViewController":@"HelpCenterViewController",
                                              @"showDesc":@"NO"
                                              },
                                          @{
                                              @"image":@"about",
                                              @"title":@"关于我们",
                                              @"ViewController":@"AboutUsViewController",
                                              @"showDesc":@"NO"
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
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(ISX?-44:0, 0, 0, 0));
    }];
}
//MARK:显示分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?self.listArray.count:1;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            MeOneTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MeOneTableViewCell" owner:self options:nil] lastObject];
            [cell reloadData];
            return cell;
        }break;
        default:{
            MeTwoTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MeTwoTableViewCell" owner:self options:nil] lastObject];
            cell.model = self.listArray[indexPath.row];
            [cell reloadData];
            return cell;
        }break;
    }
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if (![UserModel sharedUserModel].token.length) {
            [self jumpLoginInterface];
            return;
        }
        if (indexPath.row!=0) {
            if (![UserInfoAndShopModel sharedUserModel].shop.idField) {
                [XCToast showWithMessage:@"请先设置默认店铺！"];
                return;
            }
        }
//            http://test.qiao-ou.com/api/help/index
            if ([self.listArray[indexPath.row][@"ViewController"] isEqualToString:@"HelpCenterViewController"]) {
                WebLoadingViewController *vc = [WebLoadingViewController new];
                vc.url = @"http://test.qiao-ou.com/api/help/index";
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }else{
                [self PushToViewControllerWithVCName:self.listArray[indexPath.row][@"ViewController"] vcTitle:self.listArray[indexPath.row][@"title"]];
            }
        
        
    }
    
}
//MARK:HeaderView
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
}
//MARK:Heder height
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section?10:CGFLOAT_MIN;
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section?48:ISX?264:244;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isEqual:self.tableView]) {
        txjLog(@"%.2f",scrollView.contentOffset.y);
        if (ISX) {
            if (self.tableView.contentOffset.y<=-44.0) {
                [self.tableView setContentOffset:CGPointMake(0, -44.0)];
//                self.tableView.bounces = NO;
            }else{
//                self.tableView.bounces = YES;
            }
        }else{
            if (self.tableView.contentOffset.y < 0.0) {
                [self.tableView setContentOffset:CGPointMake(0, 0.0)];
//                self.tableView.bounces = NO;
            }else{
//                 self.tableView.bounces = YES;
            }
        }
        
    }
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
