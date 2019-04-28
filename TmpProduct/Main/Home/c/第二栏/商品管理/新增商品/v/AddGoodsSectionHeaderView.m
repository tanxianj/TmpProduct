//
//  AddGoodsSectionHeaderView.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "AddGoodsSectionHeaderView.h"

@implementation AddGoodsSectionHeaderView
-(void)awakeFromNib{
    [super awakeFromNib];
}
-(void)setSection:(NSInteger)section{
    _section = section;
}
- (IBAction)addBtnAction:(id)sender {
    txjLog(@"%@加",_titleLab.text);
    if (self.delegate && [self.delegate respondsToSelector:@selector(AddGoodsSectionHeaderView:)]) {
        [self.delegate AddGoodsSectionHeaderView:_section];
    }
}

@end
