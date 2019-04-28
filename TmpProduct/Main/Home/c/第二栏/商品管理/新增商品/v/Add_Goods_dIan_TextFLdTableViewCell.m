//
//  Add_Goods_dIan_TextFLdTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "Add_Goods_dIan_TextFLdTableViewCell.h"
@interface Add_Goods_dIan_TextFLdTableViewCell ()<UITextFieldDelegate>

@end
@implementation Add_Goods_dIan_TextFLdTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _textFld.delegate = self;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.delegate && [self.delegate respondsToSelector:@selector(Add_Goods_dIan_TextFLdTableViewCell:string:)]) {
        [self.delegate Add_Goods_dIan_TextFLdTableViewCell:_indexPath string:textField.text];
        }
}
-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
}
- (IBAction)deleteBtnAction:(id)sender {
    if (self.delegate &&[self.delegate respondsToSelector:@selector(Add_Goods_dIan_TextFLdTableViewCell:)]) {
        [self.delegate Add_Goods_dIan_TextFLdTableViewCell:_indexPath];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
