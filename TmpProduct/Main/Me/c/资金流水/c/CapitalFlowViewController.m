//
//  CapitalFlowViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "CapitalFlowViewController.h"
#import "CapitalFlowTableViewCell.h"
#import "CapitalFlowSectionHeaderView.h"
#import "CapitalFlowHeaderView.h"
#import "NSString+TimeString.h"

@interface CapitalFlowViewController ()<UITableViewDelegate,UITableViewDataSource,CapitalFlowHeaderViewDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) CapitalFlowSectionHeaderView * sectionHeader;
@property (nonatomic, strong) CapitalFlowHeaderView * tableViewHeader;

@property (nonatomic, strong) NSString * tmpYYMMStr;
@property (nonatomic, assign) BOOL loadStatusOne;
@property (nonatomic, assign) BOOL loadStatusTwo;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, strong) NSString * start_time;
@property (nonatomic, strong) NSString * end_time;
@end

@implementation CapitalFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _start_time = [NSString getMonthFirstAndLastDayWith:[NSString getNowTimeYY_MM_DD]][0];
    _end_time = [NSString getNowTimeYY_MM_DD];
    NSArray *str = [NSString getMonthFirstAndLastDayWith:[NSString getNowTimeYY_MM_DD]];
    txjLog(@"str is %@",str);
    _tmpYYMMStr = [NSString getNowTimeYY_MM];
    __weak typeof(self) weakSelf = self;
    self.view.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadMoreData];
    }];
    self.view.sy_loadingView.offsetY = ISX?88:64;
    
    [self LoadMoreData];
}
-(void)LoadMoreData{
    [self.view.sy_loadingView beginRefreshing];
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        [self LoadData:^{
            dispatch_group_leave(group);
        }];
    });
    
    
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        [self LoadDataTwo:^{
            dispatch_group_leave(group);
        }];
    });
    dispatch_group_notify(group, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self configData];
        });
    });
}
-(void)LoadDataTwo:(void(^)(void))complete{
    NSString *url = [NSString stringWithFormat:@"/api/system/ordercount/%@",[UserModel sharedUserModel].merchant_id];
    [[HTTPSessionManager sharedManager] POST:url parameters:@{/*@"month":_tmpYYMMStr,*/@"start_time":_start_time,@"end_time":_end_time} callBack:^(RespondModel *responseModel) {
        if (complete) {
            complete();
        }
        if (responseModel.status == 200) {
            self.tableViewHeader.model = [[CapitalFlowSectionHeaderModel alloc]initWithDictionary:responseModel.data];
            self.loadStatusTwo = YES;
        }else{
            self.tableViewHeader.model = [[CapitalFlowSectionHeaderModel alloc]initWithDictionary:@{}];
            self.loadStatusTwo = NO;
            self.message = responseModel.message;
        }
    }];
}
-(void)LoadData:(void(^)(void))complete{
    [self.view.sy_loadingView beginRefreshing];
     NSString *url = [NSString stringWithFormat:@"/api/system/orderlist/%@",[UserModel sharedUserModel].merchant_id];
    [[HTTPSessionManager sharedManager] listPOST:url page:self.page parameters:@{/*@"month":_tmpYYMMStr,*/@"start_time":_start_time,@"end_time":_end_time} callBack:^(ListModel *responseModel, id responseObject) {
         [LoadingView hidden];
         if (complete) {
             complete();
         }
         if ([self.tableView.mj_footer isRefreshing]) {
             [self.tableView.mj_footer endRefreshing];
         }
         if ([self.tableView.mj_header isRefreshing]) {
             [self.tableView.mj_header endRefreshing];
         }
         if (responseModel.status == 200) {
             self.loadStatusOne = YES;
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
//                 [self.view.sy_loadingView endRefreshing];
             }else{
//                 self.loadStatusOne = NO;
                 [self.tableView reloadData];
//                 self.view.sy_loadingView.offsetY = (ISX?88:64) + 270;
//                 self.view.sy_loadingView.needAppear = YES;
//                 [self.view.sy_loadingView endRefreshingWithNoDataString:kNoDataPromptText];
//                 self.message = kNoDataPromptText;
             }
         }else{
             self.loadStatusOne = NO;
             self.message = responseModel.message;
             
         }
     }];
}
-(void)configData{
    if (self.loadStatusOne&&self.loadStatusTwo) {
        [self.view.sy_loadingView endRefreshing];
    }else{
        [self.view.sy_loadingView endRefreshingWithErrorString:self.message];
    }
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
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(([UIDevice currentDevice].isX?88:64), 0, ISX?24:0, 0));
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
    CapitalFlowTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"CapitalFlowTableViewCell" owner:self options:nil] lastObject];
    cell.model = [[CapitalFlowListModel alloc]initWithDictionary:self.listArray[indexPath.row]];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionheader = [BaseClassTool viewWithBackgroundColor:UIColor.whiteColor];
    [sectionheader addSubview:self.tableViewHeader];
    [self.tableViewHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sectionheader);
    }];
    return sectionheader;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        UIView *header = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
        header.frame = CGRectMake(0, 0, kScreenWidth, 150);
        [header addSubview:self.sectionHeader];
        [self.sectionHeader mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(header);
        }];
        _tableView.tableHeaderView = header;
        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = [UIView new];
        __weak typeof(self) weakSelf = self;
        _tableView.mj_footer = [XCRefreshFooter footerWithRefreshingBlock:^{
            [weakSelf LoadMoreData];
        }];
        YZRefreshHeader *refreshHeader = [YZRefreshHeader headerWithRefreshingBlock:^{
            weakSelf.page = 1;
            [weakSelf LoadMoreData];
        }];
        _tableView.mj_header = refreshHeader;
        
    }
    return _tableView;
}
//MARK:CapitalFlowHeaderViewDelegate
-(void)backSelectDateString:(NSString *)start_time end_time:(NSString *)end_time{
    _start_time = start_time;
    _end_time = end_time;
    self.page = 1;
    [LoadingView showWithMessage:kWaiting];
    [self LoadMoreData];
}
-(CapitalFlowSectionHeaderView *)sectionHeader{
    if (!_sectionHeader) {
        _sectionHeader = [[[NSBundle mainBundle] loadNibNamed:@"CapitalFlowSectionHeaderView" owner:self options:nil] lastObject];
        
    }
    return _sectionHeader;
}
-(CapitalFlowHeaderView *)tableViewHeader{
    if (!_tableViewHeader) {
        _tableViewHeader = [[[NSBundle mainBundle] loadNibNamed:@"CapitalFlowHeaderView" owner:self options:nil] lastObject];
        _tableViewHeader.delegate = self;
    }
    return _tableViewHeader;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
