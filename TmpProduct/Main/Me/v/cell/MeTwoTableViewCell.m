//
//  MeTwoTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "MeTwoTableViewCell.h"
@interface MeTwoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@end
@implementation MeTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(NSDictionary *)model{
    _model = model;
    _image.image = [UIImage imageNamed:_model[@"image"]];
    _title.text = _model[@"title"];
    _desc.hidden  = ![_model[@"showDesc"] isEqualToString:@"YES"];
    if ([_model[@"showDesc"] isEqualToString:@"YES"]) {
        if ([UserInfoAndShopModel sharedUserModel].shop.shop_name) {
            _desc.text = [NSString stringWithFormat:@"(%@)",[UserInfoAndShopModel sharedUserModel].shop.shop_name];
        }
        
    }
}
-(void)reloadData{
    if ([_model[@"showDesc"] isEqualToString:@"YES"]) {
        if ([UserInfoAndShopModel sharedUserModel].shop.shop_name) {
            _desc.text = [NSString stringWithFormat:@"(%@)",[UserInfoAndShopModel sharedUserModel].shop.shop_name];
        }
        
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
