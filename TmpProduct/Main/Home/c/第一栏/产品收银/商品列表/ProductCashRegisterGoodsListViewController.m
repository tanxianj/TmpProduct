//
//  ProductCashRegisterGoodsListViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ProductCashRegisterGoodsListViewController.h"
#import "ProductCashRegisterTableViewCell.h"

@interface ProductCashRegisterGoodsListViewController ()<UITableViewDelegate,UITableViewDataSource,ProductCashRegisterTableViewCellDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * btnView;
@property (nonatomic, strong) UIButton * btnGoPay;

@end

@implementation ProductCashRegisterGoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self defaultNavigationBarSetWithTitle:@"商品列表"];
    __weak typeof(self) weakSelf = self;
    self.view.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
        [weakSelf LoadData];
    }];
    self.view.sy_loadingView.offsetY = ISX?88:64;
    [self LoadData];
}
-(void)LoadData{
    [[HTTPSessionManager sharedManager] listPOST:@"/api/goods/list" page:self.page parameters:@{@"shop_id":[UserInfoAndShopModel sharedUserModel].shop.idField} callBack:^(ListModel *responseModel, id responseObject) {
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
    _btnView = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
    self.btnView.frame = CGRectMake(0, 0, kScreenWidth, 64);
    _btnGoPay = [self BtnWithBackGroundColor:UIColor.appBlueColor title:@"确定"];
    __weak typeof(self) weakSelf = self;
    [self.btnGoPay txj_addEventHandler:^{
        txjLog(@"结账");
        [weakSelf SelectfinishBackViweController];
    } forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)SelectfinishBackViweController{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(goodsListArray:goodsinfoArray:)]) {
        [self.delegate goodsListArray:self.goodsListArray.copy goodsinfoArray:self.goodsInfoArray.copy];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.btnView];
    [self.btnView addSubview:self.btnGoPay];
    [self.view addSubview:self.tableView];
}
//MARK:设置约束
- (void)setupSubViewMargins{
    [self.btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.offset(64);
        make.bottom.equalTo(self.view.mas_bottom).offset(ISX?-24:0);
    }];
    
    
    [self.btnGoPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btnView.mas_left).offset(12);
        make.top.equalTo(self.btnView).offset(10);
        make.height.offset(44);
        make.width.offset(kScreenWidth-24);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(ISX?88:64);
        make.bottom.equalTo(self.btnView.mas_top);
    }];
}
-(UIButton *)BtnWithBackGroundColor:(UIColor *)color title:(NSString *)title{
    UIButton *btn = [BaseClassTool buttonWithFont:14.0 titleColor:UIColor.whiteColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter title:title];
    btn.backgroundColor = color;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 22;
    return btn;
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
    ProductCashRegisterTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductCashRegisterTableViewCell" owner:self options:nil] lastObject];
    cell.model = [[GoodsListModel alloc]initWithDictionary:self.listArray[indexPath.row]];
    cell.delegate = self;
    for (NSDictionary *dic in self.goodsInfoArray) {
        GoodsCheckoutModel * tmpModel = [[GoodsCheckoutModel alloc]initWithDictionary:dic];
        NSString *tmpidStr = [NSString stringWithFormat:@"%@",tmpModel.goods_id];
        NSString *cellidStr = [NSString stringWithFormat:@"%li",cell.model.idField];
        if ([tmpidStr isEqualToString:cellidStr]) {
            cell.goodsSlectNum = [tmpModel.goods_num integerValue];
        }
    }
    txjLog(@"------%@",self.goodsListArray);
    return cell;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)ProductCashRegisterTableViewCell:(GoodsCheckoutModel *)goodsCheckModel GoodsListModel:(GoodsListModel *)goodsListModel{
    GoodsCheckoutModel *tmpMode = [[GoodsCheckoutModel alloc]init];
    if (self.goodsInfoArray.count) {
        BOOL have = NO;
        NSInteger idex = 0;
        for (int i =0; i<self.goodsInfoArray.count; i++) {
            GoodsCheckoutModel *model = [[GoodsCheckoutModel alloc]initWithDictionary:self.goodsInfoArray[i]];
            NSString *tmpidStr = [NSString stringWithFormat:@"%@",goodsCheckModel.goods_id];
            NSString *tmpTwoidStr = [NSString stringWithFormat:@"%@",model.goods_id];
            if ([tmpidStr isEqualToString:tmpTwoidStr]) {
                have = YES;
                tmpMode = model;
                idex = i;
            }
        }
        if (have) {
            if ([goodsCheckModel.goods_num integerValue] == 0) {
                [self.goodsInfoArray removeObject:[tmpMode toDictionary]];
                [self.goodsListArray removeObject:[goodsListModel toDictionary]];
            }else{
                [self.goodsInfoArray replaceObjectAtIndex:idex withObject:[goodsCheckModel toDictionary]];
                if (![self.goodsListArray containsObject:[goodsListModel toDictionary]]) {
                    [self.goodsListArray addObject:[goodsListModel toDictionary]];
                }
            }
            
        }else{
            [self.goodsInfoArray addObject:[goodsCheckModel toDictionary]];
            [self.goodsListArray addObject:[goodsListModel toDictionary]];
        }
    }else{
        [self.goodsInfoArray addObject:[goodsCheckModel toDictionary]];
        [self.goodsListArray addObject:[goodsListModel toDictionary]];
    }
    [self.tableView reloadData];
    for (NSDictionary *dic in self.goodsInfoArray) {
        txjLog(@"self.goodsInfoArray is %@\t",dic);
    }
    
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
-(NSMutableArray <NSDictionary *>*)goodsInfoArray{
    if (!_goodsInfoArray) {
        _goodsInfoArray = [NSMutableArray array];
    }
    return _goodsInfoArray;
}
-(NSMutableArray <NSDictionary *>*)goodsListArray{
    if (!_goodsListArray) {
        _goodsListArray = [NSMutableArray array];
    }
    return _goodsListArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
