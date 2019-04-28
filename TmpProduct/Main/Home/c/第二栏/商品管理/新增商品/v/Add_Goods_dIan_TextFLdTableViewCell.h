//
//  Add_Goods_dIan_TextFLdTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol Add_Goods_dIan_TextFLdTableViewCellDelegate <NSObject>
-(void)Add_Goods_dIan_TextFLdTableViewCell:(NSIndexPath *)indexPath;
-(void)Add_Goods_dIan_TextFLdTableViewCell:(NSIndexPath *)indexPath string:(NSString *)string;
@end
@interface Add_Goods_dIan_TextFLdTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *textFld;
@property (nonatomic, strong) NSIndexPath * indexPath;
@property (nonatomic, weak) id <Add_Goods_dIan_TextFLdTableViewCellDelegate> delegate;
@end
