//
//  ProductCashRegisterTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsListModel.h"
#import "GoodsCheckoutModel.h"
@protocol ProductCashRegisterTableViewCellDelegate <NSObject>

-(void)ProductCashRegisterTableViewCell:(GoodsCheckoutModel *)goodsCheckModel GoodsListModel:(GoodsListModel *)goodsListModel;

@end
@interface ProductCashRegisterTableViewCell : UITableViewCell
@property (nonatomic, strong) GoodsListModel * model;
@property (nonatomic, assign) NSInteger goodsSlectNum;
@property (nonatomic, strong) GoodsCheckoutModel * goodsCheckModel;
@property (nonatomic, weak) id <ProductCashRegisterTableViewCellDelegate> delegate;
@end
