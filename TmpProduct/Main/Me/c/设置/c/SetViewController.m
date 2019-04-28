//
//  SetViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "SetViewController.h"
#import "App_lab_switch_TableViewCell.h"
#import "App_lab_descLab_TableViewCell.h"
#import "LocalDataTool.h"

@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) TableView * tableView;
@property (nonatomic, strong) UIView * btnView;
@property (nonatomic, strong) UIButton * LoginOutBtn;
@property (nonatomic, copy  ) NSString *size;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view.
    [self.listArray addObjectsFromArray:@[
                                          @[
                                              @{@"title":@"收款语音提醒",
                                                @"desc":@"switch"
                                                },
                                              @{@"title":@"线上订单语音提醒",
                                                @"desc":@"switch"
                                                },
                                              ],
                                          @[
//                                              @{@"title":@"系统通知推送",
//                                                @"desc":@"switch"
//                                                },
                                              @{@"title":@"清除缓存",
                                                @"desc":@"计算中…"
                                                },
                                              @{@"title":@"版本信息",
                                                @"desc":[NSString stringWithFormat:@"当前版本:%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]
                                                },]]];
    _size = @"计算中…";
}
//MARK:初始化子视图
- (void)initializeSubViews{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.size = [NSString stringWithFormat:@"%.2fM",[[SDImageCache sharedImageCache] getSize]/1024.f/1024.f];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        });
    });
    
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
    [self.btnView addSubview:self.LoginOutBtn];
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
    return self.listArray.count;
}
//MARK:每个分组中类目条数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.listArray[section];
    return array.count;
}
//MARK:TableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = self.listArray[indexPath.section];
    if ([[NSString stringWithFormat:@"%@",array[indexPath.row][@"desc"]] isEqualToString:@"switch"]) {
        App_lab_switch_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"App_lab_switch_TableViewCell" owner:self options:nil] lastObject];
        cell.model = array[indexPath.row];
        cell.indexpath = indexPath;
        return cell;
    }else{
        App_lab_descLab_TableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"App_lab_descLab_TableViewCell" owner:self options:nil] lastObject];
        
        if (indexPath.row==0) {
            cell.descLab.text = self.size;
            cell.titleLab.text = array[indexPath.row][@"title"];
        }else{
            cell.model = array[indexPath.row];
        }
        return cell;
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
    if (indexPath.section ==1 && indexPath.row == 0) {
        if ([[SDImageCache sharedImageCache] getSize] == 0) {
            return;
        }
        __weak typeof(self) weakSelf = self;
        [YZActionSheet showActionSheetWithNotice:[NSString stringWithFormat:@"您的缓存有%@", self.size] titles:@[@"清除缓存"] selected:^(NSInteger idx) {
            [weakSelf clearCache:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]];
            //超市分享图片数据本地化
            
        }];
    }
}
//MARK:Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)clearCache:(NSString *)path{
    self.size = @"清理中…";
    [self.tableView reloadData];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSFileManager *fileManager=[NSFileManager defaultManager];
        if ([fileManager fileExistsAtPath:path]) {
            NSArray *childerFiles=[fileManager subpathsAtPath:path];
            for (NSString *fileName in childerFiles) {
                if ([fileName hasPrefix:@"User"] || [fileName hasPrefix:@"App"]) {
                    continue;
                }
                NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
                [fileManager removeItemAtPath:absolutePath error:nil];
            }
        }
        
    });
    
    
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.size = @"0.00M";
            [self.tableView reloadData];
        });
        
    }];
}
-(TableView *)tableView{
    if (!_tableView) {
        _tableView = [[TableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.estimatedRowHeight = 200;
        [self.btnView addSubview:self.LoginOutBtn];
        [self.LoginOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btnView.mas_left).offset(12);
            make.top.equalTo(self.btnView).offset(40);
            make.height.offset(44);
            make.width.offset(kScreenWidth-24);
        }];
        _tableView.tableFooterView = self.btnView;
        
    }
    return _tableView;
}
-(UIView *)btnView{
    if (!_btnView) {
        _btnView = [BaseClassTool viewWithBackgroundColor:UIColor.appBackgroundColor];
        _btnView.frame = CGRectMake(0, 0, kScreenWidth, 94);
    }
    return _btnView;
}
-(UIButton *)LoginOutBtn{
    if (!_LoginOutBtn) {
        _LoginOutBtn = [self BtnWithBackGroundColor:UIColor.appBlueColor title:@"退出登录"];
        [_LoginOutBtn txj_addEventHandler:^{
            txjLog(@"退出登录");
            [LocalDataTool removeKeepUserInfo];
            [LocalDataTool removeUserInfoAndAshop];
            [LocalDataTool removegetearnings];
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _LoginOutBtn;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
