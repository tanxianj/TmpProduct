//
//  AddShopFooterViewTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddShopTageModel.h"
@class AddShopFooterViewTableViewCell;
@protocol AddShopFooterViewTableViewCellDelegate <NSObject>

/**
 * 动态改变UITableViewCell的高度
 */
- (void)updateTableViewCellHeight:(AddShopFooterViewTableViewCell *)cell andheight:(CGFloat)height andIndexPath:(NSIndexPath *)indexPath;


/**
 * 点击UICollectionViewCell的代理方法
 */
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath withContent:(NSArray *)selectArray;
@end
typedef void (^AddShopFooterViewBlockHight)(CGFloat height);
@interface AddShopFooterViewTableViewCell : UITableViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 当前标签Type 1:商品标签 2: 商铺标签 
 */
@property (nonatomic, strong) NSString * tagsType;
@property (nonatomic, weak) id<AddShopFooterViewTableViewCellDelegate> delegate;
//@property (nonatomic, strong) AddShopTageModel * model;
@property (nonatomic, copy) AddShopFooterViewBlockHight blokHeight;
@property (nonatomic, strong) NSArray * ServerData;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end

@interface AddShopFooterViewCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, strong) AddShopTageModel * model;
@end
