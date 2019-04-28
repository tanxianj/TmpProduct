//
//  AddSeletTimeTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "AddSeletTimeTableViewCell.h"
#import "TXJSelectDateView.h"
@interface AddSeletTimeTableViewCell ()

@end
@implementation AddSeletTimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    __weak typeof(self) weakSelf = self;
    [_starTimeLab txj_whenTapped:^{
        txjLog(@"开始时间");
        [[UIViewController getCurrentVC].view endEditing:YES];
        [TXJSelectDateView showDateViewWithMaxLimitDate:[NSDate date] Title:@"请选择开始时间" DateStyle:DateStyleShowYearMonthDayHourMinute completelp:^(NSString *dateString) {
            if (weakSelf.start_time) {
                weakSelf.start_time([NSString stringWithFormat:@"%@:00",dateString]);
            }
            weakSelf.starTimeLab.text = [NSString stringWithFormat:@"%@:00",dateString];
        }];
    }];
    [_endTimeLab txj_whenTapped:^{
        txjLog(@"结束时间");
        [[UIViewController getCurrentVC].view endEditing:YES];
        [TXJSelectDateView showDateViewWithMinLimitDate:[NSDate date] Title:@"请选择结束时间" DateStyle:DateStyleShowYearMonthDayHourMinute completelp:^(NSString *dateString) {
            if (weakSelf.end_time) {
                weakSelf.end_time([NSString stringWithFormat:@"%@:00",dateString]);
            }
            weakSelf.endTimeLab.text = [NSString stringWithFormat:@"%@:00",dateString];
        }];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
