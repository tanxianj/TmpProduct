//
//  APP_Lab_Lab_image_TableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "APP_Lab_Lab_image_TableViewCell.h"
#import "NSString+Height.h"

@implementation APP_Lab_Lab_image_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(NSDictionary *)model{
    _model = model;
    _titleLab.text = _model[@"title"];
    self.desc_status_str = _model[@"desc"];
    _titleLab_width.constant = [NSString getWidth_With_height:18 String:_titleLab.text FontSize:14.0];
}
-(void)setDesc_status_str:(NSString *)desc_status_str{
    _desc_status_str = desc_status_str;
    
    _descLab.textColor = [UIColor appTextDescTwoColor];
    _descLab.text = _desc_status_str;
}

-(void)setSelect_status_str:(NSString *)select_status_str{
    _select_status_str = select_status_str;
    _descLab.textColor = [UIColor appTextColor];
    _descLab.text = _select_status_str;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
