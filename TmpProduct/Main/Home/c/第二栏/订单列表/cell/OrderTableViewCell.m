//
//  OrderTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "UIImageView+TXJCategory.h"
@interface OrderTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *goods_name;
@property (weak, nonatomic) IBOutlet UILabel *goods_money;
@property (weak, nonatomic) IBOutlet UILabel *goods_num;
@property (weak, nonatomic) IBOutlet UILabel *total_money;

@end
@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.image.layer.masksToBounds = YES;
    self.image.layer.cornerRadius = 4;
    self.image.layer.borderWidth = kOnePx;
    self.image.layer.borderColor = UIColor.appLineColor.CGColor;
}
-(void)setModel:(OrderListOrder_good *)model{
    _model = model;
    [_image goodsImageUrl:_model.image];
    _goods_name.text = [NSString stringWithFormat:@"%@",_model.goods_name];
    _goods_money.text = [NSString stringWithFormat:@"￥%@",_model.goods_money];
    _goods_num.text = [NSString stringWithFormat:@"x%li",_model.goods_num];
    _total_money.text =[NSString stringWithFormat:@"￥%@",_model.total_money];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
