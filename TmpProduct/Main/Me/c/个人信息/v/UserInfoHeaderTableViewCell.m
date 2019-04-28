//
//  UserInfoHeaderTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "UserInfoHeaderTableViewCell.h"
@interface UserInfoHeaderTableViewCell ()


@end
@implementation UserInfoHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
-(void)reloadData{
    [_header sd_setImageWithURL:[NSURL URLWithString:[UserInfoAndShopModel sharedUserModel].user.head_pic] placeholderImage:[UIImage imageNamed:@"def-head"]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
