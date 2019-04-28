//
//  OrderCommentDetailViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/24.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "OrderCommentDetailViewController.h"
#import "OrderCommentModel.h"
#import "OrderCommentTableViewCell.h"

@interface OrderCommentDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) OrderCommentModel * model;
@end

@implementation OrderCommentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self defaultNavigationBarSetWithTitle:@"评论详情"];
    __weak typeof(self) weakSelf = self;
    self.tableView.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadData];
    }];
    [self LoadData];
}
-(void)LoadData{
    [self.tableView.sy_loadingView beginRefreshing];
    NSString *url = [NSString stringWithFormat:@"/api/order/comment/%@",_idStr];
    [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
        if (responseModel.status == 200) {
            self.model = [[OrderCommentModel alloc]initWithDictionary:responseModel.data];
            [self.tableView reloadData];
            [self.tableView.sy_loadingView endRefreshing];
        }else{
            [self.tableView.sy_loadingView endRefreshingWithErrorString:responseModel.message];
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
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake((ISX?88:64), 0, (ISX?24:0), 0));
    }];
}
//MARK:显示分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderCommentTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderCommentTableViewCell" owner:self options:nil] lastObject];
    cell.model = self.model;
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
    return  [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
