//
//  UIWindow+Motion.m
//  TmoProduct
//
//  Created by Admin on 2019/12/16.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "UIWindow+Motion.h"

#ifdef DEBUG
#import <FLEXManager.h>
#endif

@implementation UIWindow (Motion)

#ifdef DEBUG
//- (BOOL)canBecomeFirstResponder{
//    return YES;
//}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [super motionEnded:motion withEvent:event];
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] setNetworkDebuggingEnabled:YES];
        [[FLEXManager sharedManager] showExplorer];
    }
}



#endif
@end
