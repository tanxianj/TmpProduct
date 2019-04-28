//
//  FastCashRegisterTwoTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "FastCashRegisterTwoTableViewCell.h"
@interface FastCashRegisterTwoTableViewCell ()<UITextFieldDelegate>

@end
@implementation FastCashRegisterTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _textFld.delegate = self;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.delegate && [self.delegate respondsToSelector:@selector(FastCashRegisterTwoTableViewCell:)]) {
        [self.delegate FastCashRegisterTwoTableViewCell:textField.text];
    }
}
#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //    NSInteger theInteger = 100;
    //    NSInteger theDecimal = 100;
    //    if (textField.tag == 1000) {
    //        theInteger = 100;
    //        theDecimal = 3;
    //    } else if (textField.tag == 1001) {
    //        theInteger = 7;
    //        theDecimal = 2;
    //    } else if (textField.tag == 1002) {
    //        theInteger = 1;
    //        theDecimal = 1;
    //    }
    
    NSString *text = textField.text;
    NSInteger length = textField.text.length;
    if ([string isEqualToString:@""]) {
        return YES;
    }
    // 第一个字符不能输入“.”
    if (length == 0) {
        if ([string isEqualToString:@"."]) {
            return NO;
        }
    } else {
        if ([text containsString:@"."]) {
            if ([string isEqualToString:@"."]) {
                return NO;
            }
            // 限制小数位数
            NSRange pointRange = [text rangeOfString:@"."];
            if (length >= pointRange.location + 3) {
                return NO;
            }
        } else {
            //            if (length == 1) {
            //                // 第一个字符为“0”时，第二个字符必须为“.”
            //                if ([text isEqualToString:@"0"]) {
            //                    if (![string isEqualToString:@"."]) {
            //                        return NO;
            //                    }
            //                }
            //            }
            if ([string isEqualToString:@"."]) {
                return YES;
            }
            // 限制整数位数
            //            if (length >= theInteger) {
            //                return NO;
            //            }
        }
    }
    return YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
