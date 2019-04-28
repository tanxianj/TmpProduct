//
//  TXJSelectShopDiscount.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/20.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXJSelectShopDiscount : UIView
@property(nonatomic, strong) UITableView * actionListView;
@property (nonatomic, copy)void (^selectShopDiscountBlock)(NSArray *shop_Id_array,NSArray *shop_Name_array);
+(void)showSelectShopListWithTitle:(NSString *)title Need_pay_price:(CGFloat )needPayprice selectShopArray:(void(^)(NSArray *shop_Id_array,NSArray *shop_Name_array))complet;
@property (nonatomic, assign) CGFloat needPayprice;
@end
