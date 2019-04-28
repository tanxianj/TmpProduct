//
//  FastCashRegisterViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "KuaiSuSYViewController.h"
#import "FastCashRegisterOneTableViewCell.h"
#import "FastCashRegisterTwoTableViewCell.h"
#import "FastCashRegisterView.h"
#import "FastCashRegisterGoodsTableViewCell.h"
#import "TXJSelectShopList.h"
#import "NSString+LabStyle.h"
#import "CALayerViewController.h"
#import "OrdeCreateModel.h"
#import "TXJSelectShopDiscount.h"
#import "TXJToslView.h"
#import "NSArray+JSON.h"
#import "PayCodeViewController.h"
#import "TXJNotificationViewController.h"
@interface KuaiSuSYViewController ()<UITableViewDelegate,UITableViewDataSource,APP_Lab_TextFld_TableViewCellDelagate,FastCashRegisterTwoTableViewCellDelegate,FastCashRegisterViewDeletage>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * btnView;
@property (nonatomic, strong) UIButton * btnHexiao;
@property (nonatomic, strong) UIButton * btnGoPay;
@property (nonatomic, strong) FastCashRegisterView * sectionFooter;

/**
 创建订单模型
 */
@property (nonatomic, strong) OrdeCreateModel * ordeCreateModel;

/**
 提交时的 备注
 */
@property (nonatomic, strong) NSString * note;
/**
 应付金额
 */
@property (nonatomic, assign) CGFloat need_pay_price;
/**
 店铺优惠金额
 */
@property (nonatomic, assign) CGFloat shop_delete_price;

/**
 用户优惠券金额
 */
@property (nonatomic, assign) CGFloat user_Coupon_delete_price;
@property (nonatomic, strong) NSString * user_mobile;
@end
#define sectionFooterHeight 130
@implementation KuaiSuSYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _need_pay_price = 0.00;
    [self.listArray addObjectsFromArray:@[@{
                                              @"title":@"店铺优惠",
                                              @"desc":@"请选择店铺优惠"
                                              },
                                          @{
                                              @"title":@"优惠券",
                                              @"desc":@"未选择优惠券"
                                              },
                                          @{
                                              @"title":@"合计",
                                              @"desc":@"合计金额"
                                              },
                                          @{
                                              @"title":@"备注",
                                              @"desc":@"请输入备注"
                                              },]];
}
//MARK:初始化子视图
- (void)initializeSubViews{
    __weak typeof(self) weakSelf = self;
    _btnView = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
    _btnHexiao = [self BtnWithBackGroundColor:UIColor.appBlueColor title:@"优惠核销"];
    _btnGoPay = [self BtnWithBackGroundColor:UIColor.appRedColor title:@"结账"];
    [self.btnHexiao txj_addEventHandler:^{
        txjLog(@"核销");
        [weakSelf PushToCALayerViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.btnGoPay txj_addEventHandler:^{
        txjLog(@"结账");
        [weakSelf.view endEditing:YES];
        NSString *url = [NSString stringWithFormat:@"/api/order/create/%@",[UserInfoAndShopModel sharedUserModel].shop.idField];
        NSInteger paycode  = 0;
        if ([self.ordeCreateModel.pay_code isEqualToString: @"cash"]||[self.ordeCreateModel.pay_code isEqualToString: @"bank"]) {
            [TXJToslView showToslViewWithContent:@"是否确认用户已付款？" leftAction:nil rightAction:^{
                [[HTTPSessionManager sharedManager] POST:url parameters:[weakSelf.ordeCreateModel toDictionary] callBack:^(RespondModel *responseModel) {
                    if (responseModel.status == 200) {
                        [TXJNotificationViewController addLocalNoticeWithNotificationType:NotificationTypeOne title:@"收款到账通知" body:[NSString stringWithFormat:@"您有一笔新的订单到账:%@元",weakSelf.ordeCreateModel.order_money]];
                        
//                        [weakSelf addLocalNotice:weakSelf.ordeCreateModel.order_money];
//                        [weakSelf checkUserNotificationEnable];
                        NSString *url = [NSString stringWithFormat:@"/api/payment/pay/%@",responseModel.data[@"id"]];
                        [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
                            [XCToast showWithMessage:responseModel.message];
                            if (responseModel.status == 200) {
                                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
                            }
                        }];
                    }else{
                        [XCToast showWithMessage:responseModel.message];
                    }
                }];
            }];
        }else{
            [LoadingView showWithMessage:kWaiting];
            [[HTTPSessionManager sharedManager] POST:url parameters:[weakSelf.ordeCreateModel toDictionary] callBack:^(RespondModel *responseModel) {
//                [XCToast showWithMessage:responseModel.message];
                [LoadingView hidden];
                if (responseModel.status == 200) {
                    PayCodeViewController *vc = [PayCodeViewController new];
                    vc.priceStr = responseModel.data[@"order_money"];
                    vc.pay_type = [self.ordeCreateModel.pay_code isEqualToString: @"alipay"]?0:1;
                    vc.idStr = responseModel.data[@"id"];
                    [weakSelf.navigationController pushViewController:vc animated:YES];
//                    [self.navigationController popToRootViewControllerAnimated:YES];
                }else{
                    [XCToast showWithMessage:responseModel.message];
                }
            }];
        }
        
    } forControlEvents:UIControlEventTouchUpInside];
}
-(UIButton *)BtnWithBackGroundColor:(UIColor *)color title:(NSString *)title{
    UIButton *btn = [BaseClassTool buttonWithFont:14.0 titleColor:UIColor.whiteColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter title:title];
    btn.backgroundColor = color;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 22;
    return btn;
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.btnView];
    [self.view addSubview:self.tableView];
    [self.btnView addSubview:self.btnHexiao];
    [self.btnView addSubview:self.btnGoPay];
}
//MARK:设置约束
- (void)setupSubViewMargins{
    
    [self.btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.offset(64);
        make.bottom.equalTo(self.view.mas_bottom).offset(ISX?-24:0);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(ISX?88:64);
        make.bottom.equalTo(self.btnView.mas_top);
    }];
    [self.btnHexiao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btnView).offset(12);
        make.top.equalTo(self.btnView).offset(10);
        make.height.offset(44);
        make.width.offset((kScreenWidth-36)/2);
    }];
    [self.btnGoPay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btnHexiao.mas_right).offset(12);
        make.top.equalTo(self.btnView).offset(10);
        make.height.offset(44);
        make.width.offset((kScreenWidth-36)/2);
    }];
}
//MARK:显示分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            return  3;
        }break;
            /************************************************************************************************/
        case FastCashRegisterTypeTwo:{
            return 4;
        }break;
        default:{}break;
    }
    return 1;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            switch (section) {
                case 0:
                    return 1;//MARK:快速收银 会员姓名
                    break;
                case 1:
                    return 1;//MARK:快速收银 应付金额
                    break;
                default:
                    return 4;//MARK:快速收银 支付方式
                    break;
            }
        }break;
            /************************************************************************************************/
        case FastCashRegisterTypeTwo:{
            switch (section) {
                case 0:
                    return 1;//MARK:产品收银 会员姓名
                    break;
                case 1:
                    return self.goodsInfoArray.count;//MARK:产品收银 选择的商品分组
                    break;
                case 2:
                    return 1; //MARK:产品收银 应付金额
                    break;
                default:
                    return 4;//MARK:产品收银 支付方式
                    break;
            }
        }break;
        default:{}break;
    }
    return 10;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            switch (indexPath.section) {
                case 0:{//MARK:快速收银 会员姓名Cell
                    FastCashRegisterOneTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FastCashRegisterOneTableViewCell" owner:self options:nil] lastObject];
                    if (self.user_mobile.length) {
                        cell.selectStr = self.user_mobile;
                    }else{
                        cell.descStr = @"请选择";
                    }
                    return cell;
                }break;
                case 1:{//MARK:快速收银 应付金额Cell
                    FastCashRegisterTwoTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FastCashRegisterTwoTableViewCell" owner:self options:nil] lastObject];
                    cell.delegate = self;
                    if (self.need_pay_price) {
                        cell.textFld.text = [NSString stringWithFormat:@"%.2f",self.need_pay_price];
                    }
                    return cell;
                }break;
                default:{//MARK:快速收银 支付方式Cell
                    switch (indexPath.row) {
                            //MARK:快速收银 店铺优惠
                        case 0:{
                            APP_Lab_Lab_image_TableViewCell *cell  = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                            cell.model = self.listArray[indexPath.row];
                            [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                                [TXJSelectShopDiscount showSelectShopListWithTitle:@"请选择店铺优惠" Need_pay_price:weakSelf.need_pay_price selectShopArray:^(NSArray *shop_Id_array, NSArray *shop_Name_array) {
//                                    weakSelf.ordeCreateModel.activity = [shop_Id_array toJSONString];
                                    weakSelf.ordeCreateModel.activity = [@[@{@"id":shop_Id_array[0]}] toJSONString];
                                        cell.descLab.attributedText =[NSString AttributedString:shop_Name_array FontSizeArray:@[@14,@14,@14,@14] ColorsArray:@[UIColor.appTextColor,UIColor.appRedColor,UIColor.appTextColor,UIColor.appRedColor]];
                                        weakSelf.shop_delete_price = [shop_Name_array[3] floatValue];
                                        [UIView performWithoutAnimation:^{
                                            [weakSelf.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:2]] withRowAnimation:UITableViewRowAnimationNone];
                                        }];
                                }];
                            }];
                            return cell;
                        }break;
                            //MARK:快速收银 优惠券
                        case 1:{
                            APP_Lab_Lab_image_TableViewCell *cell  = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                            cell.model = self.listArray[indexPath.row];
                            [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                                [weakSelf PushToCALayerViewController];
                            }];
                            if (_couponCheckModel.name.length) {
                                cell.descLab.attributedText = [NSString AttributedString:@[_couponCheckModel.name,[NSString stringWithFormat:@"  %@元",_couponCheckModel.money]] FontSizeArray:@[@14,@14] ColorsArray:@[UIColor.appTextColor,UIColor.appRedColor]];
                            }
                            return cell;
                        }break;
                            
                        default:{
                            APP_Lab_TextFld_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
                            cell.model = self.listArray[indexPath.row];
                            cell.delegate = self;
                            cell.indexPath = indexPath;
                            //MARK:快速收银 合计金额
                            if (indexPath.row == 2) {
                                cell.textFld.text = [NSString stringWithFormat:@"￥%.2f",(_need_pay_price - _shop_delete_price - _user_Coupon_delete_price)>0?(_need_pay_price - _shop_delete_price - _user_Coupon_delete_price):0.0];
                                cell.textFld.userInteractionEnabled = NO;
                                self.ordeCreateModel.order_money = [NSString stringWithFormat:@"%.2f",(_need_pay_price - _shop_delete_price - _user_Coupon_delete_price)>0?(_need_pay_price - _shop_delete_price - _user_Coupon_delete_price):0.0];
                            }
                            //MARK:快速收银 备注
                            if (indexPath.row == 3) {
                                cell.textFld.text = _note;
                            }
                            return cell;
                        }break;
                    }
                }break;
            }
        }break;
            /************************************************************************************************/
        case FastCashRegisterTypeTwo:{
            self.ordeCreateModel.goods_info = [self.goodsInfoArray toJSONString];
            switch (indexPath.section) {
                case 0:{//MARK:产品收银 会员姓名Cell
                    FastCashRegisterOneTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FastCashRegisterOneTableViewCell" owner:self options:nil] lastObject];
                    if (self.user_mobile.length) {
                        cell.selectStr = self.user_mobile;
                    }else{
                        cell.descStr = @"请选择";
                    }
                    return cell;
                }break;
                case 1:{//MARK:产品收银 选择的商品分组Cell
                    FastCashRegisterGoodsTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FastCashRegisterGoodsTableViewCell" owner:self options:nil] lastObject];
                    cell.model = [[GoodsCheckoutModel alloc]initWithDictionary:self.goodsInfoArray[indexPath.row]];
                    return cell;
                }break;
                case 2:{ //MARK:产品收银 应付金额Cell
                    FastCashRegisterTwoTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FastCashRegisterTwoTableViewCell" owner:self options:nil] lastObject];
                    for (NSDictionary *dic in self.goodsInfoArray) {
                        GoodsCheckoutModel *model = [[GoodsCheckoutModel alloc]initWithDictionary:dic];
                        _need_pay_price += [model.goods_price floatValue];
                    }
                    cell.textFld.text = [NSString stringWithFormat:@"￥%.2f",_need_pay_price];
                    cell.textFld.userInteractionEnabled = NO;
                    self.ordeCreateModel.total_money = [NSString stringWithFormat:@"%.2f",_need_pay_price];
                    cell.delegate = self;
                    if (self.need_pay_price) {
                        cell.textFld.text = [NSString stringWithFormat:@"%.2f",self.need_pay_price];
                    }
                    return cell;
                }break;
                default:{//MARK:产品收银 支付方式Cell
                    switch (indexPath.row) {
                            //MARK:显示产品收银 店铺优惠
                        case 0:{
                            APP_Lab_Lab_image_TableViewCell *cell  = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                            cell.model = self.listArray[indexPath.row];
                            
                            [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                                [TXJSelectShopDiscount showSelectShopListWithTitle:@"请选择店铺优惠" Need_pay_price:weakSelf.need_pay_price selectShopArray:^(NSArray *shop_Id_array, NSArray *shop_Name_array) {
                                    //                                    weakSelf.ordeCreateModel.activity = [shop_Id_array toJSONString];
                                    weakSelf.ordeCreateModel.activity = [@[@{@"id":shop_Id_array[0]}] toJSONString];
                                    cell.descLab.attributedText =[NSString AttributedString:shop_Name_array FontSizeArray:@[@14,@14,@14,@14] ColorsArray:@[UIColor.appTextColor,UIColor.appRedColor,UIColor.appTextColor,UIColor.appRedColor]];
                                    weakSelf.shop_delete_price = [shop_Name_array[3] floatValue];
                                    [UIView performWithoutAnimation:^{
                                        [weakSelf.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:3]] withRowAnimation:UITableViewRowAnimationNone];
                                    }];
                                }];
                            }];
                            return cell;
                        }break;
                            //MARK:显示产品收银 优惠券
                        case 1:{
                            APP_Lab_Lab_image_TableViewCell *cell  = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                            cell.model = self.listArray[indexPath.row];
                            [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                                [weakSelf PushToCALayerViewController];
                            }];
                            if (_couponCheckModel.name.length) {
                                cell.descLab.attributedText = [NSString AttributedString:@[_couponCheckModel.name,[NSString stringWithFormat:@"  %@元",_couponCheckModel.money]] FontSizeArray:@[@14,@14] ColorsArray:@[UIColor.appTextColor,UIColor.appRedColor]];
                            }
                            return cell;
                        }break;
                            
                        default:{
                            APP_Lab_TextFld_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
                            cell.model = self.listArray[indexPath.row];
                            cell.delegate = self;
                            cell.indexPath = indexPath;
                            //MARK:显示产品收银合计金额
                            if (indexPath.row == 2) {
                                cell.textFld.text = [NSString stringWithFormat:@"￥%.2f",(_need_pay_price - _shop_delete_price - _user_Coupon_delete_price)>0?(_need_pay_price - _shop_delete_price - _user_Coupon_delete_price):0.0];
                                cell.textFld.userInteractionEnabled = NO;
                                self.ordeCreateModel.order_money = [NSString stringWithFormat:@"%.2f",(_need_pay_price - _shop_delete_price - _user_Coupon_delete_price)>0?(_need_pay_price - _shop_delete_price - _user_Coupon_delete_price):0.0];
                            }
                             //MARK:显示产品收银备注
                            if (indexPath.row == 3) {
                                cell.textFld.text = _note;
                            }
                            return cell;
                        }break;
                    }
                }break;
            }
        }break;
        default:{
            
        }break;
    }
    return nil;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            
        }break;
            /************************************************************************************************/
        case FastCashRegisterTypeTwo:{
            
        }break;
        default:{}break;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            switch (section) {
                case 0:
                case 1:
                    return  [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
                    break;
                default:
                    return nil;
                    break;
            }
        }break;
            /************************************************************************************************/
        case FastCashRegisterTypeTwo:{
            switch (section) {
                case 0:
                case 1:
                case 2:
                    return  [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
                    break;
                default:
                    return nil;
                    break;
            }
        }break;
        default:{}break;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            switch (section) {
                case 0:
                case 1:
                    return 10;
                    break;
                default:
                    return CGFLOAT_MIN;
                    break;
            }
        }break;
            /************************************************************************************************/
        case FastCashRegisterTypeTwo:{
            switch (section) {
                case 0:
                case 1:
                case 2:
                    return 10;
                    break;
                default:
                    return CGFLOAT_MIN;
                    break;
            }
        }break;
        default:{}break;
    }
    return CGFLOAT_MIN;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            if (section == 1) {
                UIView *view = [BaseClassTool viewWithBackgroundColor:UIColor.clearColor];
                view.frame = CGRectMake(0, 0, kScreenWidth, sectionFooterHeight);
                [view addSubview:self.sectionFooter];
                [self.sectionFooter mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(view);
                }];
                return  view;
            }else{
                return nil;
            }
        }break;
        case FastCashRegisterTypeTwo:{
            if (section == 2) {
                UIView *view = [BaseClassTool viewWithBackgroundColor:UIColor.clearColor];
                view.frame = CGRectMake(0, 0, kScreenWidth, sectionFooterHeight);
                [view addSubview:self.sectionFooter];
                [self.sectionFooter mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(view);
                }];
                return  view;
            }else{
                return nil;
            }
        }break;
        default:
            break;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            if (section == 1) {
                return sectionFooterHeight;
            }else{
                return CGFLOAT_MIN;
            }
        }break;
        case FastCashRegisterTypeTwo:{
            if (section == 2) {
                return sectionFooterHeight;
            }else{
                return CGFLOAT_MIN;
            }
        }break;
        default:
            break;
    }
    return CGFLOAT_MIN;
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
//MARK:主要用于记录备注
-(void)APP_Lab_TextFld_TableViewCellWithString:(NSString *)string indexPath:(NSIndexPath *)indexpath{
    
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            if (indexpath.section == 2 && indexpath.row ==3) {
                txjLog(@"快速收银");
                _note = string;
                self.ordeCreateModel.note = _note;
            }
        }break;
        case FastCashRegisterTypeTwo:{
            if (indexpath.section == 3 && indexpath.row ==3) {
                _note = string;
                self.ordeCreateModel.note = _note;
            }
        }break;
        default:
            break;
    }
}
//MARK:更新应付金额
-(void)FastCashRegisterTwoTableViewCell:(NSString *)string{
    switch (self.type) {
        case FastCashRegisterTypeOne:{
            txjLog(@"快速收银金额%@",string);
            _need_pay_price = [string floatValue];
            self.ordeCreateModel.total_money = [NSString stringWithFormat:@"%.2f",_need_pay_price];
            [UIView performWithoutAnimation:^{
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:2]] withRowAnimation:UITableViewRowAnimationNone];
            }];
            
        }break;
        case FastCashRegisterTypeTwo:{
            _need_pay_price = [string floatValue];
            self.ordeCreateModel.total_money = [NSString stringWithFormat:@"%.2f",_need_pay_price];
            [UIView performWithoutAnimation:^{
                [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:3]] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }break;
        default:
            break;
    }
}

//MARK:选择支付方式
-(void)FastCashRegisterViewPay_code:(NSString *)pay_code{
    txjLog(@"pay_code is %@",pay_code);
    self.ordeCreateModel.pay_code = pay_code;
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        _tableView.rowHeight = UITableViewAutomaticDimension;
        //        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}
-(FastCashRegisterView *)sectionFooter{
    if (!_sectionFooter) {
        _sectionFooter = [[[NSBundle mainBundle] loadNibNamed:@"FastCashRegisterView" owner:self options:nil] lastObject];
        _sectionFooter.delegate = self;
    }
    return _sectionFooter;
}

//MARK:前去核销优惠券
-(void)PushToCALayerViewController{
    __weak typeof(self) weakSelf = self;
    CALayerViewController *vc= [CALayerViewController new];
    vc.saoMiaoType = 1;
    vc.backCouponCheckModel = ^(CouponCheckModel *model) {
        self.couponCheckModel = model;
        //        weakSelf.ordeCreateModel.user_id = [NSString stringWithFormat:@"%li",model.user_id];
        //        weakSelf.ordeCreateModel.coupon = [NSString stringWithFormat:@"%li",model.user_id];
        //        weakSelf.user_mobile = [NSString stringWithFormat:@"%@",model.mobile];
        //        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    };
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)setCouponCheckModel:(CouponCheckModel *)couponCheckModel{
    _couponCheckModel = couponCheckModel;
    if (_couponCheckModel.user_id) {
        _ordeCreateModel.user_id = [NSString stringWithFormat:@"%li",_couponCheckModel.user_id];
    }
    if (_couponCheckModel.mobile.length) {
        self.user_mobile = [NSString stringWithFormat:@"%@",_couponCheckModel.mobile];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    }
    _user_Coupon_delete_price = [_couponCheckModel.money floatValue];
    _ordeCreateModel.coupon = [@[@{@"id":[NSString stringWithFormat:@"%ld",(long)_couponCheckModel.cid]}] toJSONString];
    [UIView performWithoutAnimation:^{
        switch (self.type) {
            case FastCashRegisterTypeOne:{
                [UIView performWithoutAnimation:^{
                    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:2],
                                                             [NSIndexPath indexPathForRow:2 inSection:2]] withRowAnimation:UITableViewRowAnimationNone];
                }];
                
            }break;
            case FastCashRegisterTypeTwo:{
                [UIView performWithoutAnimation:^{
                    [self.tableView reloadRowsAtIndexPaths:@[
                                                             [NSIndexPath indexPathForRow:1 inSection:3],
                                                             [NSIndexPath indexPathForRow:2 inSection:3]] withRowAnimation:UITableViewRowAnimationNone];
                }];
            }break;
            default:
                break;
        }
    }];
}
-(NSArray<NSDictionary *> *)goodsInfoArray{
    if (!_goodsInfoArray) {
        _goodsInfoArray = [NSArray array];
    }
    return _goodsInfoArray;
}
-(OrdeCreateModel *)ordeCreateModel{
    if (!_ordeCreateModel) {
        _ordeCreateModel = [[OrdeCreateModel alloc]init];
    }
    return _ordeCreateModel;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




