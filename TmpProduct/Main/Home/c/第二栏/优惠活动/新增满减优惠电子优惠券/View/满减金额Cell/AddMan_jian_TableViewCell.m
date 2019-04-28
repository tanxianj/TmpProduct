//
//  AddMan_jian_TableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "AddMan_jian_TableViewCell.h"
@interface AddMan_jian_TableViewCell ()<UITextFieldDelegate>

@end
@implementation AddMan_jian_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _manTxtFld.delegate = self;
    _jianTextFld.delegate = self;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:self.manTxtFld]) {
        if (self.manBlock) {
            self.manBlock(textField.text);
        }
    }else if ([textField isEqual:self.jianTextFld]){
        if (self.jianBlock) {
            self.jianBlock(textField.text);
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
