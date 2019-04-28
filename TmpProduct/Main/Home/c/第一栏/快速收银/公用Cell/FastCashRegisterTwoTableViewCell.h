//
//  FastCashRegisterTwoTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FastCashRegisterTwoTableViewCellDelegate <NSObject>

-(void)FastCashRegisterTwoTableViewCell:(NSString *)string;

@end
@interface FastCashRegisterTwoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *textFld;
@property (nonatomic, weak) id <FastCashRegisterTwoTableViewCellDelegate> delegate;
@end
