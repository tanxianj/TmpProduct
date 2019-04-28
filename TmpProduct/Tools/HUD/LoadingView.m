//
//  LoadingView.m
//  消汇邦
//
//  Created by 罗建 on 2017/1/4.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()



@end

@implementation LoadingView

#pragma mark - 显示和移除视图

+ (void)showWithMessage:(NSString *)message{
    dispatch_async(dispatch_get_main_queue(), ^{
        LoadingView *loadingView = [[LoadingView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        if (message && [message isKindOfClass:[NSString class]]) {
            loadingView.messageLB.text = message;
        }
        UIView *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:loadingView];
        [window bringSubviewToFront:loadingView];
        
        loadingView.backgroundColor = [UIColor clearColor];
        loadingView.contentView.alpha = 0;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.33 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
            loadingView.contentView.alpha = 1;
            [loadingView.activityIndicatorView startAnimating];
        });
    });
    
}

+ (void)hidden {
    NSArray *subViews = [UIApplication sharedApplication].keyWindow.subviews;
    for (UIView *view in subViews) {
        if ([view isKindOfClass:[LoadingView class]]) {
            [view removeFromSuperview];
        }
    }
}

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0
                                               green:0
                                                blue:0
                                               alpha:0.5];
        [self addSubViews];
        
    }
    return self;
}

#pragma mark - 布局

- (void)addSubViews {
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.activityIndicatorView];
    [self.contentView addSubview:self.messageLB];
}

#pragma mark - getters

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [BaseClassTool viewWithBackgroundColor:kColorWithRGBA(0, 0, 0, 0.65)];
        _contentView.frame = CGRectMake(0, 0, 120, 120);
        _contentView.center = self.center;
        _contentView.layer.cornerRadius = 4;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (UIActivityIndicatorView *)activityIndicatorView {
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicatorView.center = CGPointMake(60, 44);
    }
    return _activityIndicatorView;
}

- (UILabel *)messageLB {
    if (!_messageLB) {
        _messageLB = [BaseClassTool labelWithFont:15
                                     textColor:[UIColor whiteColor]
                                 textAlignment:NSTextAlignmentCenter];
        _messageLB.frame = CGRectMake(0, 65, 120, 55);
        _messageLB.numberOfLines = 0;
        _messageLB.text = kLoading;
    }
    return _messageLB;
}

@end
