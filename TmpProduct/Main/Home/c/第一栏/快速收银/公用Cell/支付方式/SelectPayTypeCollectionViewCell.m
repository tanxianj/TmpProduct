//
//  SelectPayTypeCollectionViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "SelectPayTypeCollectionViewCell.h"

@implementation SelectPayTypeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = UIColor.appBackgroundColor;
}
-(void)setModel:(NSDictionary *)model{
    _model = model;
    _image.image = [UIImage imageNamed:_model[@"image"]];
    _title.text = _model[@"title"];
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        _image.image = [UIImage imageNamed:_model[@"selectimage"]];
        _title.textColor = [UIColor colorWithHexString:_model[@"titleSeletColor"]];
    }else{
        _image.image = [UIImage imageNamed:_model[@"image"]];
        _title.textColor = [UIColor appTextDescTwoColor];
    }
}
@end
