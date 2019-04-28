//
//  UIViewController+NavigationItems.h
//  TmoProduct
//
//  Created by 谭显敬 on 2019/1/4.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Button.h"

@interface UIViewController (NavigationItems)

- (void) barButtonItemAction:(Button *)button;

- (UIBarButtonItem *)setupNavigationItemWithLeft:(BOOL) leftOrRight
                                       imageName:(NSString *)imageName
                                           title:(NSString *)title
                                        callBack:(ButtonBlock)buttonBlock;

- (UIBarButtonItem *)setupNavigationItemWithLeft:(BOOL) leftOrRight
                                       imageName:(NSString *)imageName
                                           title:(NSString *)title
                                      titleColor:(UIColor *)titleColor
                                        callBack:(ButtonBlock)buttonBlock;
@end
