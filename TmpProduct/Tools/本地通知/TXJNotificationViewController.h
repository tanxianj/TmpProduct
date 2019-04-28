//
//  TXJNotificationViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/26.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NotificationTypeOne, //收款语音提醒
    NotificationTypeTwo, //显示订单语音d提醒
    NotificationTypeThree, //系统通知推送
} NotificationType;
@interface TXJNotificationViewController : UIViewController

+(void)addLocalNoticeWithNotificationType:(NotificationType)type title:(NSString *)title body:(NSString *)body;
@end


