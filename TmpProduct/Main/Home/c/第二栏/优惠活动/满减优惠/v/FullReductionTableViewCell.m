//
//  FullReductionTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "FullReductionTableViewCell.h"
#import "NSString+LabStyle.h"
#import "TXJToslView.h"
#import "Add_FullReduction_ElectronicPreferences_ViewController.h"
@interface FullReductionTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@end
@implementation FullReductionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setCellType:(FullReductionType)cellType{
    _cellType = cellType;
}
-(void)setModelOne:(FullReductionModel *)modelOne{
    _modelOne = modelOne;
    _name.text = _modelOne.name;
    _content.attributedText = [NSString AttributedString:@[@"消费满 ",[NSString stringWithFormat:@"%@元",_modelOne.amount],@" 立减 ",[NSString stringWithFormat:@"%@元",_modelOne.discount]]
                                           FontSizeArray:@[@14,@14,@14,@14]
                                             ColorsArray:@[[UIColor appTextColor],[UIColor appRedColor],[UIColor appTextColor],[UIColor appRedColor]]];
    _desc.text = _modelOne.desc;
    
    switch (_modelOne.status) {
        case 1:
            _status.text = @"(进行中)";
            _status.textColor = UIColor.appGreenColor;
            break;
        default:
            _status.text = @"(已结束)";
            _status.textColor = UIColor.appRedColor;
            break;
    }
}
-(void)setModelTwo:(ElectronicPreferencesModel *)modelTwo{
    _modelTwo = modelTwo;
    _name.text = _modelTwo.name;
    _content.attributedText = [NSString AttributedString:@[@"无门槛立减 ",[NSString stringWithFormat:@"%@元",_modelTwo.money]]
                                           FontSizeArray:@[@14,@14]
                                             ColorsArray:@[[UIColor appTextColor],[UIColor appRedColor]]];
    _desc.text = _modelTwo.desc;
    switch (_modelTwo.status) {
        case 1:
            _status.text = @"(进行中)";
            _status.textColor = UIColor.appGreenColor;
            break;
        default:
            _status.text = @"(已结束)";
            _status.textColor = UIColor.appRedColor;
            break;
    }
}
- (IBAction)editBtnAction:(id)sender {
    switch (_cellType) {
        case FullReductionTypeOne:{
            txjLog(@"编辑满减");
            Add_FullReduction_ElectronicPreferences_ViewController *vc = [Add_FullReduction_ElectronicPreferences_ViewController new];
            vc.type = AddTypeOne;
            vc.idF = _modelOne.idField;
            vc.newOrEdit = NewOrEditTypeEdit;
            [vc defaultNavigationBarSetWithTitle:@"编辑满减优惠"];
            vc.addOneModel = [[AddOneModel alloc] initWithDictionary:[_modelOne toDictionary]];
            [[UIViewController getCurrentVC].navigationController pushViewController:vc animated:YES];
        }break;
        case FullReductionTypeTwo:{
            txjLog(@"编辑电子");
            Add_FullReduction_ElectronicPreferences_ViewController *vc = [Add_FullReduction_ElectronicPreferences_ViewController new];
            vc.idF = _modelTwo.idField;
            vc.type = AddTypeTwo;
            vc.addTwoModel = [[AddTwoModel alloc] initWithDictionary:[_modelTwo toDictionary]];
            [vc defaultNavigationBarSetWithTitle:@"编辑电子优惠券"];
            vc.newOrEdit = NewOrEditTypeEdit;
            [[UIViewController getCurrentVC].navigationController pushViewController:vc animated:YES];
        }break;
        default:
            break;
    }
}
- (IBAction)deleteBtnAction:(id)sender {
    __weak typeof(self) weakSelf = self;
    [TXJToslView showToslViewWithContent:@"是否确认删除?" leftAction:^{
        
    } rightAction:^{
        switch (self.cellType) {
            case FullReductionTypeOne:{
                txjLog(@"删除满减");
                [weakSelf deleteFullReductionData];
            }break;
            case FullReductionTypeTwo:{
                txjLog(@"删除电子");
                [weakSelf deleteElectronicPreferences];
            }break;
            default:
                break;
        }
    }];
    
}
//MARK:删除满减优惠
-(void)deleteFullReductionData{
    NSString *url = [NSString stringWithFormat:@"/api/activity/del/%@",_modelOne.idField];
    [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
        [XCToast showWithMessage:responseModel.message];
        if (responseModel.status == 200) {
            if ([self.delegate respondsToSelector:@selector(NeedReloadData)]) {
                [self.delegate NeedReloadData];
            }
        }
    }];
}
//MARK:删除电子优惠券
-(void)deleteElectronicPreferences{
    NSString *url = [NSString stringWithFormat:@"/api/coupon/del/%@",_modelTwo.idField];
    [[HTTPSessionManager sharedManager] POST:url parameters:@{} callBack:^(RespondModel *responseModel) {
        [XCToast showWithMessage:responseModel.message];
        if (responseModel.status == 200) {
            if ([self.delegate respondsToSelector:@selector(NeedReloadData)]) {
                [self.delegate NeedReloadData];
            }
        }
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
