//
//  HomeOneCollectionViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "HomeOneCollectionViewCell.h"
#import "KuaiSuSYViewController.h"
#import "LoginAPPViewController.h"
@interface HomeOneCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *homeLab_mg_bottom;
@property (strong, nonatomic)NSArray * array;
@end
@implementation HomeOneCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    _homeLab_mg_bottom.constant = ISX?104:94;
    for (int i = 0; i<self.array.count; i++) {
        NSDictionary *dic = self.array[i];
        UIView *view = [BaseClassTool viewWithBackgroundColor:UIColor.clearColor];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(i*kScreenWidth/3);
            make.width.offset(kScreenWidth/3);
            make.height.offset(94);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:dic[@"image"]]];
        [view addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(view);
            make.width.height.offset(32);
            make.top.offset(15);
        }];
        UILabel *lab = [BaseClassTool labelWithFont:14.0 textColor:UIColor.whiteColor textAlignment:NSTextAlignmentCenter];
        lab.text = dic[@"title"];
        [view addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(view);
            make.bottom.equalTo(view.mas_bottom).offset(-15);
        }];
        [view txj_whenTapped:^{
            [[UIViewController getCurrentVC].view endEditing:YES];
            txjLog(@"%@",dic[@"title"]);
            if (![UserModel sharedUserModel].token) {
                 LoginAPPViewController *vc = [LoginAPPViewController new];
                //把当前控制器作为背景
                [UIViewController getCurrentVC].definesPresentationContext = YES;
                
                //设置模态视图弹出样式
                vc.modalPresentationStyle = UIModalPresentationFullScreen;
                [[UIViewController getCurrentVC] presentViewController:vc animated:YES completion:nil];
                return;
            }
            if (![UserInfoAndShopModel sharedUserModel].shop.idField) {
                [XCToast showWithMessage:@"请先设置默认店铺！"];
                return;
            }
            ViewController *vc = (ViewController *)[[NSClassFromString(dic[@"ViewController"]) alloc] init];
            if (vc) {
                if ([vc isKindOfClass:[KuaiSuSYViewController class]] ) {
                    KuaiSuSYViewController *vcc = [KuaiSuSYViewController new];
                    vcc.type = FastCashRegisterTypeOne;
                    [vcc defaultNavigationBarSetWithTitle:dic[@"title"]];
                    vcc.hidesBottomBarWhenPushed = YES;
                    [[UIViewController getCurrentVC].navigationController pushViewController:vcc animated:YES];
                }else{
                    vc.hidesBottomBarWhenPushed = YES;
                    [vc defaultNavigationBarSetWithTitle:dic[@"title"]];
                    [[UIViewController getCurrentVC].navigationController pushViewController:vc animated:YES];
                }
                
            }else{
                [XCToast showWithMessage:@"没有控制器"];
            }
        }];
    }
    
}
-(NSArray *)array{
    if (!_array) {
        _array = @[@{
                   @"image":@"ast-moving consumption",
                   @"title":@"快速收银",
                   @"ViewController":@"KuaiSuSYViewController"
                   },
                   @{
                   @"image":@"to collect money",
                   @"title":@"产品收银",
                   @"ViewController":@"ProductCashRegisterViewController"
                   },
                   @{
                   @"image":@"collegiate bench",
                   @"title":@"优惠核销 ",
                   @"ViewController":@"CALayerViewController"
                   },
                   ];
    }
    return _array;
}
@end
