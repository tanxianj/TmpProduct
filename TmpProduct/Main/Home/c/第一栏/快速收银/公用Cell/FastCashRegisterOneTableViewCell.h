//
//  FastCashRegisterOneTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FastCashRegisterOneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *user_mobile;
@property (nonatomic, strong) NSString * descStr;
@property (nonatomic, strong) NSString * selectStr;
@end
