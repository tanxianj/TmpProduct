//
//  MyStaffViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "MyStaffViewController.h"
#import "MyStaffTableViewCell.h"
#import "AddMyStaffViewController.h"

@interface MyStaffViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) TableView * tableView;
@end

@implementation MyStaffViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    self.navcBar.rightItem = [UIImage imageNamed:@"add"];
    self.navcBar.rightBlock = ^{
        txjLog(@"店员ADD");
        AddMyStaffViewController *vc = [AddMyStaffViewController new];
        vc.MyStaffType = 0;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    self.tableView.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadData];
    }];
    [self LoadData];
}
-(void)LoadData{
    [self.tableView.sy_loadingView beginRefreshing];
    [[HTTPSessionManager sharedManager] listPOST:@"/api/manager/adminlist" page:self.page parameters:@{@"merchant_id":[UserModel sharedUserModel].merchant_id} callBack:^(ListModel *responseModel, id responseObject) {
        
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
                [self.tableView.sy_loadingView endRefreshingWithNoDataString:kNoDataPromptText];
            }
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
    MyStaffTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MyStaffTableViewCell" owner:self options:nil] lastObject];
    cell.model = [[MyStaffModel alloc]initWithDictionary:self.listArray[indexPath.row]];
    return cell;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MyStaffTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    AddMyStaffViewController *vc = [AddMyStaffViewController new];
    vc.MyStaffType = 1;
    vc.idStr = [NSString stringWithFormat:@"%li",cell.model.idField];
    vc.model = [[AddMyStaffModel alloc]initWithDictionary:[cell.model toDictionary]];
    [self.navigationController pushViewController:vc animated:YES];
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
        header.frame = CGRectMake(0, 0, kScreenWidth, 10);
        _tableView.tableHeaderView = header;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
