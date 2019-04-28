//
//  ProductCashRegisterTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ProductCashRegisterTableViewCell.h"
#import "UIImageView+TXJCategory.h"
#import "NSString+LabStyle.h"
@interface ProductCashRegisterTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *goods_img;
@property (weak, nonatomic) IBOutlet UILabel *goods_name;
@property (weak, nonatomic) IBOutlet UILabel *goods_price;
@property (weak, nonatomic) IBOutlet UILabel *goods_select_num;
@property (weak, nonatomic) IBOutlet UILabel *goods_num;

@end
@implementation ProductCashRegisterTableViewCell

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
}
-(void)setGoodsSlectNum:(NSInteger)goodsSlectNum{
    _goodsSlectNum = goodsSlectNum;
    _goods_select_num.text = [NSString stringWithFormat:@"%li",_goodsSlectNum];
}
- (IBAction)deleteBtnAction:(id)sender {
    if (_goodsSlectNum > 0) {
        _goodsSlectNum--;
        [self allocGoodsCheckoutModel];
    }
    
//    txjLog(@"减%@",[_goodsCheckModel toDictionary]);
}
- (IBAction)addBtnAction:(id)sender {
    if (_model.goods_num > 0) {
        if (_goodsSlectNum<_model.goods_num) {
            _goodsSlectNum++;
        }else{
            [XCToast showWithMessage:[NSString stringWithFormat:@"该商品最大库存为%li",_model.goods_num]];
        }
    }else{
        _goodsSlectNum++;
    }
    [self allocGoodsCheckoutModel];
//    txjLog(@"加 %@",[_goodsCheckModel toDictionary]);
    
}
-(void)allocGoodsCheckoutModel{
    _goodsCheckModel = [[GoodsCheckoutModel alloc]init];
    _goodsCheckModel.goods_num = [NSString stringWithFormat:@"%li",_goodsSlectNum];
    _goodsCheckModel.goods_name = _model.goods_name;
    _goodsCheckModel.goods_id = [NSString stringWithFormat:@"%li",_model.idField];
    _goodsCheckModel.goods_price = [NSString stringWithFormat:@"%.2f",_goodsSlectNum * [_model.goods_price floatValue]];
    _goods_select_num.text = [NSString stringWithFormat:@"%li",_goodsSlectNum];
    if (self.delegate && [self.delegate respondsToSelector:@selector(ProductCashRegisterTableViewCell:GoodsListModel:)]) {
        [self.delegate ProductCashRegisterTableViewCell:_goodsCheckModel GoodsListModel:_model];
    }
}
-(void)setGoodsCheckModel:(GoodsCheckoutModel *)goodsCheckModel{
    _goodsCheckModel = goodsCheckModel;
    _goodsSlectNum = [_goodsCheckModel.goods_num integerValue];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
