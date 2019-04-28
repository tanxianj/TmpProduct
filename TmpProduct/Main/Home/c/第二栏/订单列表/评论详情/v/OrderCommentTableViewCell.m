//
//  OrderCommentTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/24.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "OrderCommentTableViewCell.h"
#import "XCImageUploadView.h"
#import "StarView.h"
#import "XCPhotoBrowser.h"
@interface OrderCommentTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *head_pic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *goods_ratings;
@property (weak, nonatomic) IBOutlet UILabel *created_at;
@property (weak, nonatomic) IBOutlet UIView *upLoadView;
@property (weak, nonatomic) IBOutlet UIView *star_superView;
@property (nonatomic, strong) XCImageUploadView * xcuploadVoew;
@property (nonatomic, strong) StarView * starView;
@property (weak, nonatomic) IBOutlet UILabel *lineView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineView_height;

@end
@implementation OrderCommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _lineView.backgroundColor = [UIColor appLineColor];
    _lineView_height.constant = kOnePx;
}
-(void)setModel:(OrderCommentModel *)model{
    _model = model;
    [_head_pic sd_setImageWithURL:[NSURL URLWithString:_model.head_pic] placeholderImage:[UIImage imageNamed:@""]];
    _name.text = _model.name;
    _content.text = _model.content;
    _goods_ratings.text = [NSString stringWithFormat:@"%.1f分",_model.goods_ratings];
    _created_at.text = [NSString stringWithFormat:@"评论时间:%@",_model.created_at];
    [self.upLoadView addSubview:self.xcuploadVoew];
    [self.xcuploadVoew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.upLoadView).insets(UIEdgeInsetsMake(10, 0, 10, 0));
    }];
    [self.star_superView addSubview:self.starView];
}
- (StarView *)starView {
    if (!_starView) {
        _starView = [[StarView alloc]initWithFrame:CGRectMake(0, 0, 100, 20) withTotalStar:5 withTotalPoint:10.0 starSpace:2];
        _starView.type = StarTypeComment;
        _starView.starAliment = StarAlimentCenter;
        _starView.commentPoint = self.model.goods_ratings;
        _starView.userInteractionEnabled = NO;
    }
    return _starView;
}
-(XCImageUploadView *)xcuploadVoew{
    if (!_xcuploadVoew) {
        _xcuploadVoew = [[XCImageUploadView alloc]initWithImageUrlArray:self.model.image canUpload:NO];
        _xcuploadVoew.tipsLabel.text = @"";
    }
    return _xcuploadVoew;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
