//
//  XCAlertController.h
//  消汇邦
//
//  Created by 1244 on 2017/9/11.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSInteger, XCAlertActionStyle) {
//    XCAlertActionStyleDefault = 0,
//    XCAlertActionStyleCancel,
//    XCAlertActionStyleDestructive
//};
//
//typedef NS_ENUM(NSInteger, XCAlertControllerStyle) {
//    XCAlertControllerStyleActionSheet = 0,
//    XCAlertControllerStyleAlert
//};

@interface XCAlertAction : NSObject


/**
 XCAlertAction构造方法，与系统的基本一致

 @param title 标题，不可为空
 @param style 标题样式，影响颜色和字体粗细
 @param handler 事件回调
 @return
 */
+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(XCAlertAction *action))handler;

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) UIAlertActionStyle style;
@property (nonatomic, getter=isEnabled) BOOL enabled;
@property (nonatomic, copy) void (^handler)(XCAlertAction *action);

@end

@interface XCAlertController : UIViewController


/**
 以Model形式弹出

 @param title 标题，可为空
 @param message 消息，不可以为空
 @param preferredStyle 样式
 @return
 */
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle;


/**
 快捷显示方式，兼容旧版本，样式为UIAlertControllerStyleActionSheet

 @param message 头部标题
 @param actionsTitle 选项标题组成的数组
 @param selectedIndex 被点击索引，由上而下，从0开始，与标题数组一一对应
 */
+ (void)showWithMessage:(NSString *)message
           actionsTitle:(NSArray <NSString *> *)actionsTitle
          selectedIndex:(void (^)(NSInteger index))selectedIndex;




- (void)addAction:(XCAlertAction *)action;

@property (nonatomic, readonly) NSArray<XCAlertAction *> *actions;

@property (nonatomic, copy) NSString *alertTitle;
@property (nonatomic, copy) NSString *message;

@property (nonatomic, readonly) UIAlertControllerStyle preferredStyle;

@end
