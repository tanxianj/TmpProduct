//
//  XCToast.h
//  消汇邦
//
//  Created by 1244 on 2017/9/26.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCToast : UIView

NS_ASSUME_NONNULL_BEGIN

+ (instancetype)sharedInstance;

+ (void)showWithMessage:(NSString *)message;

+ (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration;

NS_ASSUME_NONNULL_END
@end
