//
//  UIView+Category.m
//  TmpProject
//
//  Created by 谭显敬 on 2019/2/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
static void*txj_ViewTappedBlockKey = &txj_ViewTappedBlockKey;
-(TXJ_ViewTappedBlock)txj_ViewTappedBlock{
    return objc_getAssociatedObject(self, &txj_ViewTappedBlockKey);
}
-(void)setTxj_ViewTappedBlock:(TXJ_ViewTappedBlock)txj_ViewTappedBlock{
    objc_setAssociatedObject(self, &txj_ViewTappedBlockKey, txj_ViewTappedBlock, OBJC_ASSOCIATION_COPY);
}
-(void)txj_whenTapped:(void(^)(void))block{
    [[UIViewController getCurrentVC].view endEditing:YES];
    self.txj_ViewTappedBlock = block;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped)]];
}
    // 单击view
-(void)viewTapped{
    if(self.txj_ViewTappedBlock){
        self.txj_ViewTappedBlock();
    }
}
@end
