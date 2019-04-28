//
//  UIViewController+Category.h
//  TmoProduct
//
//  Created by 谭显敬 on 2019/2/24.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

+ (UIViewController *)getCurrentVC;
+ (UIViewController *)old_getCurrentVC;

@end
