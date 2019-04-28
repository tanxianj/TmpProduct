//
//  XCRefreshFooter.h
//  消汇邦
//
//  Created by 1244 on 2017/7/5.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//



/**
 
 * 需在MJRefreshComponent中的MJRefreshState下添加如下枚举
 
 * 网络错误
 * MJRefreshStateError

 */

#import <MJRefresh/MJRefresh.h>

extern const MJRefreshState MJRefreshStateError;

@interface XCRefreshFooter : MJRefreshFooter

/** 是否自动刷新(默认为YES) */
@property (assign, nonatomic, getter=isAutomaticallyRefresh) BOOL automaticallyRefresh;

/** 当底部控件出现多少时就自动刷新(默认为1.0，也就是底部控件完全出现时，才会自动刷新) */
@property (assign, nonatomic) CGFloat triggerAutomaticallyRefreshPercent;


/** 文字距离圈圈、箭头的距离 */
@property (assign, nonatomic) CGFloat labelLeftInset;
/** 显示刷新状态的label */
@property (weak, nonatomic, readonly) UILabel *stateLabel;

@property (nonatomic, assign) BOOL hasTopSpace;


/** 设置state状态下的文字 */
- (void)setTitle:(NSString *)title forState:(MJRefreshState)state;

/** 隐藏刷新状态的文字 */
@property (assign, nonatomic, getter=isRefreshingTitleHidden) BOOL refreshingTitleHidden;

/** 菊花的样式 */
@property (assign, nonatomic) UIActivityIndicatorViewStyle activityIndicatorViewStyle;

+ (instancetype)footerHasTopSapceWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;


@end

@interface MJRefreshFooter (XCError)

- (void)endRefreshingWithError;


@end
