//
//  UncancelledOrdersSectionFooter.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListModel.h"

@interface UncancelledOrdersSectionFooter : UIView
@property (nonatomic, strong) OrderListModel * model;
@property (nonatomic, strong) void (^reloadData)(void);
@end
