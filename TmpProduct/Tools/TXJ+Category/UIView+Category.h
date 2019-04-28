//
//  UIView+Category.h
//  TmpProject
//
//  Created by 谭显敬 on 2019/2/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
typedef void (^TXJ_ViewTappedBlock)(void);
@interface UIView (Category)
@property (nonatomic,copy)TXJ_ViewTappedBlock txj_ViewTappedBlock;
/**
 与单击手势绑定的block
 
 @param block 单击手势事件回调的block
 */
-(void)txj_whenTapped:(void(^)(void))block;
@end
