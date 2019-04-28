//
//  YZActionSheet.m
//  PhotoBrowser
//
//  Created by 1244 on 2019/3/27.
//  Copyright © 2019年 iosky. All rights reserved.
//

#import "YZActionSheet.h"
#import "UIDevice+Category.h"

//MARK: Ugly code！If u feel sick，pls delete it immediately！

@interface YZActionSheet()<
UIGestureRecognizerDelegate,
UITableViewDelegate,
UITableViewDataSource>



@property(nonatomic, strong) NSArray * titleArr;

@property(nonatomic, strong) NSString * notice;
@property(nonatomic, strong) NSString * cancel;

@property(nonatomic, copy) void(^selectedBlock)(NSInteger idx);
@property(nonatomic, copy) void(^cancelBlock)(void);

@end

@implementation YZActionSheet

+ (void)showActionSheetWithNotice:(NSString *)notice titles:(NSArray<NSString *> *)titles selected:(void (^)(NSInteger idx))selected{
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];

    YZActionSheet *actionSheet = [[YZActionSheet alloc]init];
    
    actionSheet.notice = notice;
    
    UILabel *noticeLab = [[UILabel alloc]init];
    noticeLab.textColor = [UIColor appBlackDescColor];
    noticeLab.backgroundColor = [UIColor whiteColor];
    noticeLab.font = [UIFont systemFontOfSize:13];
    noticeLab.textAlignment = NSTextAlignmentCenter;
    noticeLab.text = notice;
    
    [noticeLab sizeToFit];
    
    actionSheet.cancel = @"取消";
    
    CGRect labRect = noticeLab.frame;
    labRect.origin.y += 8;
    labRect.size.height = 44;
    labRect.size.width = kScreenWidth;
    noticeLab.frame = labRect;
    
    actionSheet.titleArr = [NSArray arrayWithArray:titles];
    actionSheet.selectedBlock = selected;
    actionSheet.backgroundColor = [UIColor clearColor];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    CGFloat tableHeight = 44 * titles.count + 44 + 8 + noticeLab.frame.size.height + (ISX ? 34 : 0);
    
//    UIView *bottomView = [UIView new];
    
    rect.origin.y = rect.size.height;
    rect.size.height = tableHeight;
    
    actionSheet.actionListView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    actionSheet.actionListView.tableHeaderView = noticeLab;
    actionSheet.actionListView.separatorColor = [UIColor groupTableViewBackgroundColor];
    actionSheet.actionListView.separatorInset = UIEdgeInsetsMake(0, .5, 0, .5);
    actionSheet.actionListView.delegate = actionSheet;
    actionSheet.actionListView.dataSource = actionSheet;
    actionSheet.actionListView.scrollEnabled = 0;
    
    rect.origin.y -= tableHeight;
    [UIView animateWithDuration:.15 animations:^{
        actionSheet.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
        actionSheet.actionListView.frame = rect;
    }];
    
    [actionSheet addSubview:actionSheet.actionListView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:actionSheet action:@selector(closeAction)];
    tap.delegate = actionSheet;
    [actionSheet addGestureRecognizer:tap];
    
//    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    /* 2018-08-11 注释
    UIViewController *rootVC = [UIViewController getCurrentVC];
    
    actionSheet.frame = rootVC.view.frame;
    [rootVC.view addSubview:actionSheet];
    [rootVC.view bringSubviewToFront:actionSheet];
    */
    UIWindow *window  =[UIApplication sharedApplication].keyWindow;
    actionSheet.frame = window.frame;
    [window addSubview:actionSheet];
    [window bringSubviewToFront:actionSheet];
//
//    [YZActionSheet showActionSheetWithNotice:notice titles:titles cancel:nil selected:selected cancelBlock:nil];
}
+ (void)showActionSheetWithTitles:(NSArray<NSString *> *)titles selected:(void (^)(NSInteger))selected{
    [YZActionSheet showActionSheetWithTitles:titles cancel:@"取消" selected:selected cancelBlock:nil];
}

+ (void)showActionSheetWithTitles:(NSArray<NSString *> *)titles cancel:(NSString *)cancel selected:(void (^)(NSInteger))selected cancelBlock:(void (^)(void))cancelBlock{
    
    [YZActionSheet showActionSheetWithNotice:nil titles:titles cancel:cancel selected:selected cancelBlock:cancelBlock];
}

+ (void)showActionSheetWithNotice:(NSString *)notice titles:(NSArray<NSString *> *)titles cancel:(NSString *)cancel selected:(void (^)(NSInteger))selected cancelBlock:(void (^)(void))cancelBlock{
    
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    YZActionSheet *actionSheet = [[YZActionSheet alloc]init];
    
    if (notice.length) {
        actionSheet.notice = notice;
    }
    
    if (cancel.length) {
        actionSheet.cancel = cancel;
    }
    
    if (cancelBlock) {
        actionSheet.cancelBlock = cancelBlock;
    }
    
    
    actionSheet.titleArr = [NSArray arrayWithArray:titles];
    actionSheet.selectedBlock = selected;
    actionSheet.backgroundColor = [UIColor clearColor];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    CGFloat tableHeight = 44 * titles.count + 44 + 8 + (ISX ? 34 : 0);
    
    rect.origin.y = rect.size.height;
    rect.size.height = tableHeight;
    
    actionSheet.actionListView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    actionSheet.actionListView.separatorColor = [UIColor groupTableViewBackgroundColor];
    actionSheet.actionListView.separatorInset = UIEdgeInsetsMake(0, .5, 0, .5);
    actionSheet.actionListView.delegate = actionSheet;
    actionSheet.actionListView.dataSource = actionSheet;
    actionSheet.actionListView.scrollEnabled = 0;
    
    rect.origin.y -= tableHeight;
    [UIView animateWithDuration:.15 animations:^{
        actionSheet.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
        actionSheet.actionListView.frame = rect;
    }];
    
    [actionSheet addSubview:actionSheet.actionListView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:actionSheet action:@selector(closeAction)];
    tap.delegate = actionSheet;
    [actionSheet addGestureRecognizer:tap];
    
//    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIWindow *window  =[UIApplication sharedApplication].keyWindow;
    actionSheet.frame = window.frame;
    [window addSubview:actionSheet];
    [window bringSubviewToFront:actionSheet];
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.actionListView]) {
        return NO;
    }
    return YES;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        if (self.notice) {
            return kOnePx;
        }else{
            return .1;
        }
    }else{
        return 8;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = kColorWithRGBA(247, 247, 247, .5);
//    view.tintColor = [UIColor redColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return kOnePx;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.tintColor = kColorWithRGBA(247, 247, 247, .5);
//    view.tintColor = [UIColor clearColor];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = 0;
    if (indexPath.section == 1) {
        cell.textLabel.text = self.cancel;
    }else{
        cell.textLabel.text = self.titleArr[indexPath.row];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.titleArr.count;
    }else{
        return 1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self hideMyselfCallBack:^{
        
        if (indexPath.section != 1) {
            if (self.selectedBlock) {
                self.selectedBlock(indexPath.row);
            }
            self.selectedBlock = nil;
        }else{
            if (self.cancelBlock) {
                self.cancelBlock();
            }
            self.cancelBlock = nil;
        }
        
    }];
    
    
}

- (void)closeAction{
    [self hideMyselfCallBack:nil];
}

- (void)hideMyselfCallBack:(void (^)(void))callBack{
    
    static int flag = 0;
    
    CGRect rect = self.actionListView.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:.15 animations:^{
        self.actionListView.frame = rect;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
        
        
        if (callBack && flag == 0) {
            callBack();
        }
        [self removeFromSuperview];

    }];
}


- (void)dealloc{
    
}

@end
