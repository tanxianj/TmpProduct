//
//  MeTwoTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeTwoTableViewCell : UITableViewCell
@property (strong, nonatomic) NSDictionary * model;
-(void)reloadData;
@end
