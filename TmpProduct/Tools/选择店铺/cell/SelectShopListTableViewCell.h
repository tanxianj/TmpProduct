//
//  SelectShopListTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyShopListModel.h"
#import "FullReductionModel.h"

@interface SelectShopListTableViewCell : UITableViewCell
@property (nonatomic, strong) MyShopListModel * model;//店铺列表模型
@property (nonatomic, strong) FullReductionModel * modelTwo;//满减优惠（店铺优惠）
@property (weak, nonatomic) IBOutlet UIButton *image;
@property (nonatomic, assign) NSInteger type;
@end
