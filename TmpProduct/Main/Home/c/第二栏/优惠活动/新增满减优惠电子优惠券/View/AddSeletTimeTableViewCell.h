//
//  AddSeletTimeTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^addStarTime)(NSString *start_time);
typedef void (^addEndTime)(NSString *end_time);
@interface AddSeletTimeTableViewCell : UITableViewCell
@property (nonatomic, copy) addStarTime start_time;
@property (nonatomic, copy) addEndTime end_time;
@property (weak, nonatomic) IBOutlet UILabel *starTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLab;
@end
