//
//  APP_Lab_TextFld_TableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol APP_Lab_TextFld_TableViewCellDelagate <NSObject>
@required
-(void)APP_Lab_TextFld_TableViewCellWithString:(NSString *)string indexPath:(NSIndexPath *)indexpath;

@end
@interface APP_Lab_TextFld_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UITextField *textFld;
@property (nonatomic, strong) NSIndexPath * indexPath;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLab_width;
@property (nonatomic, strong) NSDictionary * model;
@property (nonatomic, weak) id <APP_Lab_TextFld_TableViewCellDelagate> delegate;
@end
