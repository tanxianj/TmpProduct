//
//  TXJSelectShopDiscountTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/20.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullReductionModel.h"

@interface TXJSelectShopDiscountTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *descLab;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (nonatomic, strong) FullReductionModel * modelTwo;//满减优惠（店铺优惠）
@end
