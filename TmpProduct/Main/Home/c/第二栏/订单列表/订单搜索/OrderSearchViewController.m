//
//  OrderSearchViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/21.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "OrderSearchViewController.h"
#import "APP_Search_View.h"
#import "OrderSectionHeader.h"
#import "RefundAfterSaleSectionFooter.h"
#import "OrderTableViewCell.h"
#import "OrderTodaySectionFooter.h"
#import "UncancelledOrdersSectionFooter.h"
#import "CompletedOrderSectionFooter.h"

@interface OrderSearchViewController ()<UITableViewDelegate,UITableViewDataSource,APP_Search_ViewDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * searchView;
@property (nonatomic, strong) APP_Search_View * app_search;
@property (nonatomic, strong) NSString * keyword;
@end

@implementation OrderSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self) weakSelf = self;
    _keyword = @"";
    [self defaultNavigationBarSetWithTitle:@"订单搜索"];
    self.tableView.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf loadData:weakSelf.keyword];
    }];
//    self.view.sy_loadingView.offsetY = (ISX?88:64) + 64;
    [self loadData:_keyword];
}
-(void)loadData:(NSString *)keyword{
    NSString *url = [NSString stringWithFormat:@"/api/order/search/%@",[UserInfoAndShopModel sharedUserModel].shop.idField];
    [self.tableView.sy_loadingView beginRefreshing];
    [[HTTPSessionManager sharedManager] listPOST:url page:self.page parameters:@{@"keyword":keyword} callBack:^(ListModel *responseModel, id responseObject) {
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
                [self.tableView.sy_loadingView endRefreshing];
            }else{
                [self.tableView reloadData];
                [self.tableView.sy_loadingView endRefreshingWithNoDataString:kNoDataPromptText];
            }
        }else{
            [self.tableView.sy_loadingView endRefreshingWithErrorString:responseModel.message];
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
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake((ISX?88:64) + 64, 0, ISX?24:0, 0));
    }];
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(ISX?88:64);
        make.height.offset(64);
    }];
    [self.app_search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.searchView).insets(UIEdgeInsetsMake(10, 0, 10, 0));
    }];
}
//MARK:显示分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listArray.count;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    OrderListModel * model = [[OrderListModel alloc] initWithDictionary:self.listArray[section]];
    return model.order_goods.count;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderTableViewCell" owner:self options:nil] lastObject];
    OrderListModel * model = [[OrderListModel alloc] initWithDictionary:self.listArray[indexPath.section]];
    cell.model = model.order_goods[indexPath.row];
    return cell;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    OrderSectionHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"OrderSectionHeader" owner:self options:nil] lastObject];
    header.model = [[OrderListModel alloc] initWithDictionary:self.listArray[section]];
    return header;;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    OrderListModel *model = [[OrderListModel alloc] initWithDictionary:self.listArray[section]];
    if (model.type == 1) {//到店付
        if (model.status == 1) {//已完成
            OrderTodaySectionFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"OrderTodaySectionFooter" owner:self options:nil] lastObject];
            footer.model = model;
            return footer;
        }else if (model.status == 0){//未完成
            OrderTodaySectionFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"OrderTodaySectionFooter" owner:self options:nil] lastObject];
            footer.model = model;
            return footer;
        }
    }else if (model.type == 2){//在线付
        if (model.pay_status == 0) {//未支付
            return nil;
        }else if (model.pay_status == 1){//已支付
            
            if (model.is_hexiao == 0) {//未核销
                __weak typeof(self) weakSelf = self;
                UncancelledOrdersSectionFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"UncancelledOrdersSectionFooter" owner:self options:nil] lastObject];
                footer.model = model;
                footer.reloadData = ^{
                    [weakSelf loadData:weakSelf.keyword];
                };
                return footer;
            }else if (model.is_hexiao == 1){//已核销
                CompletedOrderSectionFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"CompletedOrderSectionFooter" owner:self options:nil] lastObject];
                footer.model = model;
                return footer;
            }
            if (model.is_comment == 0){//未评价
                CompletedOrderSectionFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"CompletedOrderSectionFooter" owner:self options:nil] lastObject];
                footer.model = model;
                return footer;
            }else  if (model.is_comment == 1){//已评价
                CompletedOrderSectionFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"CompletedOrderSectionFooter" owner:self options:nil] lastObject];
                footer.model = model;
                return footer;
            }else{//退款售后
                RefundAfterSaleSectionFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"RefundAfterSaleSectionFooter" owner:self options:nil] lastObject];
                footer.model = [[OrderListModel alloc] initWithDictionary:self.listArray[section]];
                return footer;
            }
        }
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    OrderListModel *model = [[OrderListModel alloc] initWithDictionary:self.listArray[section]];
    if (model.type == 1) {//到店付
        if (model.status == 1) {//已完成
           
            return 50;
        }else if (model.status == 0){//未完成
            return 50;
        }
    }else if (model.type == 2){//在线付
        if (model.pay_status == 0) {//未支付
            return 0;
        }else if (model.pay_status == 1){//已支付
            
            if (model.is_hexiao == 0) {//未核销
                return 50;
            }else if (model.is_hexiao == 1){//已核销
                return 70;
            }
            if (model.is_comment == 0){//未评价
                return 70;
            }else  if (model.is_comment == 1){//已评价
                return 70;
            }else{//退款售后
                return 70;
            }
        }
    }
    return 50;
}
-(void)APP_Search_ViewWithString:(NSString *)string{
    self.page = 1;
    _keyword = string;
    [self loadData:_keyword];
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = [UIView new];
        __weak typeof(self) weakSelf = self;
        _tableView.mj_footer = [XCRefreshFooter footerWithRefreshingBlock:^{
            [weakSelf loadData:weakSelf.keyword];
        }];
        YZRefreshHeader *refreshHeader = [YZRefreshHeader headerWithRefreshingBlock:^{
            weakSelf.page = 1;
            [weakSelf loadData:weakSelf.keyword];
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
        _app_search.searchType = AppSearchTypeFour;
    }
    return _app_search;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
