//
//  UIButton+Category.m
//  yidiankuang
//
//  Created by 谭显敬 on 2019/2/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)
static void *txj_ButtonEventsBlockKey = &txj_ButtonEventsBlockKey;
//------- 添加属性 -------//
-(TXJ_ButtonEventsBlock)txj_ButtonEventsBlock{
    return objc_getAssociatedObject(self, &txj_ButtonEventsBlockKey);
}
-(void)setTxj_ButtonEventsBlock:(TXJ_ButtonEventsBlock)txj_ButtonEventsBlock{
    objc_setAssociatedObject(self, &txj_ButtonEventsBlockKey, txj_ButtonEventsBlock, OBJC_ASSOCIATION_COPY);
}
    
/**
 给按钮绑定事件回调block
 
 @param block 回调的block
 @param controlEvents 回调block的事件
 */
-(void)txj_addEventHandler:(void(^)(void))block forControlEvents:(UIControlEvents)controlEvents{
    [[UIViewController getCurrentVC].view endEditing:YES];
    self.txj_ButtonEventsBlock = block;
    [self addTarget:self action:@selector(txj_blockButtonClicked) forControlEvents:controlEvents];
}
/**
 点击事件
 */
-(void)txj_blockButtonClicked{
    if(self.txj_ButtonEventsBlock){
        self.txj_ButtonEventsBlock();
    }
}
@end
