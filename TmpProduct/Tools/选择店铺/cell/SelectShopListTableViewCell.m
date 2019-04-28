//
//  SelectShopListTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "SelectShopListTableViewCell.h"
#import "NSString+LabStyle.h"
@interface SelectShopListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;


@end
@implementation SelectShopListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(MyShopListModel *)model{
    _model = model;
    _title.text = _model.shop_name;
    _desc.text = _model.address;
}
-(void)setModelTwo:(FullReductionModel *)modelTwo{
    _modelTwo = modelTwo;
    _title.text = _modelTwo.name;
    _desc.attributedText = [NSString AttributedString:@[@" 消费满 ",[NSString stringWithFormat:@"%@元",_modelTwo.amount],@" 立减 ",[NSString stringWithFormat:@"%@元",_modelTwo.discount]]
                                        FontSizeArray:@[@14,@14,@14,@14]
                                          ColorsArray:@[[UIColor appTextColor],[UIColor appRedColor],[UIColor appTextColor],[UIColor appRedColor]]];
}
-(void)setType:(NSInteger)type{
    _type = type;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    switch (_type) {
        case 0:{
            
        }break;
        case 1:{
            _image.selected = selected;
        }break;
        default:
            break;
    }
    // Configure the view for the selected state
}

@end
