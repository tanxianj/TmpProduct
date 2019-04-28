//
//  ElectronicPreferencesViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ElectronicPreferencesViewController.h"
#import "FullReductionTableViewCell.h"
#import "APP_Search_View.h"

@interface ElectronicPreferencesViewController ()<UITableViewDelegate,UITableViewDataSource,FullReductionTableViewCellDelegate,APP_Search_ViewDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * searchView;
@property (nonatomic, strong) APP_Search_View * app_search;
@property (nonatomic, strong) NSString * name;
@end

@implementation ElectronicPreferencesViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    self.view.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadData:weakSelf.name];
    }];
    [self LoadData:_name];
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    __weak typeof(self) weakSelf = self;
//    self.view.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
//        [weakSelf LoadData];
//    }];
//    [self LoadData];
    
}
-(void)LoadData:(NSString *)name{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (name.length) {
        [dic setObject:[UserInfoAndShopModel sharedUserModel].shop.idField forKey:@"shop_id"];
        [dic setObject:name forKey:@"name"];
    }else{
        [dic setObject:[UserInfoAndShopModel sharedUserModel].shop.idField forKey:@"shop_id"];
    }
    [[HTTPSessionManager sharedManager] listPOST:@"/api/coupon/lists" page:self.page parameters:dic callBack:^(ListModel *responseModel, id responseObject) {
        if ([self.tableView.mj_footer isRefreshing]) {
            [self.tableView.mj_footer endRefreshing];
        }
        if ([self.tableView.mj_header isRefreshing]) {
            [self.tableView.mj_header endRefreshing];
        }
        if (responseModel.status == 200) {
            if (self.page>=responseModel.data.last_page) {
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
                [self.tableView reloadData];
                [self.view.sy_loadingView endRefreshingWithNoDataString:kNoDataPromptText];
            }
        }else{
            [self.view.sy_loadingView endRefreshingWithErrorString:responseModel.message];
        }
    }];
}
//MARK:初始化子视图
- (void)initializeSubViews{
    _searchView = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
    
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.tableView];
    [self.view addSubview:_searchView];
    [_searchView addSubview:self.app_search];
}
//MARK:设置约束
- (void)setupSubViewMargins{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, ISX?24:0, 0));
    }];
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.offset(64);
    }];
    [self.app_search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.searchView).insets(UIEdgeInsetsMake(10, 0, 10, 0));
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
    
    FullReductionTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FullReductionTableViewCell" owner:self options:nil] lastObject];
    cell.cellType = FullReductionTypeTwo;
    cell.modelTwo = [[ElectronicPreferencesModel alloc]initWithDictionary: self.listArray[indexPath.row]];
    cell.delegate = self;
    return cell;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)NeedReloadData{
    [self LoadData:_name];
}
-(void)APP_Search_ViewWithString:(NSString *)string{
    self.page = 1;
    _name = string;
    [self LoadData:_name];
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = [UIView new];
        __weak typeof(self) weakSelf = self;
        _tableView.mj_footer = [XCRefreshFooter footerWithRefreshingBlock:^{
            [weakSelf LoadData:weakSelf.name];
        }];
        YZRefreshHeader *refreshHeader = [YZRefreshHeader headerWithRefreshingBlock:^{
            weakSelf.page = 1;
            [weakSelf LoadData:weakSelf.name];
        }];
        _tableView.mj_header = refreshHeader;
    }
    return _tableView;
}
-(APP_Search_View *)app_search{
    if (!_app_search) {
        _app_search = [[[NSBundle mainBundle] loadNibNamed:@"APP_Search_View" owner:self options:nil] lastObject];
        _app_search.placehodel = @"关键词搜索";
        _app_search.delegate = self;
        _app_search.searchType = AppSearchTypeTwo;
    }
    return _app_search;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
