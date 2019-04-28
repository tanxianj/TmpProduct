//
//  ProductCashRegisterGoodsListViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ViewController.h"
#import "GoodsCheckoutModel.h"
#import "GoodsListModel.h"
@protocol ProductCashRegisterGoodsListViewControllerDelegate <NSObject>
-(void)goodsListArray:(NSArray <NSDictionary *> *)tmplistArray goodsinfoArray:(NSArray <NSDictionary *>*)tmpgoodsInfoArray;
@end
@interface ProductCashRegisterGoodsListViewController : ViewController
@property (nonatomic, strong) NSMutableArray <NSDictionary *>* goodsInfoArray;
@property (nonatomic, strong) NSMutableArray <NSDictionary *>* goodsListArray;
@property (nonatomic, weak) id <ProductCashRegisterGoodsListViewControllerDelegate> delegate;
@end
