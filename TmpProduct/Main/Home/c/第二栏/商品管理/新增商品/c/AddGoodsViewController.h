//
//  AddGoodsViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ViewController.h"
#import "AddGoodsListModel.h"
typedef enum : NSUInteger {
    GoodsListTypeOne,//商品图片
    GoodsListTypeTwo,//分组一
    GoodsListTypeThree,//商品详情
    GoodsListTypeFour,//购买须知
    GoodsListTypeFive,//分组4
} GoodsListType;
typedef enum : NSUInteger {
    GoodsTypeAdd,
    GoodsTypeEdit,
} GoodsType;
@interface AddGoodsViewController : ViewController
@property (nonatomic, assign) GoodsListType lisType;
@property (nonatomic, strong) AddGoodsListModel * addModel;
@property (nonatomic, assign) GoodsType goodsType;
@end
