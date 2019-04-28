//
//  APP_Lab_Lab_image_TableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APP_Lab_Lab_image_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *descLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLab_width;
@property (nonatomic, strong) NSDictionary * model;
/**
 选中状态下的文字
 */
@property (nonatomic, strong) NSString * select_status_str;

/**
  非选中状态下的文字
 */
@property (nonatomic, strong) NSString * desc_status_str;
@end
