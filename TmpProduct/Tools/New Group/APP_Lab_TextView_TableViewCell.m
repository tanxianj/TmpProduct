//
//  APP_Lab_TextView_TableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "APP_Lab_TextView_TableViewCell.h"
@interface APP_Lab_TextView_TableViewCell ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title;



@end
@implementation APP_Lab_TextView_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _textView.delegate = self;
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([self.delegate respondsToSelector:@selector(APP_Lab_TextView_TableViewCellString:indexPath:)]) {
        [self.delegate APP_Lab_TextView_TableViewCellString:textView.text indexPath:_indexPath];
    }
}
-(void)textViewDidChange:(UITextView *)textView{
    _desc.hidden = textView.text.length;
}
-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
}
-(void)setModel:(NSDictionary *)model{
    _model = model;
    _title.text = _model[@"title"];
    _desc.text = _model[@"desc"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
