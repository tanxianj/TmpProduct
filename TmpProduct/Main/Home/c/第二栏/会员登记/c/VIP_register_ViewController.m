//
//  VIP_register_ViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "VIP_register_ViewController.h"
#import "addVipModel.h"
#import "TxjSelectUIImageViewController.h"
#import <TZImagePickerController/TZImagePickerController.h>
#import <TZImagePickerController/TZLocationManager.h>
#import "UIImage+Category.h"
#import "NSString+TimeString.h"

@interface VIP_register_ViewController ()<UITableViewDelegate,UITableViewDataSource,APP_Lab_TextFld_TableViewCellDelagate,TZImagePickerControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * btnSuperView;
@property (nonatomic, strong) UIButton * addBtn;
@property (nonatomic, strong) addVipModel * model;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@end

@implementation VIP_register_ViewController
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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.listArray addObjectsFromArray:@[
                                          @{
                                              @"title":@"姓名",
                                              @"desc":@"请输入姓名"
                                              },
                                          @{
                                              @"title":@"性别",
                                              @"desc":@"请选择性别"
                                              },
                                          @{
                                              @"title":@"电话",
                                              @"desc":@"请输入电话"
                                              },
                                          @{
                                              @"title":@"生日",
                                              @"desc":@"请选择生日"
                                              },
                                          @{
                                              @"title":@"备注",
                                              @"desc":@"请输入备注"
                                              },
                                          ]];
    _model = [[addVipModel alloc]init];
}
//MARK:初始化子视图
- (void)initializeSubViews{
    
    __weak typeof(self) weakSelf = self;
    [self.addBtn txj_addEventHandler:^{
        [weakSelf.view endEditing:YES];
        txjLog(@"会员登记保存");
        [[HTTPSessionManager sharedManager] POST:@"/api/manager/adduser" parameters:[weakSelf.model toDictionary] callBack:^(RespondModel *responseModel) {
            [XCToast showWithMessage:responseModel.message];
            if (responseModel.status == 200) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
        }];
    } forControlEvents:UIControlEventTouchUpInside];
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
    return section?5:1;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    if (indexPath.section == 0) {
        APPSelectHeaderTableViewCell * cell= [[[NSBundle mainBundle] loadNibNamed:@"APPSelectHeaderTableViewCell" owner:self options:nil] lastObject];
        cell.titleLab.text = @"会员头像";
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
            case 2:
            case 4:{
                APP_Lab_TextFld_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_TextFld_TableViewCell" owner:self options:nil] lastObject];
                cell.model = self.listArray[indexPath.row];
                cell.delegate = self;
                cell.indexPath = indexPath;
                if (indexPath.row==2) {
                    cell.textFld.keyboardType = UIKeyboardTypeNumberPad;
                }
                switch (indexPath.row) {
                    case 0:{
                        cell.textFld.text = _model.name?[NSString stringWithFormat:@"%@",_model.name]:@"";
                    }break;
                    case 2:{
                        cell.textFld.text = _model.mobile?[NSString stringWithFormat:@"%@",_model.mobile]:@"";
                    }break;
                    case 4:{
                        cell.textFld.text = _model.desc?[NSString stringWithFormat:@"%@",_model.desc]:@"";
                    }break;
                    default:
                        break;
                }
                return cell;
            }break;
                
            default:{
                APP_Lab_Lab_image_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"APP_Lab_Lab_image_TableViewCell" owner:self options:nil] lastObject];
                cell.model = self.listArray[indexPath.row];
                NSMutableArray *tmpArray = [NSMutableArray array];
                switch (indexPath.row) {
                        
                    case 1:{
                        [tmpArray addObjectsFromArray:@[@"保密",@"男",@"女"]];
                        [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                            [YZActionSheet showActionSheetWithNotice:self.listArray[indexPath.row][@"desc"] titles:tmpArray selected:^(NSInteger idx) {
                                weakSelf.model.sex = [NSString stringWithFormat:@"%li",idx];
                                cell.select_status_str = tmpArray[idx];
                            }];
                        }];
                        if (self.model.sex) {
                            cell.select_status_str = tmpArray[[self.model.sex integerValue]];
                        }
                    }break;
                    case 3:{
                        [cell.contentView txj_whenTapped:^{
                                [weakSelf.view endEditing:YES];
                            [TXJSelectDateView showDateViewWithscrollToDate:[self dateFromString:@"01-01" format:@"mm-dd"] Title:self.listArray[indexPath.row][@"desc"] DateStyle:DateStyleShowMonthDay NowDate_is_Max_Min:@"" completelp:^(NSString *dateString) {
                                weakSelf.model.birthday = dateString;
                                cell.select_status_str = dateString;
                            }];
                        }];
                        if (self.model.birthday.length) {
                            cell.select_status_str = self.model.birthday;
                        }
                    }break;
                    default:
                        break;
                }
                
                return cell;
            }break;
        }
        
    }
}
- (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    return [dateFormatter dateFromString:dateString]; }

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
    return indexPath.section?48:70;
}
-(void)APP_Lab_TextFld_TableViewCellWithString:(NSString *)string indexPath:(NSIndexPath *)indexpath{
    switch (indexpath.row) {
        case 0:{
            _model.name = string;
        }break;
        case 2:{
            _model.mobile = string;
        }break;
        case 4:{
            _model.desc = string;
        }break;
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
    self.blackSelectImag = complete;
}
// 调用相机
- (void)pushImagePickerController:(void(^)(UIImage *image))complete{
    // 提前定位
    __weak typeof(self) weakSelf = self;

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
    self.blackSelectImag = complete;
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (self.blackSelectImag) {
            self.blackSelectImag(image);
        }
//        [[HTTPSessionManager sharedManager]POST:@"/api/file/upload" parameters:@{@"file":[self encodeToBase64String:image],@"type":@"1"} callBack:^(RespondModel *responseModel) {
//
//
//            if (responseModel.status == 200) {
//
//
//
//            }else{
//
//
//            }
//        }];
        // save photo and get asset / 保存图片，获取到asset
        
    }
}
// TZImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    if (self.blackSelectImag) {
        self.blackSelectImag(photos[0]);
    }
//    [[HTTPSessionManager sharedManager]POST:@"/api/file/upload" parameters:@{@"file":[self encodeToBase64String:photos[0]],@"type":@"1"} callBack:^(RespondModel *responseModel) {
//        
//        
//        if (responseModel.status == 200) {
//            
//            
//            
//        }else{
//            
//
//        }
//    }];
    
}
- (NSString*)encodeToBase64String:(UIImage*)image {
    NSData *imageData = UIImageJPEGRepresentation(image, .5);
    NSString *string = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return [NSString stringWithFormat:@"data:image/jpeg;base64,%@", string];
//    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
}


-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
