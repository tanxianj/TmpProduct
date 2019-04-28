//
//  Protocol.h
//  消汇邦
//
//  Created by 罗建 on 2017/4/27.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>





@protocol Initialization <NSObject>


@required

// 初始化子视图
- (void)initializeSubViews;

// 添加子视图
- (void)addSubViews;

// 设置约束
- (void)setupSubViewMargins;


@optional

// 设置导航栏
- (void)setupNavigationItems;

// 数据初始化
- (void)initializeData;

// 添加事件
- (void)addTargerts;

// 添加观察者
- (void)addObservers;

// 移除观察者
- (void)removeObservers;

@end





@protocol FunctionViewDelegate <NSObject>



@required

- (void)tapWithFlag:(NSInteger)flag;

@end







@protocol ReloadData <NSObject>


@required

- (void)loadData;

@end

