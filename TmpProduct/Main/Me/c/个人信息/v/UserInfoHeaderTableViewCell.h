//
//  UserInfoHeaderTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *header;
-(void)reloadData;
@end
