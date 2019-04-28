//
//  UIButton+Category.h
//  yidiankuang
//
//  Created by 谭显敬 on 2019/2/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
typedef void (^TXJ_ButtonEventsBlock)(void);
@interface UIButton (Category)
@property (nonatomic,copy)TXJ_ButtonEventsBlock txj_ButtonEventsBlock;
-(void)txj_addEventHandler:(void(^)(void))block forControlEvents:(UIControlEvents)controlEvents;
@end
