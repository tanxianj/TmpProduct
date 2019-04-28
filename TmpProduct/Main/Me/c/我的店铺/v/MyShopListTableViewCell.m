//
//  MyShopListTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "MyShopListTableViewCell.h"
#import "AddShopViewController.h"
@interface MyShopListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;


@end
@implementation MyShopListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    __weak typeof(self) weakSelf = self;
    [_title txj_whenTapped:^{
        [[UIViewController getCurrentVC].view endEditing:YES];
        txjLog(@"前去编辑");
        [weakSelf GotoEditViewController];
    }];
    [_desc txj_whenTapped:^{
        [[UIViewController getCurrentVC].view endEditing:YES];
        txjLog(@"前去编辑");
        [weakSelf GotoEditViewController];
    }];
}
-(void)GotoEditViewController{
    AddShopViewController *vc = [AddShopViewController new];
    vc.isEdit = YES;
    vc.idF = _model.idField;
    vc.addShopModel = [[AddShopModel alloc]initWithDictionary:[self.model toDictionary]];
    [vc defaultNavigationBarSetWithTitle:@"编辑店铺"];
    [[UIViewController getCurrentVC].navigationController pushViewController:vc animated:YES];
}
-(void)setModel:(MyShopListModel *)model{
    _model = model;
    _title.text = _model.shop_name;
    _desc.text = _model.address;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [_selectBtn setImage:[UIImage imageNamed:selected?@"checked":@"hollow circle"] forState:UIControlStateNormal];
    // Configure the view for the selected state
}

@end
