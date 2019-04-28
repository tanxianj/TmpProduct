//
//  TxjSelectTimeSlot.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/21.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "TxjSelectTimeSlot.h"
#import "ZYCalendarView.h"
@interface TxjSelectTimeSlot ()
@property (nonatomic, strong) UIButton * grayView;
@property (nonatomic, strong) UIView *btnView;
@property (nonatomic,strong)ZYCalendarView *zyCalendarview;
@property (nonatomic, strong) NSString * start_time;
@property (nonatomic, strong) NSString * end_time;
@end
@implementation TxjSelectTimeSlot
+(void)showTxjSelectTimeSlot:(void(^)(NSString *start_time,NSString *end_time))complete{
    [[TxjSelectTimeSlot alloc] showPickView:^(NSString *start_time, NSString *end_time) {
        if (complete) {
            complete(start_time,end_time);
        }
        
    }];
}
-(void)showPickView:(void(^)(NSString *start_time,NSString *end_time))complete{
    
    __weak typeof(self) weakSelf = self;
    self.grayView = [BaseClassTool buttonWithFont:10 titleColor:UIColor.cyanColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter title:@""];
    [self.grayView setBackgroundColor:kColorWithRGBA(0, 0, 0, 0.5)];
    self.grayView.layer.masksToBounds = YES;
    self.grayView.frame = CGRectMake(0, ([UIDevice currentDevice].isX?88:64), kScreenWidth, kScreenHeight-([UIDevice currentDevice].isX?88:64));
    //    [self.grayView addTarget:self action:@selector(hiddenPickView) forControlEvents:UIControlEventTouchUpInside];
    
    [[UIViewController getCurrentVC].view addSubview:self.grayView];
    
    UIView *weekTitlesView = [BaseClassTool backView];
    [self.grayView addSubview:weekTitlesView];
    weekTitlesView.transform =  CGAffineTransformMakeTranslation(0, -44);
    [weekTitlesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.grayView);
        make.height.offset(44);
    }];
    CGFloat weekW = [UIViewController getCurrentVC].view.frame.size.width/7;
    NSArray *titles = @[@"日", @"一", @"二", @"三",
                        @"四", @"五", @"六"];
    for (int i = 0; i < 7; i++) {
        UILabel *week = [[UILabel alloc] initWithFrame:CGRectMake(i*weekW, 0, weekW, 44)];
        week.textAlignment = NSTextAlignmentCenter;
        
        [weekTitlesView addSubview:week];
        week.text = titles[i];
    }
    [self.grayView txj_addEventHandler:^{
        [[UIViewController getCurrentVC].view endEditing:YES];
        [UIView animateWithDuration:0.22 animations:^{
            //            self.zyCalendarview.transform =  CGAffineTransformIdentity;
            weakSelf.btnView.transform =  CGAffineTransformMakeTranslation(0, -44-375-64);
            weakSelf.zyCalendarview.transform =  CGAffineTransformMakeTranslation(0, -44-375);
            weekTitlesView.transform = CGAffineTransformMakeTranslation(0,-44);
        }completion:^(BOOL finished) {
            [self.grayView removeFromSuperview];
            [weekTitlesView removeFromSuperview];
            [weakSelf.btnView removeFromSuperview];
        }];
    } forControlEvents:UIControlEventTouchUpInside];
    _zyCalendarview = [[ZYCalendarView alloc] initWithFrame:CGRectMake(0, 44, [UIViewController getCurrentVC].view.frame.size.width, 375)];
    self.zyCalendarview.transform =  CGAffineTransformMakeTranslation(0, -44-375);
    _zyCalendarview.backgroundColor = UIColor.whiteColor;
    // 可以点击已经过去的日期
    _zyCalendarview.manager.canSelectPastDays = YES;
    // 不可以点击未来的日期
    _zyCalendarview.manager.canSelectAfterDays = NO;
    // 可以选择时间段
    _zyCalendarview.manager.selectionType = ZYCalendarSelectionTypeRange;
    
    // 设置被选中颜色
    _zyCalendarview.manager.selectedBackgroundColor = [UIColor appBlueColor];
    _zyCalendarview.manager.selectedTextColor = [UIColor whiteColor];
    _zyCalendarview.manager.disableTextColor = [UIColor appTextDescTwoColor];
    // 设置当前日期 请在所有参数设置完之后设置日期
    _zyCalendarview.date = [NSDate date];
    
    _zyCalendarview.dayViewBlock = ^(ZYCalendarManager *manager, NSDate *dayDate) {
        // NSLog(@"%@", dayDate);
        if ( manager.selectedDateArray.count == 2) {
            for (NSDate *date in manager.selectedDateArray) {
                txjLog(@"%@", [manager.dateFormatter stringFromDate:date]);
                
            }
            //            [weakSelf hiddenPickView];
            //            weakSelf.listArray = nil;
            weakSelf.start_time = [manager.dateFormatter stringFromDate:manager.selectedDateArray[0]];
            weakSelf.end_time = [manager.dateFormatter stringFromDate:manager.selectedDateArray[1]];
            
            
        }
        
        
    };
    [self.grayView addSubview:_zyCalendarview];
    _btnView = [BaseClassTool backView];
    
    [self.grayView addSubview:_btnView];
    [_btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.grayView);
        make.top.equalTo(self.zyCalendarview.mas_bottom);
        make.height.offset(64);
    }];
    _btnView.transform =  CGAffineTransformMakeTranslation(0, -44-375-64);
    UIButton *btn = [BaseClassTool buttonWithBackgroundColor:UIColor.appBlueColor font:14.0 titleColor:UIColor.whiteColor contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter title:@"确定"];
    btn.layer.cornerRadius = 22;
    [btn txj_addEventHandler:^{
        
        if (weakSelf.start_time.length && weakSelf.end_time.length) {
            if (complete) {
                complete(weakSelf.start_time,weakSelf.end_time);
            }
        }else if(!weakSelf.start_time.length || !weakSelf.end_time.length){
            [XCToast showWithMessage:@"请选择一个时间范围"];
            return;
        }
        [[UIViewController getCurrentVC].view endEditing:YES];
        [UIView animateWithDuration:0.22 animations:^{
            //            self.zyCalendarview.transform =  CGAffineTransformIdentity;
            weakSelf.btnView.transform =  CGAffineTransformMakeTranslation(0, -44-375-64);
            weakSelf.zyCalendarview.transform =  CGAffineTransformMakeTranslation(0, -44-375);
            weekTitlesView.transform = CGAffineTransformMakeTranslation(0,-44);
        }completion:^(BOOL finished) {
            [self.grayView removeFromSuperview];
            [weekTitlesView removeFromSuperview];
            [weakSelf.btnView removeFromSuperview];
        }];
        
    } forControlEvents:UIControlEventTouchUpInside];
    [_btnView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.btnView).insets(UIEdgeInsetsMake(10, 12, 10, 12));
    }];
    [UIView animateWithDuration:0.22 animations:^{
        self.zyCalendarview.transform =  CGAffineTransformIdentity;
        self.btnView.transform = CGAffineTransformIdentity;
        weekTitlesView.transform = CGAffineTransformIdentity;
    }];
}

@end
