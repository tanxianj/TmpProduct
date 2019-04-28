//
//  LoadingView.h
//  消汇邦
//
//  Created by 罗建 on 2017/1/4.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView


@property (nonatomic, strong) UIView                  *contentView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) UILabel                 *messageLB;


+ (void)showWithMessage:(NSString *)message;
+ (void)hidden;


@end
