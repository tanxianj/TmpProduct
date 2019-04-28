//
//  OrderTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderListOrder_good.h"

@interface OrderTableViewCell : UITableViewCell
@property (nonatomic, strong) OrderListOrder_good * model;
@end
