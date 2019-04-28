//
//  TXJSelectShopDiscount.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/20.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "TXJSelectShopDiscount.h"
#import "TXJSelectShopDiscountTableViewCell.h"
@interface TXJSelectShopDiscount ()<
UIGestureRecognizerDelegate,
UITableViewDelegate,
UITableViewDataSource>{
    BOOL CellBool[100];
}
@property(nonatomic, strong) NSArray * titleArr;
@property(nonatomic, strong) NSString * notice;
@property(nonatomic, strong) NSString * cancel;
@property (nonatomic, strong) NSMutableArray * selectShopIDAray;
@property (nonatomic, strong) NSMutableArray * selectShopNameAray;

@property(nonatomic, copy) void(^selectedBlock)(NSInteger idx);
@property(nonatomic, copy) void(^cancelBlock)(void);
@end
@implementation TXJSelectShopDiscount
+(void)showSelectShopListWithTitle:(NSString *)title Need_pay_price:(CGFloat )needPayprice selectShopArray:(void(^)(NSArray *shop_Id_array,NSArray *shop_Name_array))complet{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    TXJSelectShopDiscount *actionSheet = [[TXJSelectShopDiscount alloc]init];
    actionSheet.backgroundColor = [UIColor clearColor];
    actionSheet.needPayprice = needPayprice;
    UILabel *noticeLab = [[UILabel alloc]init];
    noticeLab.textColor = [UIColor appBlackDescColor];
    noticeLab.backgroundColor = [UIColor whiteColor];
    noticeLab.font = [UIFont systemFontOfSize:13];
    noticeLab.textAlignment = NSTextAlignmentCenter;
    noticeLab.text = title;
    
    [noticeLab sizeToFit];
    
    actionSheet.cancel = @"确定";
    
    CGRect labRect = noticeLab.frame;
    labRect.origin.y += 8;
    labRect.size.height = 44;
    labRect.size.width = kScreenWidth;
    noticeLab.frame = labRect;
    actionSheet.selectShopDiscountBlock = complet;
    [actionSheet LoadData:^(NSArray *dataArray) {
        actionSheet.titleArr = [NSArray arrayWithArray:dataArray];
        //    actionSheet.selectedBlock = selected;
        actionSheet.backgroundColor = [UIColor clearColor];
        CGRect rect = [UIScreen mainScreen].bounds;
        CGFloat tableHeight = 64 * dataArray.count + 44 + 8 + noticeLab.frame.size.height + (ISX ? 34 : 0);
        
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
    }];
    
}
-(void)LoadData:(void(^)(NSArray *dataArray))complet{
    [LoadingView showWithMessage:kWaiting];
    [[HTTPSessionManager sharedManager] listPOST:@"/api/activity/list" page:1 parameters:@{@"shop_id":[UserInfoAndShopModel sharedUserModel].shop.idField,@"pagesize":@"100"} callBack:^(ListModel *responseModel, id responseObject) {
        [LoadingView hidden];
        if (responseModel.status == 200) {
            if (complet) {
                complet(responseModel.data.data);
            }
        }
    }];
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

        if (indexPath.section==0) {
            TXJSelectShopDiscountTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"TXJSelectShopDiscountTableViewCell" owner:self options:nil] lastObject];
            cell.modelTwo = [[FullReductionModel alloc]initWithDictionary:self.titleArr[indexPath.row]];
            return cell;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            }
            cell.selectionStyle = 0;
            cell.textLabel.text = self.cancel;
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            return cell;
        }
    return nil;
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section?44:64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        if (self.selectShopNameAray.count) {
            [self hideMyselfCallBack:^{
                if (self.selectShopDiscountBlock) {
                    self.selectShopDiscountBlock(self.selectShopIDAray.copy,self.selectShopNameAray.copy);
                }
            }];
        }
        
    }else{
        
        
        if (self.needPayprice >= [self.titleArr[indexPath.row][@"amount"] floatValue]) {
            [self.selectShopIDAray removeAllObjects];
            [self.selectShopNameAray removeAllObjects];
            [self.selectShopIDAray addObject:self.titleArr[indexPath.row][@"id"]];
            [self.selectShopNameAray addObjectsFromArray:@[@" 消费满 ",[NSString stringWithFormat:@"%@元",self.titleArr[indexPath.row][@"amount"]],@" 立减 ",[NSString stringWithFormat:@"%@元",self.titleArr[indexPath.row][@"discount"]]]];
        }else{
            TXJSelectShopDiscountTableViewCell *cell  = [tableView cellForRowAtIndexPath:indexPath];
            cell.selected = NO;
            [XCToast showWithMessage:@"应付金额必须大于满减金额"];
        }
        
    }
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
-(NSMutableArray *)selectShopIDAray{
    if (!_selectShopIDAray) {
        _selectShopIDAray = [NSMutableArray array];
    }
    return _selectShopIDAray;
}
-(NSMutableArray *)selectShopNameAray{
    if (!_selectShopNameAray) {
        _selectShopNameAray = [NSMutableArray array];
    }
    return _selectShopNameAray;
}
- (void)dealloc{
    
}
@end
