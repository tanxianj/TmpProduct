//
//  CompletedOrderViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "RefundAfterSaleViewController.h"
#import "OrderTableViewCell.h"
#import "OrderListModel.h"
#import "OrderSectionHeader.h"
#import "UncancelledOrdersSectionFooter.h"
#import "RefundAfterSaleSectionFooter.h"

@interface RefundAfterSaleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) TableView * tableView;
@end

@implementation RefundAfterSaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    self.view.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadData];
    }];
    [self LoadData];
}
-(void)LoadData{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"1" forKey:@"refund"];
    [dic setObject:@"2" forKey:@"type"];
    NSString *url = [NSString stringWithFormat:@"/api/order/list/%@",[UserInfoAndShopModel sharedUserModel].shop.idField];
    [[HTTPSessionManager sharedManager] listPOST:url page:self.page parameters:dic callBack:^(ListModel *responseModel, id responseObject) {
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
                [self.tableView reloadData]; [self.view.sy_loadingView endRefreshingWithNoDataString:kNoDataPromptText];
            }
        }else{
            [self.view.sy_loadingView endRefreshingWithErrorString:responseModel.message];
        }
    }];
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
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 44, 0));
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
    RefundAfterSaleSectionFooter *footer = [[[NSBundle mainBundle] loadNibNamed:@"RefundAfterSaleSectionFooter" owner:self options:nil] lastObject];
    footer.model = [[OrderListModel alloc] initWithDictionary:self.listArray[section]];
    return footer;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 70;
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



@end
