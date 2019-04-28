//
//  App_lab_descLab_TableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "App_lab_descLab_TableViewCell.h"
@interface App_lab_descLab_TableViewCell ()



@end
@implementation App_lab_descLab_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(NSDictionary *)model{
    _model = model;
    _titleLab.text = _model[@"title"];
    _descLab.text = _model[@"desc"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
