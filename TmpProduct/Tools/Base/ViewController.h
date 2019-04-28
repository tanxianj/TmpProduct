//
//  ViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/12.
//  Copyright © 2019年 谭显敬. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Protocol.h"
#import "NavigationBar.h"
#import "UINavigationBar+handle.h"
@interface ViewController : UIViewController<Initialization>


/**
 顶部分割线
 */
@property (nonatomic, strong) UIView *topSeparatorLine;

/**
 自定义导航栏
 */
@property (strong, nonatomic)NavigationBar * navcBar;

/**
 路由的参数，用于服务器动态跳转的传参
 */
@property (nonatomic, strong) NSDictionary *routeParam;

@property (assign, nonatomic) NSInteger page;
/**
 常用Array
 */
@property (strong, nonatomic)  NSMutableArray * listArray;
/**
 需要删除先前的页面数
 */
@property (nonatomic, assign)NSInteger        deleteViewCount;

/**
 若要隐藏导航栏，必须重写改方法，默认不隐藏
 
 @return YES/NO
 */
- (BOOL)xhb_preferredNavigationBarHidden;


/**
 若要禁止全屏返回，必须重写方法
 
 @return YES/NO
 */
- (BOOL)xhb_interactivePopDisabled;


/**
 快捷添加返回按钮
 */
- (void)addBackButton;

/**
 快速添加跳转 如果需要添加 右边按钮请在 控制器中添加

 @param vcName 控制器文件Name
 @param vcTitle 控制器Title
 */
-(void)PushToViewControllerWithVCName:(NSString *)vcName vcTitle:(NSString *)vcTitle;
/**
 跳转到登录页
 */
- (void)jumpLoginInterface;
-(void)defaultNavigationBarSetWithTitle:(NSString *)title;
-(void)defaultNavigationBarSetWithTitle:(NSString *)title Right:(id)right rightItemBlock:(void(^)(void))click;
@end

