//
//  YZRefreshHeader.h
//  消汇邦
//
//  Created by Apple on 2017/6/15.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <MJRefreshStateHeader.h>


@interface YZRefreshHeader : MJRefreshStateHeader

+ (instancetype)lowHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
+ (instancetype)lowHeaderWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;

@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;


@end
