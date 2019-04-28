//
//  YZActionSheet.h
//  PhotoBrowser
//
//  Created by 1244 on 2019/3/27.
//  Copyright © 2019年 iosky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^dieSelected)(NSInteger idx);

@interface YZActionSheet : UIView
@property(nonatomic, strong) UITableView * actionListView;

/**
 弹出框

 @param titles 选择列表，包含一个“取消”
 @param selected idx是由上而下的列表索引
 */
+ (void)showActionSheetWithTitles:(NSArray<NSString *> *)titles selected:(void (^)(NSInteger idx))selected;

/**
 同上，

 @param notice 提示语，显示在最顶部
 @param titles 同上
 @param selected 同上
 */
+ (void)showActionSheetWithNotice:(NSString *)notice titles:(NSArray<NSString *> *)titles selected:(void (^)(NSInteger idx))selected;

/**
 弹出框

 @param titles 同上
 @param cancel 取消按钮的文字
 @param selected 同上
 @param cancelBlock 取消的事件
 */
+ (void)showActionSheetWithTitles:(NSArray<NSString *> *)titles cancel:(NSString *)cancel selected:(void (^)(NSInteger idx))selected cancelBlock:(void(^)(void))cancelBlock;

/**
 弹出框

 @param notice 提示语
 @param titles 选项数组
 @param cancel 取消标题
 @param selected 选择的索引
 @param cancelBlock 取消事件
 */
+ (void)showActionSheetWithNotice:(NSString *)notice titles:(NSArray<NSString *> *)titles cancel:(NSString *)cancel selected:(void (^)(NSInteger idx))selected cancelBlock:(void (^)(void))cancelBlock;



@end
