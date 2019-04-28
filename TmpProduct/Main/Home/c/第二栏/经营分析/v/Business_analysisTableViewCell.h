//
//  Business_analysisTableViewCell.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/15.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business_analysisModel.h"
@protocol Business_analysisTableViewCellDelegate <NSObject>

-(void)Business_analysisTableViewCell:(NSString *)date_type start_time:(NSString *)start_time end_tiem:(NSString *)end_tiem;

@end
@interface Business_analysisTableViewCell : UITableViewCell
@property (nonatomic, strong) Business_analysisModel * model;
@property (nonatomic, weak) id <Business_analysisTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSString * date_type;
@property (nonatomic, strong) NSString * tmpstart_time;
@property (nonatomic, strong) NSString * tmpend_time;
@end
