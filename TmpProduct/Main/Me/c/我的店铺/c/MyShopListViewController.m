//
//  MyShopListViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "MyShopListViewController.h"
#import "MyShopListTableViewCell.h"

@interface MyShopListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) TableView * tableView;
@property (strong, nonatomic) UIButton * setDefaultBtn;
@property (strong, nonatomic) NSString * inshop;//当前默认店铺标识
@property (nonatomic, strong) NSString * tmpinshop;//当前点击店铺标识
@end

@implementation MyShopListViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    self.view.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadData];
    }];
    self.view.sy_loadingView.offsetY = ISX?88:64;
    self.page = 1;
    [self LoadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _inshop = [UserInfoAndShopModel sharedUserModel].shop.idField?:@"0";
    _tmpinshop = _inshop;
    self.navcBar.rightItem = [UIImage imageNamed:@"add"];
    __weak typeof(self) weakSelf = self;
    self.navcBar.rightBlock = ^{
        txjLog(@"add");
        [weakSelf PushToViewControllerWithVCName:@"AddShopViewController" vcTitle:@"新增店铺"];
    };

   
    
}
-(void)LoadData{
    [self.view.sy_loadingView beginRefreshing];
    [[HTTPSessionManager sharedManager] listPOST:@"/api/manager/shoplist" page:self.page parameters:@{@"merchant_id":[UserModel sharedUserModel].merchant_id} callBack:^(ListModel *responseModel, id responseObject) {
        if ([self.tableView.mj_footer isRefreshing]) {
            [self.tableView.mj_footer endRefreshing];
        }
        if ([self.tableView.mj_header isRefreshing]) {
            [self.tableView.mj_header endRefreshing];
        }
        if (responseModel.status == 200) {
            if (self.page >= responseModel.data.last_page) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }else{
                self.page++;
            }
            if (self.page == 1) {
                self.listArray = nil;
            }
            [self.listArray addObjectsFromArray:responseModel.data.data];
            if (self.listArray.count) {
                [self.tableView reloadData];
                [self.view.sy_loadingView endRefreshing];
            }else{
                [self.view.sy_loadingView endRefreshingWithNoDataString:kNoDataPromptText];
            }
        }else{
            [self.view.sy_loadingView endRefreshingWithErrorString:responseModel.message];
        }
    }];
}
//MARK:初始化子视图
- (void)initializeSubViews{
    _setDefaultBtn = [BaseClassTool buttonWithFont:14.0 titleColor:UIColor.whiteColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter title:@"设为默认店铺"];
    [_setDefaultBtn setBackgroundColor:UIColor.appBlueColor];
    _setDefaultBtn.layer.masksToBounds = YES;
    _setDefaultBtn.layer.cornerRadius = 22;
    __weak typeof(self) weakSelf = self;
    [_setDefaultBtn txj_addEventHandler:^{
        [weakSelf.view endEditing:YES];
        [weakSelf SetDefaultShop];
    } forControlEvents:UIControlEventTouchUpInside];
}
-(void)SetDefaultShop{
    [[HTTPSessionManager sharedManager] POST:@"/api/user/setShop" parameters:@{@"inshop":_tmpinshop} callBack:^(RespondModel *responseModel) {
        [XCToast showWithMessage:responseModel.message];
        if (responseModel.status == 200) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.setDefaultBtn];
    [self.view addSubview:self.tableView];
}
//MARK:设置约束
- (void)setupSubViewMargins{
    
    [self.setDefaultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.right.equalTo(self.view).offset(-12);
        make.height.offset(44);
        make.bottom.equalTo(self.view).offset((ISX?-24:-10));
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake((ISX?88:64), 0, 0, 0));
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset((ISX?88:64));
        make.bottom.equalTo(self.setDefaultBtn.mas_top).offset(-10);
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
    MyShopListTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MyShopListTableViewCell" owner:self options:nil] lastObject];
    cell.model = [[MyShopListModel alloc]initWithDictionary:self.listArray[indexPath.row]];
//    [cell.selectBtn setImage:[UIImage imageNamed:_inshop == cell.model.idField?@"checked":@"hollow circle"] forState:UIControlStateNormal];
    if (_inshop == cell.model.idField) {
        [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
    UILabel *lab = [BaseClassTool labelWithFont:14.0 textColor:UIColor.appTextColor textAlignment:NSTextAlignmentLeft];
    lab.text = @"我创建的店铺";
    [view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).insets(UIEdgeInsetsMake(0, 12, 0, 0));
    }];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MyShopListTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.tmpinshop = cell.model.idField;
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = [UIView new];
        __weak typeof(self) weakSelf = self;
        _tableView.mj_footer = [XCRefreshFooter footerWithRefreshingBlock:^{
            [weakSelf LoadData];
        }];
        YZRefreshHeader *refreshHeader = [YZRefreshHeader headerWithRefreshingBlock:^{
            weakSelf.page = 1;
            [weakSelf LoadData];
        }];
        _tableView.mj_header = refreshHeader;
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
