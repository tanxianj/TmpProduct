//
//  TXJSelectShopList.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    TXJSelectShopListSelectTypeOne,//选择店铺
    TXJSelectShopListSelectTypeTwo,//选择店铺优惠
    TXJSelectShopListSelectTypeThree,//暂无
} TXJSelectShopListSelectType;
@interface TXJSelectShopList : UIView
@property(nonatomic, strong) UITableView * actionListView;
@property (nonatomic, copy)void (^selectShopBlock)(NSArray *shop_Id_array,NSArray *shop_Name_array);
@property (nonatomic, assign) TXJSelectShopListSelectType type;
+(void)showSelectShopListWithTitle:(NSString *)title seletType:(TXJSelectShopListSelectType)type selectShopArray:(void(^)(NSArray *shop_Id_array,NSArray *shop_Name_array))complet;

@end
