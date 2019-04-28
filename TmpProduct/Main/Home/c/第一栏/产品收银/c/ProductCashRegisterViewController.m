//
//  ProductCashRegisterViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ProductCashRegisterViewController.h"
#import "ProductCashRegisterTableViewCell.h"
#import "ProductCashRegisterGoodsListViewController.h"
#import "KuaiSuSYViewController.h"

@interface ProductCashRegisterViewController ()<UITableViewDelegate,UITableViewDataSource,ProductCashRegisterGoodsListViewControllerDelegate,ProductCashRegisterTableViewCellDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * btnView;
@property (nonatomic, strong) UIButton * btnGoPay;
@property (nonatomic, strong) NSMutableArray<NSDictionary *> * goodsInfoArray;
@property (nonatomic, strong) NSMutableArray <NSDictionary *> * goodsListArray;
@end

@implementation ProductCashRegisterViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    self.tableView.sy_loadingView = [SYDefaultView loadingViewWithDefaultRefreshingBlock:^{
         [weakSelf UserAddGoods];
    }];
//    [self UserAddGoods];
    self.tableView.sy_loadingView.offsetY = 40;
    [self.tableView.sy_loadingView beginRefreshing];
    if (!self.goodsListArray.count) {
        self.tableView.sy_loadingView.needAppear = YES;
        [self.tableView.sy_loadingView endRefreshingWithErrorString:kNoDataPromptText];
    }else{
        [self.tableView reloadData];
        [self.tableView.sy_loadingView endRefreshing];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//MARK:初始化子视图
- (void)initializeSubViews{
    _btnView = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
    self.btnView.frame = CGRectMake(0, 0, kScreenWidth, 64);
    _btnGoPay = [self BtnWithBackGroundColor:UIColor.appBlueColor title:@"结账"];
    __weak typeof(self) weakSelf = self;
    [self.btnGoPay txj_addEventHandler:^{
        txjLog(@"结账");
        [weakSelf GoToPayViewController];
    } forControlEvents:UIControlEventTouchUpInside];
   
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.btnView];
    [self.btnView addSubview:self.btnGoPay];
    [self.view addSubview:self.tableView];
}

//MARK:结账
-(void)GoToPayViewController{
    KuaiSuSYViewController *vc = [KuaiSuSYViewController new];
    vc.type = FastCashRegisterTypeTwo;
    if (self.goodsInfoArray.count) {
        vc.goodsInfoArray = self.goodsInfoArray;
        [vc defaultNavigationBarSetWithTitle:@"产品收银"];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [XCToast showWithMessage:@"请选择商品"];
    }
    
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
    return self.goodsListArray.count;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductCashRegisterTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ProductCashRegisterTableViewCell" owner:self options:nil] lastObject];
    cell.delegate = self;
    cell.model = [[GoodsListModel alloc] initWithDictionary:self.goodsListArray[indexPath.row]];
    for (NSDictionary * dic in self.goodsInfoArray) {
        GoodsCheckoutModel * tmpModel = [[GoodsCheckoutModel alloc]initWithDictionary:dic];
        NSString *tmpidStr = [NSString stringWithFormat:@"%@",tmpModel.goods_id];
        NSString *cellidStr = [NSString stringWithFormat:@"%li",cell.model.idField];
        if ([tmpidStr isEqualToString:cellidStr]) {
            cell.goodsSlectNum = [tmpModel.goods_num integerValue];
        }
    }
    return cell;
}
-(void)ProductCashRegisterTableViewCell:(GoodsCheckoutModel *)goodsCheckModel GoodsListModel:(GoodsListModel *)goodsListModel{
    GoodsCheckoutModel *tmpMode = [[GoodsCheckoutModel alloc]init];
    if (self.goodsInfoArray.count) {
        BOOL have = NO;
        NSInteger idex = 0;
        for (int i =0; i<self.goodsInfoArray.count; i++) {
            NSDictionary *dic = [[NSDictionary alloc]init];
                dic = (NSDictionary *)self.goodsInfoArray[i];
            GoodsCheckoutModel *model =[[GoodsCheckoutModel alloc]initWithDictionary:dic];
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
//    for (GoodsCheckoutModel *model in self.goodsInfoArray) {
//        txjLog(@"self.goodsInfoArray is %@\t",[model toDictionary]);
//    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
    header.frame = CGRectMake(0, 0, kScreenWidth, 40);
    UILabel *lab = [BaseClassTool labelWithFont:13.0 textColor:UIColor.appTextDescColor textAlignment:NSTextAlignmentLeft];
    lab.text = @"待结账商品列表";
    UIButton *btn = [BaseClassTool buttonWithFont:13.0 titleColor:UIColor.appBlueColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentRight title:@"手动添加"];
    [header addSubview:lab];
    [header addSubview:btn];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(header);
        make.left.equalTo(header).offset(12);
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(header);
        make.right.equalTo(header).offset(-12);
    }];
    __weak typeof(self) weakSelf = self;
    [btn txj_addEventHandler:^{
        [weakSelf UserAddGoods];
    } forControlEvents:UIControlEventTouchUpInside];
    return header;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
//MARK:前去添加商品
-(void)UserAddGoods{
    txjLog(@"手动添加");
    ProductCashRegisterGoodsListViewController *vc = [ProductCashRegisterGoodsListViewController new];
    vc.delegate = self;
    vc.goodsListArray = self.goodsListArray;
    vc.goodsInfoArray = self.goodsInfoArray;
    [self.navigationController pushViewController:vc animated:YES];

}
-(void)goodsListArray:(NSArray<NSDictionary *> *)tmplistArray goodsinfoArray:(NSArray<NSDictionary *> *)tmpgoodsInfoArray{
    self.goodsListArray = nil;
    self.goodsInfoArray = nil;
    [self.goodsListArray addObjectsFromArray:tmplistArray];
    [self.goodsInfoArray addObjectsFromArray:tmpgoodsInfoArray];
    [self.tableView reloadData];
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
-(NSMutableArray <NSDictionary *> *)goodsListArray{
    if (!_goodsListArray) {
        _goodsListArray = [NSMutableArray array];
    }
    return _goodsListArray;
}
-(NSMutableArray <NSDictionary *> *)goodsInfoArray{
    if (!_goodsInfoArray) {
        _goodsInfoArray = [NSMutableArray array];
    }
    return _goodsInfoArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
