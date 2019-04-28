//
//  MyStaffTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "MyStaffTableViewCell.h"
#import "NSString+LabStyle.h"
@interface MyStaffTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *header;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *mobile;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *is_merchant;

@end
@implementation MyStaffTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(MyStaffModel *)model{
    _model = model;
    [_header sd_setImageWithURL:[NSURL URLWithString:_model.head_pic] placeholderImage:[UIImage imageNamed:@"def-head"]];
    NSString *name = [NSString stringWithFormat:@"%@",_model.name];
    NSString *is_merchant = [NSString stringWithFormat:@"%@",_model.is_merchant==1?@"(管理员)":@"(普通店员)"];
    _name.text =name;
    _is_merchant.text = is_merchant;
    _is_merchant.textColor = _model.is_merchant==1?UIColor.appRedColor:UIColor.appBlueColor;
//    [NSString AttributedString:@[name,is_merchant] FontSizeArray:@[@14.0,@12.0] ColorsArray:@[UIColor.appTextColor,_model.is_merchant==1?UIColor.appRedColor:UIColor.appBlueColor]];
    _mobile.text = _model.mobile;
    switch (_model.status) {
        case 0:
            _status.text = @"禁用";
            break;
        case 1:
            _status.text = @"启用";
            break;
        default:
            _status.text = @"未知";
            break;
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
