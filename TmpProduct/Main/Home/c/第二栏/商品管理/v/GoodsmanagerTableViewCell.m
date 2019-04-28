//
//  GoodsmanagerTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "GoodsmanagerTableViewCell.h"
#import "UIImageView+TXJCategory.h"
#import "NSString+LabStyle.h"
@interface GoodsmanagerTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *goods_img;
@property (weak, nonatomic) IBOutlet UILabel *goods_name;
@property (weak, nonatomic) IBOutlet UILabel *goods_price;
@property (weak, nonatomic) IBOutlet UILabel *goods_num;
@property (weak, nonatomic) IBOutlet UILabel *goods_type;
@property (weak, nonatomic) IBOutlet UILabel *goods_sales;

@end
@implementation GoodsmanagerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(GoodsListModel *)model{
    _model = model;
    [_goods_img goodsImageUrl:_model.goods_img[0]];
    _goods_name.text = _model.goods_name;
    _goods_price.attributedText = [NSString AttributedString:@[@"单价:",[NSString stringWithFormat:@"%@元",_model.goods_price]] FontSizeArray:@[@12,@12] ColorsArray:@[[UIColor appTextColor],[UIColor appRedColor]]];
    if (_model.goods_num >= 0) {
        _goods_num.text = [NSString stringWithFormat:@"库存:%li",_model.goods_num];
    }else{
        _goods_num.text = [NSString stringWithFormat:@"库存:无限库存"];
    }
    _goods_type.text = _model.goods_type == 1?@"普通商品":@"其他商品";
    _goods_sales.text = [NSString stringWithFormat:@"销量:%li",_model.goods_sales];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
