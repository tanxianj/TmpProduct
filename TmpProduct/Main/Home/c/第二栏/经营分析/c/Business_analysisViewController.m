//
//  Business_analysisViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "Business_analysisViewController.h"
#import "Business_analysisTableViewCell.h"

@interface Business_analysisViewController ()<UITableViewDelegate,UITableViewDataSource,Business_analysisTableViewCellDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) NSString * start_time;
@property (nonatomic, strong) NSString * end_time;
@property (nonatomic, strong) NSString * date_typeStr;
@property (nonatomic, strong) Business_analysisModel * model;
@end

@implementation Business_analysisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _date_typeStr = @"1";
    self.model = [[Business_analysisModel alloc]init];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    self.tableView.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadDataType:weakSelf.date_typeStr];
    }];
    [self LoadDataType:_date_typeStr];
}
-(void)LoadDataType:(NSString *)date_type{
/*
 date_type:
    1 今日数据
    2 本月数据
    3 指定时间段【为3时候，start_time,end_tiem必传】

    */
    [self.tableView.sy_loadingView beginRefreshing];
    [LoadingView showWithMessage:kWaiting];
    NSString *url = [NSString stringWithFormat:@"/api/system/statistics/%@",[UserInfoAndShopModel sharedUserModel].shop.idField];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if ([date_type integerValue]>2) {
        [dic setObject:_start_time forKey:@"start_time"];
        [dic setObject:_end_time forKey:@"end_time"];
    }
    [dic setObject:date_type forKey:@"date_type"];
    [[HTTPSessionManager sharedManager] POST:url parameters:dic callBack:^(RespondModel *responseModel) {
        [LoadingView hidden];
        if (responseModel.status ==200) {
            self.model = [[Business_analysisModel alloc]initWithDictionary:responseModel.data];
            [self.tableView reloadData];
            [self.tableView.sy_loadingView endRefreshing];
        }else{
//            [XCToast showWithMessage:responseModel.message];
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
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Business_analysisTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Business_analysisTableViewCell" owner:self options:nil] lastObject];
    cell.model = self.model;
    cell.delegate = self;
    cell.tmpstart_time = _start_time;
    cell.tmpend_time = _end_time;
    cell.date_type = _date_typeStr;
    
    return cell;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)Business_analysisTableViewCell:(NSString *)date_type start_time:(NSString *)start_time end_tiem:(NSString *)end_tiem{
    _start_time = start_time;
    _end_time = end_tiem;
    _date_typeStr = date_type;
    [self LoadDataType:_date_typeStr];
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
