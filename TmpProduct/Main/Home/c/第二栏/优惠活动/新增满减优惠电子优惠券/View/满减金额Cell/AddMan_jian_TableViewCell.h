//
//  AddMan_jian_TableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ManTextFldBlock)(NSString *man);
typedef void (^JianTextFldBlock)(NSString *jian);
@interface AddMan_jian_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *manTxtFld;
@property (weak, nonatomic) IBOutlet UITextField *jianTextFld;
@property (nonatomic, copy) ManTextFldBlock manBlock;
@property (nonatomic, copy) JianTextFldBlock jianBlock;
@end
