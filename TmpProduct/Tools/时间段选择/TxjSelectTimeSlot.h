//
//  TxjSelectTimeSlot.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/21.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TxjSelectTimeSlot : UIView
+(void)showTxjSelectTimeSlot:(void(^)(NSString *start_time,NSString *end_time))complete;
@end
