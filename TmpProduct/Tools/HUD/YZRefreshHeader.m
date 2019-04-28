//
//  YZRefreshHeader.m
//  消汇邦
//
//  Created by Apple on 2017/6/15.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "YZRefreshHeader.h"
#import "NSBundle+MJRefresh.h"

@interface YZRefreshHeader()
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@property (assign, nonatomic) BOOL lowStyle;
@end

@implementation YZRefreshHeader
#pragma mark - 懒加载子控件



+ (instancetype)lowHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action{
    YZRefreshHeader *header = [self headerWithRefreshingTarget:target refreshingAction:action];
    header.lowStyle = 1;
    return header;
}

+ (instancetype)lowHeaderWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    YZRefreshHeader *header = [self headerWithRefreshingBlock:refreshingBlock];
    header.lowStyle = 1;
    return header;
}

- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        if (self.activityIndicatorViewStyle == 0) {
            self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        }else{
            self.activityIndicatorViewStyle = self.activityIndicatorViewStyle;
        }
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    
    self.loadingView = nil;
    [self setNeedsLayout];
}

#pragma mark - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
    if (self.lowStyle) {
        self.mj_h = self.mj_h - 10;
    }
    
    self.lastUpdatedTimeLabel.hidden = 1;
    
    self.stateLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
//    self.stateLabel.font = [UIFont systemFontOfSize:12 weight:20];
    self.stateLabel.textColor = [UIColor appBlackDescColor];
    
    [self setTitle:@"" forState:MJRefreshStateRefreshing];
    [self setTitle:@"下拉即可刷新" forState:MJRefreshStateWillRefresh];
    
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.lowStyle) {
        CGFloat arrowCenterX = self.mj_w * 0.5;
        CGFloat arrowCenterY = self.mj_h * 0.5 + 5;
        CGPoint arrowCenter = CGPointMake(arrowCenterX, arrowCenterY);
        
        if (self.loadingView.constraints.count == 0) {
            self.loadingView.center = arrowCenter;
            self.stateLabel.center = arrowCenter;
        }
    }else{
        
        CGFloat arrowCenterX = self.mj_w * 0.5;
        CGFloat arrowCenterY = self.mj_h * 0.5;
        CGPoint arrowCenter = CGPointMake(arrowCenterX, arrowCenterY);
        
        if (self.loadingView.constraints.count == 0) {
            self.loadingView.center = arrowCenter;
            self.stateLabel.center = arrowCenter;
        }
        
    }
    
    
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    if (state == MJRefreshStateIdle) {
//        if (oldState == MJRefreshStateRefreshing) {
//            
//            [UIView animateWithDuration:MJRefreshSlowAnimationDuration animations:^{
//                self.loadingView.alpha = 0.0;
//            } completion:^(BOOL finished) {
//                if (self.state != MJRefreshStateIdle) return;
//                
//                self.loadingView.alpha = 1.0;
//                [self.loadingView stopAnimating];
//            }];
//        } else {
            [self.loadingView stopAnimating];

//        }
    } else if (state == MJRefreshStatePulling) {
        [self.loadingView stopAnimating];
    } else if (state == MJRefreshStateRefreshing) {
        self.loadingView.alpha = 1.0;
        [self.loadingView startAnimating];
    }
    
//    NSLog(@"yz_header title%@",self.stateLabel.text);
}
@end
