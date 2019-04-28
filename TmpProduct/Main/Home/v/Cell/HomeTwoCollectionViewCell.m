//
//  HomeTwoCollectionViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "HomeTwoCollectionViewCell.h"
@interface HomeTwoCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *title;
@end
@implementation HomeTwoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(NSDictionary *)model{
    _model = model;
    _image.image = [UIImage imageNamed:_model[@"image"]];
    _title.text = _model[@"title"];
}
@end
