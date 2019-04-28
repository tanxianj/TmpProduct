//
//  AddGoodsViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "AddGoodsViewController.h"
#import "Add_Goods_List_ImageTableViewCell.h"
#import "Add_Goods_dIan_TextFLdTableViewCell.h"
#import "AddGoodsSectionHeaderView.h"
#import "XCImageUploadView.h"
#import "NSArray+JSON.h"
#import "TXJToslView.h"
#import "AddShopFooterViewTableViewCell.h"

@interface AddGoodsViewController ()<UITableViewDelegate,UITableViewDataSource,APP_Lab_TextFld_TableViewCellDelagate,AddGoodsSectionHeaderViewDelegate,Add_Goods_dIan_TextFLdTableViewCellDelegate,AddShopFooterViewTableViewCellDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * btnSuperView;
@property (nonatomic, strong) UIButton * addBtn;
@property (nonatomic, strong) NSMutableArray * goodDetailArray;
@property (nonatomic, strong) NSMutableArray * goodNoticeArray;
@property (nonatomic, strong) XCImageUploadView * upLoadView;
@property (nonatomic, strong) NSMutableDictionary * dicH;
@end

@implementation AddGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    [self.listArray addObjectsFromArray:@[
                                          @[@{}],
                                          @[@{
                                                @"title":@"商品名称",
                                                @"desc":@"请输入商品名称",
                                                },
                                            @{
                                                @"title":@"商品简码",
                                                @"desc":@"请输入简码(选填)",
                                                },
                                            @{
                                                @"title":@"商品单价",
                                                @"desc":@"请输入商品单价",
                                                },
                                            ],
                                          self.goodDetailArray,
                                          self.goodNoticeArray,
                                          @[@{
                                                @"title":@"是否开启预约",
                                                @"desc":@"请选择是否开启预约",
                                                },
                                            @{
                                                @"title":@"是否上架",
                                                @"desc":@"请选择是否上架",
                                                },
                                            @{
                                                @"title":@"是否推荐",
                                                @"desc":@"请选择是否推荐",
                                                },
                                            @{
                                                @"title":@"是否开启库存",
                                                @"desc":@"请选择是否开启库存",
                                                },
                                            @{
                                                @"title":@"商品库存数量(开启库存必填)",
                                                @"desc":@"请输入商品库存数量",
                                                },
                                            @{},]
                                          ]];
    if (_goodsType == GoodsTypeAdd) {
        _addModel = [[AddGoodsListModel alloc]init];
        [self defaultNavigationBarSetWithTitle:@"新增商品"];
    }else{
        [self defaultNavigationBarSetWithTitle:@"编辑商品" Right:@"删除" rightItemBlock:^{
            txjLog(@"删除");
            [TXJToslView showToslViewWithContent:@"你确定要删除该商品吗?" leftAction:nil rightAction:^{
                NSString *url = [NSString stringWithFormat:@"/api/goods/del/%@",weakSelf.addModel.idField];
                [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
                    [XCToast showWithMessage:responseModel.message];
                    if (responseModel.status == 200) {
                        [weakSelf.navigationController popViewControllerAnimated:YES];
                    }
                }];
            }];
        }];
    }
}
//MARK:初始化子视图
- (void)initializeSubViews{
    _btnSuperView = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
    _addBtn = [BaseClassTool buttonWithFont:14.0 titleColor:UIColor.whiteColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter title:_goodsType==GoodsTypeAdd?@"添加商品":@"编辑商品"];
    __weak typeof(self) weakSelf = self;
    [_addBtn txj_addEventHandler:^{
        [weakSelf.view endEditing:YES];
        if (weakSelf.goodsType == GoodsTypeAdd) {
            weakSelf.addModel.goods_img = [weakSelf.upLoadView.fileNameArray toJSONString];
            weakSelf.addModel.goods_content = [weakSelf.goodDetailArray toJSONString];
            weakSelf.addModel.purchase_notes = [weakSelf.goodNoticeArray toJSONString];
            weakSelf.addModel.shop_id = [UserInfoAndShopModel sharedUserModel].shop.idField;;
            txjLog(@"%@---%@---%@",weakSelf.addModel.goods_img,weakSelf.addModel.goods_content,weakSelf.addModel.purchase_notes);
            if (weakSelf.addModel.is_inventory == 1 && [weakSelf.addModel.goods_num integerValue] == -1) {
                [XCToast showWithMessage:@"请输入商品库存数量"];
                return;
            }
            if (![weakSelf.addModel.goods_tags hasPrefix:@"["]) {
                NSMutableArray *tmpArray = [NSMutableArray array];
                NSArray *array = [weakSelf.addModel.goods_tags componentsSeparatedByString:@","];
                for (NSString *str in array) {
                    if (str.length) {
                        [tmpArray addObject:str];
                    }
                }
                weakSelf.addModel.goods_tags = [tmpArray toJSONString];
            }
            [[HTTPSessionManager sharedManager] POST:@"/api/goods/create" parameters:[weakSelf.addModel toDictionary] callBack:^(RespondModel *responseModel) {
                [XCToast showWithMessage:responseModel.message];
                if (responseModel.status == 200) {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }
            }];
        }else{
            weakSelf.addModel.goods_img = [weakSelf.upLoadView.fileNameArray toJSONString];
            weakSelf.addModel.goods_content = [weakSelf.goodDetailArray toJSONString];
            weakSelf.addModel.purchase_notes = [weakSelf.goodNoticeArray toJSONString];
            txjLog(@"%@---%@---%@",weakSelf.addModel.goods_img,weakSelf.addModel.goods_content,weakSelf.addModel.purchase_notes);
            if (weakSelf.addModel.is_inventory == 1 && [weakSelf.addModel.goods_num integerValue] == -1) {
                [XCToast showWithMessage:@"请输入商品库存数量"];
                return;
            }
            if (![weakSelf.addModel.goods_tags hasPrefix:@"["]) {
                NSMutableArray *tmpArray = [NSMutableArray array];
                NSArray *array = [weakSelf.addModel.goods_tags componentsSeparatedByString:@","];
                for (NSString *str in array) {
                    if (str.length) {
                        [tmpArray addObject:str];
                    }
                }
                weakSelf.addModel.goods_tags = [tmpArray toJSONString];
            }
            NSString *url = [NSString stringWithFormat:@"/api/goods/update/%@",weakSelf.addModel.idField];
            [[HTTPSessionManager sharedManager] POST:url parameters:[weakSelf.addModel toDictionary] callBack:^(RespondModel *responseModel) {
                [XCToast showWithMessage:responseModel.message];
                if (responseModel.status == 200) {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }
            }];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    _addBtn.backgroundColor = UIColor.appBlueColor;
    self.addBtn.layer.masksToBounds = YES;
    self.addBtn.layer.cornerRadius = 22;
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.btnSuperView];
    [self.btnSuperView addSubview:self.addBtn];
    [self.view addSubview:self.tableView];
}
//MARK:设置约束
- (void)setupSubViewMargins{
    [self.btnSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_offset(64);
        make.bottom.equalTo(self.view.mas_bottom).offset(ISX?-24:0);
    }];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.btnSuperView).insets(UIEdgeInsetsMake(10, 12, 10, 12));
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(([UIDevice currentDevice].isX?88:64), 0, ISX?24:0, 0));
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(ISX?88:64);
        make.bottom.equalTo(self.btnSuperView.mas_top);
    }];
}
//MARK:显示分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listArray.count;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    GoodsListType lisType = section;
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.listArray[lisType]];
    return array.count;
    return 0;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    GoodsListType lisType = indexPath.section;
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.listArray[lisType]];
    switch (lisType) {
        case GoodsListTypeOne:{
            Add_Goods_List_ImageTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Add_Goods_List_ImageTableViewCell" owner:self options:nil] lastObject];
            [cell.contentView addSubview:self.upLoadView];
            [self.upLoadView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(cell.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
            }];
            return cell;
        }break;
        case GoodsListTypeTwo:{
            APP_Lab_TextFld_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
            cell.indexPath = indexPath;
            cell.delegate = self;
            cell.model = array[indexPath.row];
            switch (indexPath.row) {
                case 0:{
                    cell.textFld.text = _addModel.goods_name?[NSString stringWithFormat:@"%@", _addModel.goods_name]:@"";
                }break;
                case 1:{
                    cell.textFld.text = _addModel.goods_jm?[NSString stringWithFormat:@"%@", _addModel.goods_jm]:@"";
                    cell.textFld.keyboardType = UIKeyboardTypeEmailAddress;
                }break;
                case 2:{
                    cell.textFld.text = _addModel.goods_price?[NSString stringWithFormat:@"%@", _addModel.goods_price]:@"";
                    cell.textFld.keyboardType = UIKeyboardTypeDecimalPad;
                }break;
                default:
                    break;
            }
            return cell;
        }break;
        case GoodsListTypeThree:{
            Add_Goods_dIan_TextFLdTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Add_Goods_dIan_TextFLdTableViewCell" owner:self options:nil] lastObject];
            cell.textFld.placeholder = @"请输入商品详情";
            cell.textFld.text = self.goodDetailArray[indexPath.row];
            cell.indexPath = indexPath;
            cell.delegate = self;
            return cell;
        }break;
        case GoodsListTypeFour:{
            Add_Goods_dIan_TextFLdTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"Add_Goods_dIan_TextFLdTableViewCell" owner:self options:nil] lastObject];
            cell.textFld.placeholder = @"请输入购买须知";
            cell.indexPath = indexPath;
            cell.textFld.text = self.goodNoticeArray[indexPath.row];
            cell.delegate = self;
            return cell;
        }break;
        case GoodsListTypeFive:{
            if (indexPath.row == 5) {
                AddShopFooterViewTableViewCell *cell =[[[NSBundle mainBundle] loadNibNamed:@"AddShopFooterViewTableViewCell" owner:self options:nil] lastObject];
                NSArray *array = self.addModel.goods_tags.length?[self.addModel.goods_tags componentsSeparatedByString:@","]:@[];
                NSMutableArray *tmparray = [NSMutableArray array];
//                NSMutableArray *tmparrayTwo = [NSMutableArray array];
                for (NSString *str in array) {
                    if (str.length) {
                        [tmparray addObject:@{@"id":str}];
//                        [tmparrayTwo addObject:str];
                    }
                }
                cell.titleLab.text = @"商品标签";
                cell.ServerData = tmparray;
                static dispatch_once_t disOnceAddGoods;
            
                dispatch_once(&disOnceAddGoods,^ {
                    //只执行一次的代码
//                    self.addModel.goods_tags = [tmparrayTwo toJSONString];
                });
                cell.tagsType = @"1";
                cell.indexPath = indexPath;
                cell.delegate =self;
                return cell;
            }else if (indexPath.row == 4) {
                APP_Lab_TextFld_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
                cell.indexPath = indexPath;
                cell.delegate = self;
                cell.model = array[indexPath.row];
                if (_addModel.is_inventory==1) {
                    cell.textFld.userInteractionEnabled = YES;
                    if (self.addModel.goods_num) {
                        if ([self.addModel.goods_num integerValue] == -1) {
                            cell.textFld.text = @"";
                        }else{
                            cell.textFld.text = [NSString stringWithFormat:@"%@",self.addModel.goods_num];
                        }
                    }else{
                       cell.textFld.text = @"";
                    }
//                    cell.textFld.text = [self.addModel.goods_num integerValue]!= -1 ?[NSString stringWithFormat:@"%@",self.addModel.goods_num]:@"";
                    cell.textFld.keyboardType = UIKeyboardTypeDecimalPad;
                }else{
                    cell.textFld.text = @"无限库存";
                    cell.textFld.userInteractionEnabled = NO;
                }
                return cell;
            }else{
                APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                cell.model = array[indexPath.row];
                NSArray *tmpArray = @[@"否",@"是"];
                [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                    [YZActionSheet showActionSheetWithNotice:array[indexPath.row][@"desc"] titles:tmpArray selected:^(NSInteger idx) {
                        switch (indexPath.row) {
                            case 0:{
                                weakSelf.addModel.is_yuyue = idx;
                                cell.select_status_str = tmpArray[idx];
                            }break;
                            case 1:{
                                weakSelf.addModel.is_on_sale = idx;
                                cell.select_status_str = tmpArray[idx];
                            }break;
                            case 2:{
                                weakSelf.addModel.is_recommend = idx;
                                cell.select_status_str = tmpArray[idx];
                            }break;
                            case 3:{
                                weakSelf.addModel.is_inventory = idx;
                                cell.select_status_str = tmpArray[idx];
//                                [UIView performWithoutAnimation:^{
                                    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:GoodsListTypeFive] withRowAnimation:UITableViewRowAnimationNone];
//                                }];
                                
                            }break;
                            default:
                                break;
                        }
                    }];
                }];
                
                switch (indexPath.row) {
                    case 0:{
                        cell.select_status_str = self.addModel.is_yuyue?@"是":@"否";
                    }break;
                    case 1:{
                        cell.select_status_str = self.addModel.is_on_sale?@"是":@"否";
                    }break;
                    case 2:{
                        cell.select_status_str = self.addModel.is_recommend?@"是":@"否";
                    }break;
                    case 3:{
                        cell.select_status_str = self.addModel.is_inventory?@"是":@"否";
                    }break;
                    default:
                        break;
                }
                return cell;
            }
        }break;
        default:
            break;
    }
    return nil;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsListType lisType = indexPath.section;
    switch (lisType) {
        case GoodsListTypeOne:{
            return 100;
        }break;
        case GoodsListTypeTwo:{
            return 50;
        }break;
        case GoodsListTypeThree:{
            return 50;
        }break;
        case GoodsListTypeFour:{
            return 50;
        }break;
        case GoodsListTypeFive:{
            switch (indexPath.row) {
                case 5:{
                    if (self.dicH[indexPath]) {
                        NSNumber *num = self.dicH[indexPath];
                        return [num floatValue]+20;
                    } else {
                        return 60;
                    }
                    return 100;
            }break;
                    
                default:
                    return 50;
                    break;
            }
            return 50;
        }break;
        default:
            break;
    }
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    GoodsListType lisType = section;
    switch (lisType) {
        case GoodsListTypeOne:
        case GoodsListTypeTwo:
        case GoodsListTypeFive:{
            return [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];;
        }break;
        case GoodsListTypeThree:{
            AddGoodsSectionHeaderView *header = [[[NSBundle mainBundle] loadNibNamed:@"AddGoodsSectionHeaderView" owner:self options:nil] lastObject];
            header.section = section;
            header.delegate = self;
            header.titleLab.text = @"商品详情";
            return header;
        }break;
        case GoodsListTypeFour:{
            AddGoodsSectionHeaderView *header = [[[NSBundle mainBundle] loadNibNamed:@"AddGoodsSectionHeaderView" owner:self options:nil] lastObject];
            header.section = section;
            header.delegate = self;
            header.titleLab.text = @"购买须知";
            return header;
        }break;
        
        default:
            break;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    GoodsListType lisType = section;
    switch (lisType) {
        case GoodsListTypeOne:
        case GoodsListTypeTwo:
        case GoodsListTypeFive:{
            return 10;
        }break;
        case GoodsListTypeThree:
        case GoodsListTypeFour:{
            return 44;
        }break;
        default:
            break;
    }
    return kOnePx;
}
-(void)APP_Lab_TextFld_TableViewCellWithString:(NSString *)string indexPath:(NSIndexPath *)indexpath{
    GoodsListType type = indexpath.section;
    if (type == GoodsListTypeTwo) {
        switch (indexpath.row) {
            case 0:{
                _addModel.goods_name = string;
            }break;
            case 1:{
                _addModel.goods_jm = string;
            }break;
            case 2:{
                _addModel.goods_price = string;
            }break;
            default:
                break;
        }
        
        
    }else if (type == GoodsListTypeFive){
        switch (indexpath.row) {
            case 4:
                _addModel.goods_num = string;
                break;
            default:
                break;
        }
    }
}
-(void)AddGoodsSectionHeaderView:(NSInteger)section{
    [UIView performWithoutAnimation:^{
        if (section == 2) {
            [self.goodDetailArray addObject:@""];
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
        }else{
            [self.goodNoticeArray addObject:@""];
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationNone];
        }
    }];
    
    
    
}
-(void)Add_Goods_dIan_TextFLdTableViewCell:(NSIndexPath *)indexPath{
    [UIView performWithoutAnimation:^{
        if (indexPath.section==2) {
            [self.goodDetailArray removeObjectAtIndex:indexPath.row];
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
        }else{
            [self.goodNoticeArray removeObjectAtIndex:indexPath.row];
            [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationNone];
        }
    }];
}
-(void)Add_Goods_dIan_TextFLdTableViewCell:(NSIndexPath *)indexPath string:(NSString *)string{
    if (indexPath.section == 2) {
        [self.goodDetailArray replaceObjectAtIndex:indexPath.row withObject:string];
    }else{
        [self.goodNoticeArray replaceObjectAtIndex:indexPath.row withObject:string];
    }
}
/**
 * 动态改变UITableViewCell的高度
 */
- (void)updateTableViewCellHeight:(AddShopFooterViewTableViewCell *)cell andheight:(CGFloat)height andIndexPath:(NSIndexPath *)indexPath{
    if (![self.dicH[indexPath] isEqualToNumber:@(height)]) {
        self.dicH[indexPath] = @(height);
        [self.tableView reloadData];
    }
}


/**
 * 点击UICollectionViewCell的代理方法
 */
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath withContent:(NSArray *)selectArray{
    GoodsListType type = indexPath.section;
    if (type == GoodsListTypeFive && indexPath.row == 5) {
        self.addModel.goods_tags = [selectArray toJSONString].length>4?[selectArray toJSONString]:@"";
        txjLog(@" self.addShopModel.business_tag is %@",self.addModel.goods_tags);
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
-(NSMutableArray *)goodDetailArray{
    if (!_goodDetailArray) {
        
        if (_goodsType == GoodsTypeAdd) {
            _goodDetailArray = [NSMutableArray array];
        }else{
            _goodDetailArray =  [NSMutableArray array];
            NSArray *array = (NSArray *)_addModel.goods_content;
            if (array.count) {
                [_goodDetailArray addObjectsFromArray:array];
            }
            
            
        }
    }
    return _goodDetailArray;
}
-(NSMutableArray *)goodNoticeArray{
    if (!_goodNoticeArray) {
        if (_goodsType == GoodsTypeAdd) {
            _goodNoticeArray =  [NSMutableArray array];
        }else{
            _goodNoticeArray =  [NSMutableArray array];
            NSArray *array = (NSArray *)_addModel.purchase_notes;
            if (array.count) {
                [_goodNoticeArray addObjectsFromArray:array];
            }
        }
        
    }
    return _goodNoticeArray;
}
-(XCImageUploadView *)upLoadView{
    if (!_upLoadView) {
        if (_goodsType == GoodsTypeAdd) {
            _upLoadView = [[XCImageUploadView alloc]init];
            _upLoadView.tipsLabel.text = @"请选择商品图片";
        }else{
            NSArray * array = (NSArray *)_addModel.goods_img;
            _upLoadView = [[XCImageUploadView alloc]initWithImageUrlArray:array canUpload:YES];
            _upLoadView.tipsLabel.text = @"";
        }
        
    }
    return _upLoadView;
}
- (NSMutableDictionary *)dicH {
    if (!_dicH) {
        _dicH = [[NSMutableDictionary alloc] init];
    }
    return _dicH;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
