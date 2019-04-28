//
//  NavigationBar.h
//  消汇邦
//
//  Created by Apple on 2017/6/22.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "View.h"
#import "UIDevice+Category.h"

typedef NS_ENUM(NSInteger, NavigationBarStyle) {
    NavigationBarStyleDefault                                     = 0, // Dark content, for use on light backgrounds
    NavigationBarStyleLightContent     NS_ENUM_AVAILABLE_IOS(7_0) = 1, // Light content, for use on dark backgrounds
} ;

@interface NavigationBar : View

/**
 标题
 */
@property (nonatomic, strong) NSString *title;


/**
 左边按钮的内容，传入UIImage或者NSString
 */
@property (nonatomic, strong) id leftItem;


/**
 右边的，类型同上
 */
@property (nonatomic, strong) id rightItem;


/**
 左右点击事件，注意内存泄漏，内部未做释放
 */
@property (nonatomic, strong) void(^leftBlock)(void);
@property (nonatomic, strong) void(^rightBlock)(void);




/**
 默认为白底黑字
 */
@property (nonatomic, assign) NavigationBarStyle style;


@property (nonatomic, strong) UIColor *textColor;
//- (instancetype)initWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle viewController:(UIViewController *)vc backButtonIsWhite:(BOOL)isWhite rightBlock:(void(^)())rightBlock;


/**
 初始化方法，

 @param vc 当前控制器
 @return  vc
 */
- (instancetype)initWithVC:(UIViewController *)vc;

@end
