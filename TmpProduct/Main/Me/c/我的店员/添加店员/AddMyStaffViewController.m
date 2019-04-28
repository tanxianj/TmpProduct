//
//  MyStaffViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "AddMyStaffViewController.h"
#import "UIImage+Category.h"
#import <TZImagePickerController/TZImagePickerController.h>
#import <TZImagePickerController/TZLocationManager.h>

@interface AddMyStaffViewController ()<UITableViewDelegate,UITableViewDataSource,APP_Lab_TextFld_TableViewCellDelagate,TZImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, strong) UIView * btnSuperView;
@property (nonatomic, strong) UIButton * addBtn;
@end

@implementation AddMyStaffViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (_MyStaffType == 0) {
    [self defaultNavigationBarSetWithTitle:@"添加店员"];
    }else{
        [self defaultNavigationBarSetWithTitle:@"编辑店员" Right:@"删除" rightItemBlock:^{
            
        }];
    }
    [self.listArray addObjectsFromArray:@[@{@"title":@"用户名称",@"desc":@"请输入用户名称"},
                                          @{@"title":@"手机号码",@"desc":@"请输入手机号码"},
                                          @{@"title":@"登录密码",@"desc":@"请输入登录密码"},
                                          @{@"title":@"店员状态",@"desc":@"请选择店员状态"},]];
    if (_MyStaffType==0) {
        _model = [[AddMyStaffModel alloc]init];
    }
}
//MARK:初始化子视图
- (void)initializeSubViews{
    __weak typeof(self) weakSelf = self;
    [self.addBtn txj_addEventHandler:^{
        [weakSelf.view endEditing:YES];
        [weakSelf AddMyStaff];
    } forControlEvents:UIControlEventTouchUpInside];
}
-(void)AddMyStaff{
    if (_MyStaffType == 0) {
        self.model.merchant_id = [UserInfoAndShopModel sharedUserModel].shop.merchant_id;
        self.model.shop_id = [UserInfoAndShopModel sharedUserModel].shop.idField;
        [[HTTPSessionManager sharedManager] POST:@"/api/manager/addadmin" parameters:[self.model toDictionary] callBack:^(RespondModel *responseModel) {
            [XCToast showWithMessage:responseModel.message];
            if (responseModel.status == 200) {
                [self.navigationController popViewControllerAnimated:YES];
            }
        }];
    }else{
        NSString *url = [NSString stringWithFormat:@"/api/manager/updateadmin/%@",_idStr];
        [[HTTPSessionManager sharedManager] POST:url parameters:[self.model toDictionary] callBack:^(RespondModel *responseModel) {
            [XCToast showWithMessage:responseModel.message];
            if (responseModel.status == 200) {
                [self.navigationController popViewControllerAnimated:YES];
            }
        }];
    }
    
}
//MARK:添加子视图
- (void)addSubViews{
    [self.btnSuperView addSubview:self.addBtn];
    [self.view addSubview:self.tableView];
}
//MARK:设置约束
- (void)setupSubViewMargins{
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.btnSuperView).insets(UIEdgeInsetsMake(40, 12, 10, 12));
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(([UIDevice currentDevice].isX?88:64), 0, ISX?24:0, 0));
    }];
}
//MARK:显示分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section?self.listArray.count:1;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    if (indexPath.section == 0) {
        APPSelectHeaderTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APPSelectHeaderTableViewCell" owner:self options:nil] lastObject];
        cell.titleLab.text = @"店员头像";
        [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
            [YZActionSheet showActionSheetWithNotice:@"选择会员头像" titles:@[@"拍照",@"相册"] selected:^(NSInteger idx) {
                
                switch (idx) {
                    case 0:{
                        
                        [weakSelf pushImagePickerController:^(UIImage *image) {
                            cell.header.image = image;
                            [weakSelf uploadImage:image];
                        }];
                    }break;
                    case 1:{
                        [weakSelf pushTZImagePickerController:^(UIImage *image) {
                            cell.header.image = image;
                            [weakSelf uploadImage:image];
                        }];
                        
                    }break;
                    default:
                        break;
                }
            }];
        }];
        if (_model.head_pic) {
            [cell.header sd_setImageWithURL:[NSURL URLWithString:_model.head_pic] placeholderImage:[UIImage imageNamed:@"def-head"]];
        }
        return cell;
    }else{
        switch (indexPath.row) {
            case 0:
            case 1:
            case 2:{
                APP_Lab_TextFld_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
                cell.delegate  = self;
                cell.indexPath = indexPath;
                cell.model = self.listArray[indexPath.row];
                switch (indexPath.row) {
                    case 0:
                        cell.textFld.text = self.model.name?[NSString stringWithFormat:@"%@",self.model.name]:@"";
                        break;
                    case 1:
                        cell.textFld.text = self.model.mobile?[NSString stringWithFormat:@"%@",self.model.mobile]:@"";
                        
                        break;
                    case 2:
                        cell.textFld.text = self.model.password?[NSString stringWithFormat:@"%@",self.model.password]:@"";
                        cell.textFld.secureTextEntry = YES;
                        break;
                    default:
                        break;
                }
                return cell;;
            }break;
                
            default:{
                APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                cell.model = self.listArray[indexPath.row];
                [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                    NSArray *array = @[@"禁用",@"启用"];
                    [YZActionSheet showActionSheetWithNotice:self.listArray[indexPath.row][@"desc"] titles:array selected:^(NSInteger idx) {
                        weakSelf.model.status = idx;
                        cell.select_status_str = array[idx];
                    }];
                }];
                
                cell.select_status_str = self.model.status==0?@"禁用":@"启用";
                
                return cell;
            }break;
        }
       
    }
    
}
//MARK:点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row?50:70;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(void)APP_Lab_TextFld_TableViewCellWithString:(NSString *)string indexPath:(NSIndexPath *)indexpath{
    switch (indexpath.row) {
        case 0:
            _model.name = string;
            break;
        case 1:
            _model.mobile = string;
            break;
        case 2:
            _model.password = string;
            break;
        default:
            break;
    }
}
-(void)uploadImage:(UIImage *)image{
    [[HTTPSessionManager sharedManager]POST:@"/api/file/upload" parameters:@{@"file":[image convertToBase64StringWithCompressionQuality:0.5],@"type":@"1"} callBack:^(RespondModel *responseModel) {
        [XCToast showWithMessage:responseModel.message];
        if (responseModel.status == 200) {
            self.model.head_pic = responseModel.data[@"url"];
        }else{
            
        }
    }];
}
-(void)pushTZImagePickerController:(void(^)(UIImage *image))complete{
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
    imagePicker.allowPickingVideo = NO;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:imagePicker animated:1 completion:nil];
    self.AddMyStaffblackSelectImag = complete;
}
// 调用相机
- (void)pushImagePickerController:(void(^)(UIImage *image))complete{
    // 提前定位
//    __weak typeof(self) weakSelf = self;
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVc.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        
        [mediaTypes addObject:(NSString *)kUTTypeImage];
        
        if (mediaTypes.count) {
            _imagePickerVc.mediaTypes = mediaTypes;
        }
        [self presentViewController:self.imagePickerVc animated:YES completion:nil];
    } else {
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
    self.AddMyStaffblackSelectImag = complete;
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (self.AddMyStaffblackSelectImag) {
            self.AddMyStaffblackSelectImag(image);
        }

        
    }
}
// TZImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    if (self.AddMyStaffblackSelectImag) {
        self.AddMyStaffblackSelectImag(photos[0]);
    }
    
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 200;
        _tableView.tableFooterView = self.btnSuperView;
        
    }
    return _tableView;
}
-(UIView *)btnSuperView{
    if (!_btnSuperView) {
        _btnSuperView = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
        _btnSuperView.frame = CGRectMake(0, 0, kScreenWidth, 94);
    }
    return _btnSuperView;
}
-(UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [BaseClassTool buttonWithFont:14.0 titleColor:UIColor.whiteColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter title:@"登记"];
        _addBtn.backgroundColor = UIColor.appBlueColor;
        _addBtn.layer.masksToBounds = YES;
        _addBtn.layer.cornerRadius = 22;
    }
    return _addBtn;
}
- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (@available(iOS 9, *)) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        
    }
    return _imagePickerVc;
}
@end
