//
//  MyShopListTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyShopListModel.h"

@interface MyShopListTableViewCell : UITableViewCell
@property (strong, nonatomic) MyShopListModel * model;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@end
