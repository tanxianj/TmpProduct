//
//  App_lab_descLab_TableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface App_lab_descLab_TableViewCell : UITableViewCell
@property (nonatomic, strong) NSDictionary * model;
@property (weak, nonatomic) IBOutlet UILabel *descLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@end
