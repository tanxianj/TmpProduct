//
//  TXJSelectShopDiscountTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/20.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "TXJSelectShopDiscountTableViewCell.h"
#import "NSString+LabStyle.h"

@implementation TXJSelectShopDiscountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    hollow circle 空心
//    checked 实心
}
-(void)setModelTwo:(FullReductionModel *)modelTwo{
    _modelTwo = modelTwo;
    _titleLab.text = _modelTwo.name;
    _descLab.attributedText = [NSString AttributedString:@[@" 消费满 ",[NSString stringWithFormat:@"%@元",_modelTwo.amount],@" 立减 ",[NSString stringWithFormat:@"%@元",_modelTwo.discount]]
                                        FontSizeArray:@[@14,@14,@14,@14]
                                          ColorsArray:@[[UIColor appTextColor],[UIColor appRedColor],[UIColor appTextColor],[UIColor appRedColor]]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    _imageV.image = [UIImage imageNamed:selected?@"checked":@"hollow circle"];
    // Configure the view for the selected state
}

@end
