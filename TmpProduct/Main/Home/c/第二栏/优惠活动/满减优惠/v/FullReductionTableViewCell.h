//
//  FullReductionTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullReductionModel.h"
#import "ElectronicPreferencesModel.h"
typedef enum : NSUInteger {
    FullReductionTypeOne,//满减
    FullReductionTypeTwo,//电子优惠券
} FullReductionType;
@protocol FullReductionTableViewCellDelegate <NSObject>

-(void)NeedReloadData;

@end
@interface FullReductionTableViewCell : UITableViewCell
@property (nonatomic, assign) FullReductionType cellType;
@property (nonatomic, strong) FullReductionModel * modelOne;//满减模型
@property (nonatomic, strong) ElectronicPreferencesModel * modelTwo;//电子优惠券模型
@property (nonatomic, weak) id <FullReductionTableViewCellDelegate> delegate;
@end
