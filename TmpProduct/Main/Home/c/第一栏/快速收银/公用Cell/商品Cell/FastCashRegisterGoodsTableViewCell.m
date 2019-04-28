//
//  FastCashRegisterGoodsTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "FastCashRegisterGoodsTableViewCell.h"
@interface FastCashRegisterGoodsTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end
@implementation FastCashRegisterGoodsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(GoodsCheckoutModel *)model{
    _model = model;
    _titleLab.text = _model.goods_name;
    _numLab.text = [NSString stringWithFormat:@"x%@",_model.goods_num];
    _price.text = [NSString stringWithFormat:@"￥%@",_model.goods_price];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
