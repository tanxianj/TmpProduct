//
//  AddShopViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "AddShopViewController.h"
#import "TXJ_JHAddressPickView.h"
#import "XCImageUploadView.h"
#import "NSArray+JSON.h"
#import "APPAddressModel.h"
#import <CoreLocation/CoreLocation.h>
#import "AddShopFooterViewTableViewCell.h"
#import "TXJToslView.h"
#import "TXJSelectDateView.h"
#import "NSString+TimeString.h"

@interface AddShopViewController ()<UITableViewDelegate,UITableViewDataSource,APP_Lab_TextFld_TableViewCellDelagate,APP_Lab_TextView_TableViewCellDelegate,CLLocationManagerDelegate,AddShopFooterViewTableViewCellDelegate>{
    CLLocationManager *locationmanager;//定位服务
    NSString *currentCity;//当前城市
    NSString *strlatitude;//经度
    NSString *strlongitude;//纬度
}
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * btnView;
@property (nonatomic, strong) UIButton * addShopBtn;
@property (nonatomic, strong) XCImageUploadView * uploadView;

@property (nonatomic, strong) NSMutableDictionary *dicH;
@end

@implementation AddShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    if (!_addShopModel) {
        _addShopModel = [[AddShopModel alloc]init];
    }
    if (_isEdit) {
        txjLog(@"当前编辑 %@",[_addShopModel toDictionary]);
        
        [self defaultNavigationBarSetWithTitle:@"编辑店铺" Right:@"删除" rightItemBlock:^{
            [TXJToslView showToslViewWithContent:@"你确定要删除该店铺吗?" leftAction:nil rightAction:^{
                NSString *url = [NSString stringWithFormat:@"/api/manager/delshop/%@",weakSelf.idF];
                [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
                    [XCToast showWithMessage:responseModel.message];
                    if (responseModel.status == 200) {
                        [weakSelf.navigationController popViewControllerAnimated:YES];
                    }
                }];
            }];
        }];
    }
    [self.listArray addObjectsFromArray:@[
                                          @{@"title":@"店铺名称",
                                            @"desc":@"请输入店铺名称"
                                            },
                                          @{@"title":@"店铺描述",
                                            @"desc":@"请输入店铺描述"
                                            },
                                          @{@"title":@"店铺分类",
                                            @"desc":@"请选择店铺分类"
                                            },
                                          @{@"title":@"所在地区",
                                            @"desc":@"请选择  省   市   区"
                                            },
                                          @{@"title":@"店铺详细地址",
                                            @"desc":@"请输入店铺详细地址"
                                            },
                                          @{@"title":@"营业开始时间",
                                            @"desc":@"请选择营业开始时间"
                                            },
                                          @{@"title":@"营业结束时间",
                                            @"desc":@"请选择营业结束时间"
                                            },
                                          @{@"title":@"服务热线",
                                            @"desc":@"请输入服务热线"
                                            },
                                          @{@"title":@"店铺状态",
                                            @"desc":@"请选择店铺状态"
                                            },]];
    
    //获取经纬度
    [self getLocation];
}
//MARK:初始化子视图
- (void)initializeSubViews{
    _btnView = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
    self.btnView.frame = CGRectMake(0, 0, kScreenWidth, 64);
    _addShopBtn = [self BtnWithBackGroundColor:UIColor.appBlueColor title:@"保存"];
    __weak typeof(self) weakSelf = self;
    [self.addShopBtn txj_addEventHandler:^{
        [weakSelf.view endEditing:YES];
        if (weakSelf.isEdit) {
            weakSelf.addShopModel.merchant_id = [UserModel sharedUserModel].merchant_id;
            weakSelf.addShopModel.shop_img = [weakSelf.uploadView.fileNameArray toJSONString];
            if (weakSelf.addShopModel.shop_img.length<=2) {
                [XCToast showWithMessage:@"请添加店铺图片"];
                return;
            }
            if (![weakSelf.addShopModel.business_tag hasPrefix:@"["]) {
                NSMutableArray *tmpArray = [NSMutableArray array];
                NSArray *array = [weakSelf.addShopModel.business_tag componentsSeparatedByString:@","];
                for (NSString *str in array) {
                    if (str.length) {
                        [tmpArray addObject:str];
                    }
                }
                weakSelf.addShopModel.business_tag = [tmpArray toJSONString];
            }
            NSString *url = [NSString stringWithFormat:@"/api/manager/updateshop/%@",weakSelf.idF];
            [[HTTPSessionManager sharedManager] POST:url parameters:[weakSelf.addShopModel toDictionary] callBack:^(RespondModel *responseModel) {
                [XCToast showWithMessage:responseModel.message];
                if (responseModel.status == 200) {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }
            }];
        }else{
            weakSelf.addShopModel.merchant_id = [UserModel sharedUserModel].merchant_id;
            weakSelf.addShopModel.shop_img = [weakSelf.uploadView.fileNameArray toJSONString];
            if (weakSelf.addShopModel.shop_img.length<=2) {
                [XCToast showWithMessage:@"请添加店铺图片"];
                return;
            }
            if (![weakSelf.addShopModel.business_tag hasPrefix:@"["]) {
                NSMutableArray *tmpArray = [NSMutableArray array];
                NSArray *array = [weakSelf.addShopModel.business_tag componentsSeparatedByString:@","];
                for (NSString *str in array) {
                    if (str.length) {
                        [tmpArray addObject:str];
                    }
                }
                weakSelf.addShopModel.business_tag = [tmpArray toJSONString];
            }
            [[HTTPSessionManager sharedManager] POST:@"/api/manager/addshop" parameters:[weakSelf.addShopModel toDictionary] callBack:^(RespondModel *responseModel) {
                [XCToast showWithMessage:responseModel.message];
                if (responseModel.status == 200) {
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                }
            }];
        }
        
    } forControlEvents:UIControlEventTouchUpInside];
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.btnView];
    [self.btnView addSubview:self.addShopBtn];
    [self.view addSubview:self.tableView];
}

//MARK:设置约束
- (void)setupSubViewMargins{
    [self.btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.offset(64);
        make.bottom.equalTo(self.view.mas_bottom).offset(ISX?-24:0);
    }];
    
    
    [self.addShopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
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
    return 2;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?10:1;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    if (indexPath.section==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = 0;
        [cell.contentView addSubview:self.uploadView];
        [self.uploadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView).insets((UIEdgeInsetsMake(10, 12, 10, 12)));
        }];
        return cell;
    }else{
        switch (indexPath.row) {
            case 0:
            case 7:{
                APP_Lab_TextFld_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
                cell.delegate = self;
                cell.model = self.listArray[indexPath.row];
                cell.indexPath = indexPath;
                if (indexPath.row==0) {
                    cell.textFld.text = _addShopModel.shop_name?[NSString stringWithFormat:@"%@",_addShopModel.shop_name]:@"";
                }else{
                    cell.textFld.text = _addShopModel.service_hotline?[NSString stringWithFormat:@"%@",_addShopModel.service_hotline]:@"";
                    cell.textFld.keyboardType = UIKeyboardTypeNumberPad;
                }
                return cell;
            }break;
                
            case 2:
            case 3:
            case 5:
            case 6:
            case 8:{
                APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                cell.model = self.listArray[indexPath.row];
                switch (indexPath.row) {
                    case 2:{
                        [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                            
                            [weakSelf Getshopcate:^(NSArray *array) {
                                NSMutableArray *titleArray = [NSMutableArray array];
                                for (NSDictionary *dic in array) {
                                    [titleArray addObject:dic[@"cate_name"]];
                                }
                                [YZActionSheet showActionSheetWithNotice:@"请选择店铺分类" titles:titleArray selected:^(NSInteger idx) {
                                    cell.select_status_str = titleArray[idx];
                                    weakSelf.addShopModel.cate_id_name = titleArray[idx];
                                    weakSelf.addShopModel.cate_id =  array[idx][@"id"];
                                }];
                            }];
                        }];
                        if (weakSelf.addShopModel.cate_id_name) {
                            cell.select_status_str = self.addShopModel.cate_id_name;
                        }else{
                            cell.desc_status_str = @"请选择店铺分类";
                        }
                    }break;
                    case 3:{
                        [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                            [TXJ_JHAddressPickView showJHAddressPickView:weakSelf columns:3 complet:^(NSDictionary *dic) {
                                txjLog(@"dic is %@",dic);
                                APPAddressModel *model = [[APPAddressModel alloc]initWithDictionary:dic];
                                weakSelf.addShopModel.province = model.provinceCode;
                                weakSelf.addShopModel.city = model.cityCode;
                                weakSelf.addShopModel.area = model.townCode;
                                
                                weakSelf.addShopModel.province_name = model.province;
                                weakSelf.addShopModel.city_name = model.city;
                                weakSelf.addShopModel.area_name = model.town;
                                cell.select_status_str = [NSString stringWithFormat:@"%@-%@-%@",weakSelf.addShopModel.province_name,weakSelf.addShopModel.city_name,weakSelf.addShopModel.area_name];
                            }];
                        }];
                        if (self.addShopModel.province_name.length) {
                            cell.select_status_str = [NSString stringWithFormat:@"%@-%@-%@",self.addShopModel.province_name,self.addShopModel.city_name,self.addShopModel.area_name];
                        }else{
                            cell.desc_status_str = @"请选择所在地区";
                        }
                    }break;
                    case 5:{
                        [cell.contentView txj_whenTapped:^{
                            [weakSelf.view endEditing:YES];
                            [TXJSelectDateView showDateViewWithscrollToDate:[NSString NSStringToNSDateWithString:@"2019-04-24 16:00:00.000"] Title:@"请选择营业开始时间" DateStyle:DateStyleShowHourMinute NowDate_is_Max_Min:@"hidden" completelp:^(NSString *dateString) {
                                weakSelf.addShopModel.start_time = dateString;
                                cell.select_status_str = dateString;
                            }];
                        }];
                        if (self.addShopModel.start_time.length) {
                            cell.select_status_str = self.addShopModel.start_time;
                        }else{
                            cell.desc_status_str = @"请选择营业开始时间";
                        }
                        
                        
                    }break;
                    case 6:{
                        [cell.contentView txj_whenTapped:^{
                            [weakSelf.view endEditing:YES];
                            [TXJSelectDateView showDateViewWithscrollToDate:[NSString NSStringToNSDateWithString:@"2019-04-24 16:00:00.000"] Title:@"请选择营业结束时间" DateStyle:DateStyleShowHourMinute NowDate_is_Max_Min:@"hidden" completelp:^(NSString *dateString) {
                                weakSelf.addShopModel.end_time = dateString;
                                cell.select_status_str = dateString;
                            }];
                        }];
                        if (self.addShopModel.end_time.length) {
                            cell.select_status_str = self.addShopModel.end_time;
                        }else{
                            cell.desc_status_str = @"请选择营业结束时间";
                        }
                       
                    }break;
                    case 8:{
                        [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                            NSArray *array = @[@"禁用",@"启用"];
                            [YZActionSheet showActionSheetWithNotice:@"请选择店铺状态" titles:array selected:^(NSInteger idx) {
                                weakSelf.addShopModel.status = idx;
                                cell.select_status_str = array[idx];
                            }];
                        }];
                         cell.select_status_str = self.addShopModel.status?@"启用":@"禁用";
                    }break;
                    default:
                        break;
                }
                return cell;
            }break;
            case 9:{
                AddShopFooterViewTableViewCell *cell =[[[NSBundle mainBundle] loadNibNamed:@"AddShopFooterViewTableViewCell" owner:self options:nil] lastObject];
                NSArray *array = [self.addShopModel.business_tag componentsSeparatedByString:@","];
                NSMutableArray *tmparray = [NSMutableArray array];
                for (NSString *str in array) {
                    [tmparray addObject:@{@"id":str}];
                }
                cell.tagsType = @"2";
                cell.ServerData = tmparray;
                cell.indexPath = indexPath;
               
                cell.blokHeight = ^(CGFloat height) {
                    static dispatch_once_t disOnce;
                    
                    dispatch_once(&disOnce,^ {
                        //只执行一次的代码
                    });
                    txjLog(@"height is %.2f",height);
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                        [weakSelf.tableView reloadData];
                    });
                    
                    
                };
                cell.delegate =self;
                return cell;
            }break;
            default:{
                APP_Lab_TextView_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextView_TableViewCell" owner:self options:nil] lastObject];
                cell.delegate = self;
                cell.indexPath = indexPath;
                cell.model = self.listArray[indexPath.row];
                if (indexPath.row == 1) {
                    cell.textView.text = _addShopModel.descriptionField?[NSString stringWithFormat:@"%@",_addShopModel.descriptionField]:@"";
                    cell.desc.hidden = _addShopModel.descriptionField;
                }else{
                    cell.textView.text = _addShopModel.address?[NSString stringWithFormat:@"%@",_addShopModel.address]:@"";
                    cell.desc.hidden = _addShopModel.address;
                }
                return cell;
            }break;
        }
    }
    return nil;
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 100;
    }else{
        switch (indexPath.row) {
            case 0:
            case 2:
            case 3:
            case 5:
            case 6:
            case 7:
            case 8:{
                return 50;
            }break;
            case 9:{
//                AddShopFooterViewTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//                txjLog(@"%.2f",cell.cellHeight);
                if (self.dicH[indexPath]) {
                    NSNumber *num = self.dicH[indexPath];
                    return [num floatValue]+20;
                } else {
                    return 60;
                }
                return 100;
            }break;
            default:
                return 100;
                break;
        }
    }
    return 50;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
//MARK:APP lab textfld Delegate
-(void)APP_Lab_TextFld_TableViewCellWithString:(NSString *)string indexPath:(NSIndexPath *)indexpath{
    switch (indexpath.row) {
        case 0:{
            _addShopModel.shop_name = string;
        }break;
        case 7:{
            _addShopModel.service_hotline = string;
        }break;
        default:
            break;
    }
}
//MARK:APP lab textView Delegate
-(void)APP_Lab_TextView_TableViewCellString:(NSString *)string indexPath:(NSIndexPath *)indepath{
    switch (indepath.row) {
        case 1:
            _addShopModel.descriptionField = string;
            break;
        case 4:
            _addShopModel.address = string;
            break;
        default:
            break;
    }
}
-(void)Getshopcate:(void(^)(NSArray *array))complet{
    [[HTTPSessionManager sharedManager] POST:@"/api/manager/getshopcate" parameters:@{} callBack:^(RespondModel *responseModel) {
        if (responseModel.status == 200) {
            if (complet) {
                complet(responseModel.data);
            }
        }
    }];
}
#pragma mark ====== RootTableCellDelegate ======
- (void)updateTableViewCellHeight:(AddShopFooterViewTableViewCell *)cell andheight:(CGFloat)height andIndexPath:(NSIndexPath *)indexPath {
    if (![self.dicH[indexPath] isEqualToNumber:@(height)]) {
        self.dicH[indexPath] = @(height);
        [self.tableView reloadData];
    }
}
-(void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath withContent:(NSArray *)selectArray{
    if (indexPath.section == 1 && indexPath.row == 9) {
        self.addShopModel.business_tag = [selectArray toJSONString];
        txjLog(@" self.addShopModel.business_tag is %@",self.addShopModel.business_tag);
    }
}

-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = [UIView new];

    }
    return _tableView;
}

-(XCImageUploadView *)uploadView{
    if (!_uploadView) {
        if (_isEdit) {
            NSArray *array = (NSArray *)_addShopModel.shop_img;
            for (NSString *str in array) {
                txjLog(@"str is %@",str);
            }
            _uploadView = [[XCImageUploadView alloc]initWithImageUrlArray:array canUpload:YES];
            _uploadView.tipsLabel.text = @""/*self.uploadView.fileNameArray.count?@"":@"请选择店铺图片"*/;
        }else{
            _uploadView = [[XCImageUploadView alloc]init];
            _uploadView.tipsLabel.text = @"请选择店铺图片";
        }
    }
    return _uploadView;
}
-(void)getLocation{
    //判断定位功能是否打开
    if ([CLLocationManager locationServicesEnabled]) {
        locationmanager = [[CLLocationManager alloc]init];
        locationmanager.delegate = self;
        [locationmanager requestAlwaysAuthorization];
        currentCity = [NSString new];
        [locationmanager requestWhenInUseAuthorization];
        
        /*
         定位精确度
         kCLLocationAccuracyBestForNavigation    最适合导航
         kCLLocationAccuracyBest    精度最好的
         kCLLocationAccuracyNearestTenMeters    附近10米
         kCLLocationAccuracyHundredMeters    附近100米
         kCLLocationAccuracyKilometer    附近1000米
         kCLLocationAccuracyThreeKilometers    附近3000米
         */
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest;
        /*
         每隔多少米更新一次位置，即定位更新频率
         */
        locationmanager.distanceFilter = 5.0;
        [locationmanager startUpdatingLocation];
    }
}
#pragma mark CoreLocation delegate (定位失败)
//定位失败后调用此代理方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    //设置提示提醒用户打开定位服务
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"允许定位提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark 定位成功后则执行此代理方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [locationmanager stopUpdatingLocation];
    //旧址
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    //打印当前的经度与纬度
    txjLog(@"%f,%f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
    
    self.addShopModel.longitude = [NSString stringWithFormat:@"%f",currentLocation.coordinate.longitude];
    self.addShopModel.latitude = [NSString stringWithFormat:@"%f",currentLocation.coordinate.latitude];
    
    /*
     currentLocation.altitude:海拔高度，正数表示在海平面之上，而负数表示在海平面之下
     currentLocation.verticalAccuracy:海拔高度的精度。为正值表示海拔高度的误差为对应的米数；为负表示altitude(海拔高度)的值无效
     currentLocation.horizontalAccuracy:位置的精度(半径)。位置精度通过一个圆表示，实际位置可能位于这个圆内的任何地方。这个圆是由coordinate(坐标)和horizontalAccuracy(半径)共同决定的，horizontalAccuracy的值越大，那么定义的圆就越大，因此位置精度就越低。如果horizontalAccuracy的值为负，则表明coordinate的值无效
     currentLocation.speed:速度。该属性是通过比较当前位置和前一个位置，并比较它们之间的时间差异和距离计算得到的。鉴于Core Location更新的频率，speed属性的值不是非常精确，除非移动速度变化很小
     */
    //反地理编码
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            currentCity = placeMark.locality;
            
            if (!currentCity) {
                currentCity = @"无法定位当前城市";
            }
            
            /*看需求定义一个全局变量来接收赋值*/
            txjLog(@"----%@",placeMark.country);//当前国家
            txjLog(@"placemarks %@",placemarks);
            txjLog(@"%@",currentCity);//当前的城市
            //            NSLog(@"%@",placeMark.subLocality);//当前的位置
            //            NSLog(@"%@",placeMark.thoroughfare);//当前街道
            //            NSLog(@"%@",placeMark.name);//具体地址
            
        }
    }];
    
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
