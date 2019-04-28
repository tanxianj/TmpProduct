//
//  Add_FullReduction_ElectronicPreferences_ViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "Add_FullReduction_ElectronicPreferences_ViewController.h"
#import "AddSeletTimeTableViewCell.h"
#import "AddMan_jian_TableViewCell.h"
#import "TXJSelectShopList.h"
#import "NSArray+JSON.h"

@interface Add_FullReduction_ElectronicPreferences_ViewController ()<UITableViewDelegate,UITableViewDataSource,APP_Lab_TextFld_TableViewCellDelagate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) NSString *shopName;
@end

@implementation Add_FullReduction_ElectronicPreferences_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _shopName = @"";
    if (_type==AddTypeOne) {
        _addOneModel = [[AddOneModel alloc]init];
        _addTwoModel = [[AddTwoModel alloc]init];
    }else{
//        将原有Str的转换成数组 在将数组转成JSon Str
        NSArray *id_array = [_addTwoModel.shop_id_str componentsSeparatedByString:@","];
        _addTwoModel.shop_id_str = [id_array toJSONString];
    }
    [self.listArray addObjectsFromArray:@[
                                          @[
                                              @{@"title":@"优惠名称",
                                                @"desc":@"请输入优惠名称"
                                                },
                                              @{@"title":@"开始时间",
                                                @"desc":@"请选择开始时间"
                                                },
                                              @{@"title":@"结束时间",
                                                @"desc":@"请选择结束时间"
                                                },
                                              @{@"title":@"",
                                                @"desc":@""
                                                },
                                              @{@"title":@"活动状态",
                                                @"desc":@"请选择活动状态"
                                                },
                                              @{@"title":@"描述",
                                                @"desc":@"请输入描述"
                                                },
                                              ],
                                          @[
                                              @{@"title":@"优惠名称",
                                                @"desc":@"请输入优惠名称"
                                                },
                                              @{@"title":@"开始时间",
                                                @"desc":@"请选择开始时间"
                                                },
                                              @{@"title":@"结束时间",
                                                @"desc":@"请选择结束时间"
                                                },
                                              @{@"title":@"优惠方式",
                                                @"desc":@"请选择优惠方式"
                                                },
                                              @{@"title":@"优惠券状态",
                                                @"desc":@"请选择优惠券状态"
                                                },
                                              @{@"title":@"优惠券金额",
                                                @"desc":@"请输入优惠券金额"
                                                },
                                              @{@"title":@"发放数量",
                                                @"desc":@"请输入发放数量"
                                                },
                                              @{@"title":@"发放方式",
                                                @"desc":@"请选择发放方式"
                                                },
                                              @{@"title":@"优惠店铺列表",
                                                @"desc":@"请选择优惠店铺列表"
                                                },
                                              @{@"title":@"描述",
                                                @"desc":@"请输入描述"
                                                },],
                                          ]];
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
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake((ISX?88:64), 0, 24, 0));
    }];
}
//MARK:显示分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (_type) {
        case AddTypeOne:{
            return section?6:1;
        }break;
        case AddTypeTwo:{
            return section?10:1;
        }break;
        default:
            break;
    }
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    if (indexPath.section==0) {
        APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
        cell.model = @{@"title":@"活动类型",@"desc":@"请选择活动类型"};
        cell.select_status_str = _type?@"电子优惠券":@"满减优惠";
        self.navcBar.title = _idF?_type?@"编辑电子优惠券":@"编辑满减优惠":_type?@"新增电子优惠券":@"新增满减优惠";
        switch (self.newOrEdit) {
            case NewOrEditTypeNew:{
                [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                    [weakSelf.view endEditing:YES];
                    NSArray *array = @[@"满减优惠",@"电子优惠券"];
                    [YZActionSheet showActionSheetWithNotice:@"请选择活动类型" titles:array selected:^(NSInteger idx) {
                        cell.select_status_str = array[idx];
                        weakSelf.type = idx;
                        weakSelf.navcBar.title = idx?@"新增电子优惠券":@"新增满减优惠";
                        [UIView performWithoutAnimation:^{
                            [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
                        }];
                    }];
                }];
            }break;
                
            default:
                break;
        }
        
        return cell;
    }else{
        switch (_type) {
            case AddTypeOne:{
                switch (indexPath.row) {
                    case 0:
                    case 5:{
                        APP_Lab_TextFld_TableViewCell *cell =[[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
                        cell.model = self.listArray[_type][indexPath.row];
                        cell.delegate = self;
                        cell.indexPath = indexPath;
                        switch (indexPath.row) {
                            case 0:{
                                cell.textFld.text = _addOneModel.name?:@"";
                            }break;
                            case 5:{
                                cell.textFld.text = _addOneModel.desc?:@"";
                            }break;
                            default:
                                break;
                        }
                        return cell;
                    }break;
                    case 1:{
                        APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                        cell.model = self.listArray[_type][indexPath.row];
                        [cell.contentView txj_whenTapped:^{
                            [weakSelf.view endEditing:YES];
                            [TXJSelectDateView showDateViewWithMinLimitDate:[NSDate date] Title:@"请选择开始时间" DateStyle:DateStyleShowYearMonthDayHourMinute completelp:^(NSString *dateString) {
                                weakSelf.addOneModel.start_time = [NSString stringWithFormat:@"%@:00",dateString];
                                cell.select_status_str = [NSString stringWithFormat:@"%@:00",dateString];
                            }];
                        }];
                        if (self.addOneModel.start_time.length) {
                            cell.select_status_str = self.addOneModel.start_time;
                        }else{
                            cell.desc_status_str = @"请选择开始时间";
                        }
                        return cell;
                    }break;
                    case 2:{
                        APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                        cell.model = self.listArray[_type][indexPath.row];
                        [cell.contentView txj_whenTapped:^{
                            [weakSelf.view endEditing:YES];
                            [TXJSelectDateView showDateViewWithMinLimitDate:[NSDate date] Title:@"请选择结束时间" DateStyle:DateStyleShowYearMonthDayHourMinute completelp:^(NSString *dateString) {
                                weakSelf.addOneModel.end_time = [NSString stringWithFormat:@"%@:00",dateString];
                                cell.select_status_str = [NSString stringWithFormat:@"%@:00",dateString];
                            }];
                        }];
                        if (self.addOneModel.end_time.length) {
                            cell.select_status_str = self.addOneModel.end_time;
                        }else{
                            cell.desc_status_str = @"请选择结束时间";
                        }
                        return cell;
                    }break;
                    case 3:{
                        AddMan_jian_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"AddMan_jian_TableViewCell" owner:self options:nil] lastObject];
                        cell.manBlock = ^(NSString *man) {
                            weakSelf.addOneModel.amount = man;
                        };
                        cell.jianBlock = ^(NSString *jian) {
                            weakSelf.addOneModel.discount = jian;
                        };
                        cell.manTxtFld.text =self.addOneModel.amount?:@"";
                        cell.jianTextFld.text =self.addOneModel.discount?:@"";
                        return cell;
                    }break;
                    case 4:{
                        APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                        cell.model = self.listArray[_type][indexPath.row];
                        [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                            NSArray *array = @[@"关闭",@"开启"];
                            [YZActionSheet showActionSheetWithNotice:@"请选择活动状态" titles:array selected:^(NSInteger idx) {
                                cell.select_status_str = array[idx];
                                weakSelf.addOneModel.status = idx;
                            }];
                        }];
                        cell.select_status_str = self.addOneModel.status?@"开启":@"关闭";
                    
                        return cell;
                    }break;
                    default:{
                        
                    }break;
                }
            }break;
            case AddTypeTwo:{
                switch (indexPath.row) {
                    case 0:
                    case 5:
                    case 6:
                    case 9:{
                        APP_Lab_TextFld_TableViewCell *cell =[[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
                        cell.model = self.listArray[_type][indexPath.row];
                        cell.delegate = self;
                        cell.indexPath = indexPath;
                        switch (indexPath.row) {
                            case 0:{
                                cell.textFld.text = _addTwoModel.name?[NSString stringWithFormat:@"%@",_addTwoModel.name]:@"";
                            }break;
                            case 5:{
                                cell.textFld.text = _addTwoModel.money?[NSString stringWithFormat:@"%@",_addTwoModel.money]:@"";
                                cell.textFld.keyboardType = UIKeyboardTypeNumberPad;
                            }break;
                            case 6:{
                                cell.textFld.text = _addTwoModel.provide_num?[NSString stringWithFormat:@"%@",_addTwoModel.provide_num]:@"";
                                cell.textFld.keyboardType = UIKeyboardTypeNumberPad;
                            }break;
                            case 9:{
                                cell.textFld.text = _addTwoModel.desc?[NSString stringWithFormat:@"%@",_addTwoModel.desc]:@"";
                            }break;
                            default:
                                break;
                        }
                        return cell;
                    }break;
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                    case 7:
                    case 8:{
                        APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                        cell.model = self.listArray[_type][indexPath.row];
                        switch (indexPath.row) {
                            case 1:{
                                [cell.contentView txj_whenTapped:^{
                                    [weakSelf.view endEditing:YES];
                                    [TXJSelectDateView showDateViewWithMinLimitDate:[NSDate date] Title:@"请选择开始时间" DateStyle:DateStyleShowYearMonthDayHourMinute completelp:^(NSString *dateString) {
                                        weakSelf.addTwoModel.start_time = [NSString stringWithFormat:@"%@:00",dateString];
                                        cell.select_status_str = [NSString stringWithFormat:@"%@:00",dateString];
                                    }];
                                }];
                                if (self.addTwoModel.start_time.length) {
                                    cell.select_status_str = self.addTwoModel.start_time;
                                }else{
                                    cell.desc_status_str = @"请选择开始时间";
                                }
                            }break;
                            case 2:{
                                [cell.contentView txj_whenTapped:^{
                                    [weakSelf.view endEditing:YES];
                                    [TXJSelectDateView showDateViewWithMinLimitDate:[NSDate date] Title:@"请选择结束时间" DateStyle:DateStyleShowYearMonthDayHourMinute completelp:^(NSString *dateString) {
                                        weakSelf.addTwoModel.end_time = [NSString stringWithFormat:@"%@:00",dateString];
                                        cell.select_status_str = [NSString stringWithFormat:@"%@:00",dateString];
                                    }];
                                }];
                                if (self.addTwoModel.end_time.length) {
                                    cell.select_status_str = self.addTwoModel.end_time;
                                }else{
                                    cell.desc_status_str = @"请选择结束时间";
                                }
                            }break;
                            case 3:{
                                [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                                    NSArray *array = @[@"无门槛使用"];
                                    [YZActionSheet showActionSheetWithNotice:@"请选择优惠方式" titles:array selected:^(NSInteger idx) {
                                        cell.select_status_str = array[idx];
                                        weakSelf.addTwoModel.type = idx+1;
                                    }];
                                }];
                                if (self.addTwoModel.type) {
                                    cell.select_status_str = @"无门槛使用";
                                }else{
                                    cell.desc_status_str =  @"请选择优惠方式";
                                }
                            }break;
                            case 4:{
                                [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                                    NSArray *array = @[@"无效",@"有效"];
                                    [YZActionSheet showActionSheetWithNotice:@"请选择优惠券状态" titles:array selected:^(NSInteger idx) {
                                        cell.select_status_str = array[idx];
                                        weakSelf.addTwoModel.status = idx;
                                    }];
                                }];
                                if (self.addTwoModel.type) {
                                    cell.select_status_str = self.addTwoModel.status?@"有效":@"无效";
                                }else{
                                    cell.desc_status_str =  @"请选择优惠券状态";
                                }
                            }break;
                            case 7:{
                                [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                                    NSArray *array = @[@"用户领取",@"邻店消费赠送"];
                                    [YZActionSheet showActionSheetWithNotice:@"请选择优惠券发放方式" titles:array selected:^(NSInteger idx) {
                                        cell.select_status_str = array[idx];
                                        if (idx==0) {
                                            weakSelf.addTwoModel.shop_id_str_name = nil;
                                            weakSelf.addTwoModel.shop_id_str = nil;
                                        }
                                        weakSelf.addTwoModel.provide_type = idx+1;
                                        [UIView performWithoutAnimation:^{
                                            [weakSelf.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:8 inSection:1]] withRowAnimation:UITableViewRowAnimationNone];
                                        }];
                                        
                                    }];
                                }];
                                if (self.addTwoModel.type) {
                                    cell.select_status_str = self.addTwoModel.provide_type==1?@"用户领取":@"邻店消费赠送";
                                }else{
                                    cell.desc_status_str =  @"请选择优惠券发放方式";
                                }
                            }break;
                            case 8:{
                                if (self.addTwoModel.provide_type==2) {
                                    [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                                        [TXJSelectShopList showSelectShopListWithTitle:@"请选择店铺列表" seletType:TXJSelectShopListSelectTypeOne selectShopArray:^(NSArray *shop_Id_array, NSArray *shop_Name_array) {
                                            txjLog(@"shopArray is %@--%@",[shop_Id_array toJSONString],[shop_Name_array toJSONString]);
                                            weakSelf.addTwoModel.shop_id_str = [shop_Id_array toJSONString];
                                            
                                            weakSelf.shopName = @"";
                                            for (NSString *name in shop_Name_array) {
                                                weakSelf.shopName = [NSString stringWithFormat:@"%@%@,",weakSelf.shopName,name];
                                            }
                                            weakSelf.addTwoModel.shop_id_str_name = weakSelf.shopName;
                                            cell.select_status_str = weakSelf.shopName;
                                            
                                        }];
                                    }];
                                    if (self.addTwoModel.shop_id_str_name) {
                                        cell.select_status_str = self.addTwoModel.shop_id_str_name;
                                    }else{
                                        cell.desc_status_str = @"请选择店铺列表";
                                    }
                                }else{
                                    self.addTwoModel.shop_id_str_name = nil;
                                    self.addTwoModel.shop_id_str = nil;
                                    cell.desc_status_str = @"无需选择此项";
                                }
                                
                                
                            }break;
                            default:
                                break;
                        }
                        return cell;
                    }break;
                    default:{
                        
                    }break;
                }
            }break;
            default:
                break;
        }
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
//MARK:输入框 Cell 返回协议
-(void)APP_Lab_TextFld_TableViewCellWithString:(NSString *)string indexPath:(NSIndexPath *)indexpath{
    switch (_type) {
        case AddTypeOne:{
            switch (indexpath.row) {
                case 0:{
                    _addOneModel.name = string;
                }break;
                case 5:{
                    _addOneModel.desc = string;
                }
                default:
                    break;
            }
        }break;
        case AddTypeTwo:{
            switch (indexpath.row) {
                case 0:{
                    _addTwoModel.name = string;
                }break;
                case 5:{
                    _addTwoModel.money = string;
                }break;
                case 6:{
                    _addTwoModel.provide_num = string;
                }break;
                case 9:{
                    _addTwoModel.desc = string;
                }break;
                default:
                    break;
            }
        }break;
        default:
            break;
    }
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.estimatedRowHeight = 200;
        UIView *footer = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
        footer.frame = CGRectMake(0, 0, kScreenWidth, 94);
        UIButton *btn = [BaseClassTool buttonWithFont:14.0 titleColor:UIColor.whiteColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter title:@"保存"];
        [btn setBackgroundColor:UIColor.appBlueColor];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 22;
        [footer addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(footer).insets(UIEdgeInsetsMake(40, 12, 10, 12));
        }];
        __weak typeof(self) weakSelf = self;
        [btn txj_addEventHandler:^{
            [weakSelf.view endEditing:YES];
            switch (weakSelf.newOrEdit) {
                case NewOrEditTypeNew:{
                    switch (weakSelf.type) {
                        case AddTypeOne:{
                            weakSelf.addOneModel.type = 1;
                            weakSelf.addOneModel.shop_id = [UserInfoAndShopModel sharedUserModel].shop.idField;
                            txjLog(@"新增满减 \n%@",[weakSelf.addOneModel toDictionary]);
                            [[HTTPSessionManager sharedManager] POST:@"/api/activity/create" parameters:[weakSelf.addOneModel toDictionary] callBack:^(RespondModel *responseModel) {
                                [XCToast showWithMessage:responseModel.message];
                                if (responseModel.status == 200) {
                                    [weakSelf.navigationController popViewControllerAnimated:YES];
                                }
                            }];
                        }break;
                        case AddTypeTwo:{
                            weakSelf.addTwoModel.shop_id = [UserInfoAndShopModel sharedUserModel].shop.idField;
                            txjLog(@"新增电子优惠券 \n%@",[weakSelf.addTwoModel toDictionary]);
                            
                            [[HTTPSessionManager sharedManager] POST:@"/api/coupon/create" parameters:[weakSelf.addTwoModel toDictionary] callBack:^(RespondModel *responseModel) {
                                [XCToast showWithMessage:responseModel.message];
                                if (responseModel.status == 200) {
                                    [weakSelf.navigationController popViewControllerAnimated:YES];
                                }
                            }];
                        }break;
                        default:
                            break;
                    }
                }break;
                case NewOrEditTypeEdit:{
                    switch (weakSelf.type) {
                        case AddTypeOne:{
                            txjLog(@"编辑满减");
                            NSString *url = [NSString stringWithFormat:@"/api/activity/update/%@",weakSelf.idF];
                            [[HTTPSessionManager sharedManager] POST:url parameters:[weakSelf.addOneModel toDictionary] callBack:^(RespondModel *responseModel) {
                                [XCToast showWithMessage:responseModel.message];
                                if (responseModel.status == 200) {
                                    [weakSelf.navigationController popViewControllerAnimated:YES];
                                }
                            }];
                        }break;
                        case AddTypeTwo:{
                            txjLog(@"保存电子优惠券");
                            NSString *url = [NSString stringWithFormat:@"/api/coupon/update/%@",weakSelf.idF];
                            [[HTTPSessionManager sharedManager] POST:url parameters:[weakSelf.addTwoModel toDictionary] callBack:^(RespondModel *responseModel) {
                                [XCToast showWithMessage:responseModel.message];
                                if (responseModel.status == 200) {
                                    [weakSelf.navigationController popViewControllerAnimated:YES];
                                }
                            }];
                        }break;
                        default:
                            break;
                    }
                }break;
                default:
                    break;
            }
        } forControlEvents:UIControlEventTouchUpInside];
        _tableView.tableFooterView = footer;
        
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
