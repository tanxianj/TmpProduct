//
//  FastCashRegisterOneTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "FastCashRegisterOneTableViewCell.h"

@implementation FastCashRegisterOneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setDescStr:(NSString *)descStr{
    _descStr = descStr;
    _user_mobile.text = _descStr;
    _user_mobile.textColor = UIColor.appTextDescTwoColor;
}
-(void)setSelectStr:(NSString *)selectStr{
    _selectStr = selectStr;
    _user_mobile.text = _selectStr;
    _user_mobile.textColor = UIColor.appTextColor;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
