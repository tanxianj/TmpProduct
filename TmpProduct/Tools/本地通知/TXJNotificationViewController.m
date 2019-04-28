//
//  TXJNotificationViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/26.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "TXJNotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import "BDSSpeechSynthesizer.h"
#import <AVFoundation/AVFoundation.h>

//#error 请在官网新建app，配置bundleId，并在此填写相关参数
NSString* APP_ID = @"16128970";
NSString* API_KEY = @"G5FZGbZVSTIq5fnYGgkAIvwT";
NSString* SECRET_KEY = @"Utaj9tVfG7UV2YA2jGGGP9oWy0yzLhnD";
@interface TXJNotificationViewController ()<BDSSpeechSynthesizerDelegate>

@end

@implementation TXJNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
+(void)addLocalNoticeWithNotificationType:(NotificationType)type title:(NSString *)title body:(NSString *)body{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    switch (type) {
        case NotificationTypeOne:{
            if ([[defaults objectForKey:SHOUKUANYUYINTIXING] boolValue]) {
                [[TXJNotificationViewController new] configureSDK];
                [[BDSSpeechSynthesizer sharedInstance] speakSentence:[NSString stringWithFormat:@"%@",body] withError:nil];
            }
//            [[TXJNotificationViewController new] addLocalNoticeTitle:title Body:body];
            
        }break;
        case NotificationTypeTwo:{
            if ([[defaults objectForKey:XIANSHANGDINGDANYUYINTIXING] boolValue]) {
            //打开了语音播报
                [[TXJNotificationViewController new] configureSDK];
                [[BDSSpeechSynthesizer sharedInstance] speakSentence:[NSString stringWithFormat:@"%@",body] withError:nil];
            }
        }break;
        case NotificationTypeThree:{
            //系统通知推送
        }break;
        default:
            break;
    }
    
}
-(void)configureSDK{
    NSLog(@"TTS version info: %@", [BDSSpeechSynthesizer version]);
    [BDSSpeechSynthesizer setLogLevel:BDS_PUBLIC_LOG_VERBOSE];
    [[BDSSpeechSynthesizer sharedInstance] setSynthesizerDelegate:self];
    [self configureOnlineTTS];
    [self configureOfflineTTS];
}

-(void)configureOnlineTTS{
    [[BDSSpeechSynthesizer sharedInstance] setApiKey:API_KEY withSecretKey:SECRET_KEY];
    
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:@(BDS_SYNTHESIZER_SPEAKER_FEMALE) forKey:BDS_SYNTHESIZER_PARAM_SPEAKER];
    //    [[BDSSpeechSynthesizer sharedInstance] setSynthParam:@(10) forKey:BDS_SYNTHESIZER_PARAM_ONLINE_REQUEST_TIMEOUT];
    
}
-(void)configureOfflineTTS{
    
    NSError *err = nil;
    // 在这里选择不同的离线音库（请在XCode中Add相应的资源文件），同一时间只能load一个离线音库。根据网络状况和配置，SDK可能会自动切换到离线合成。
    NSString* offlineEngineSpeechData = [[NSBundle mainBundle] pathForResource:@"Chinese_And_English_Speech_Female" ofType:@"dat"];
    
    NSString* offlineChineseAndEnglishTextData = [[NSBundle mainBundle] pathForResource:@"Chinese_And_English_Text" ofType:@"dat"];
    
    err = [[BDSSpeechSynthesizer sharedInstance] loadOfflineEngine:offlineChineseAndEnglishTextData speechDataPath:offlineEngineSpeechData licenseFilePath:nil withAppCode:APP_ID];
    if(err){
        [self displayError:err withTitle:@"Offline TTS init failed"];
        return;
    }
//    [TTSConfigViewController loadedAudioModelWithName:@"Chinese female" forLanguage:@"chn"];
//    [TTSConfigViewController loadedAudioModelWithName:@"English female" forLanguage:@"eng"];
}
-(void)displayError:(NSError*)error withTitle:(NSString*)title{
    NSString* errMessage = error.localizedDescription;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:errMessage preferredStyle:UIAlertControllerStyleAlert];
    if(alert){
        UIAlertAction* dismiss = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * action) {}];
        [alert addAction:dismiss];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        UIAlertView *alertv = [[UIAlertView alloc] initWithTitle:title message:errMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if(alertv){
            [alertv show];
        }
    }
}
//MARK:添加通知
- (void)addLocalNoticeTitle:(NSString *)title Body:(NSString *)body{
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        // 标题
        content.title = title;
        content.body = body;
//        content.title = @"收款到账通知";
        //        content.subtitle = @"您有一笔新的订单到账";
        // 内容
//        content.body = [NSString stringWithFormat:@"您有一笔新的订单到账:%@元",money];
        // 声音
//                content.sound = [UNNotificationSound defaultSound];
        content.sound = [UNNotificationSound soundNamed:@"Alert_ActivityGoalAttained_Salient_Haptic.caf"];
        // 角标 （我这里测试的角标无效，暂时没找到原因）
        content.badge = [NSNumber numberWithInt:1];
        // 多少秒后发送,可以将固定的日期转化为时间
        NSTimeInterval time = [[NSDate dateWithTimeIntervalSinceNow:1] timeIntervalSinceNow];
        //        NSTimeInterval time = 10;
        // repeats，是否重复，如果重复的话时间必须大于60s，要不会报错
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:time repeats:NO];
        
        /*
         //如果想重复可以使用这个,按日期
         // 周一早上 8：00 上班
         NSDateComponents *components = [[NSDateComponents alloc] init];
         // 注意，weekday默认是从周日开始
         components.weekday = 2;
         components.hour = 8;
         UNCalendarNotificationTrigger *calendarTrigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
         */
        // 添加通知的标识符，可以用于移除，更新等操作
        NSString *identifier = @"noticeId";
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
        
        [center addNotificationRequest:request withCompletionHandler:^(NSError *_Nullable error) {
            txjLog(@"成功添加推送");
        }];
    }else {
        UILocalNotification *notif = [[UILocalNotification alloc] init];
        // 发出推送的日期
        notif.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
        // 推送的内容
        notif.alertBody = @"收款到账通知";
        // 可以添加特定信息
//        notif.userInfo = @{@"money":[NSString stringWithFormat:@"您有一笔新的订单到账:%@元",money]};
        // 角标
        notif.applicationIconBadgeNumber = 1;
        // 提示音
        notif.soundName = UILocalNotificationDefaultSoundName;
        // 每周循环提醒
        notif.repeatInterval = NSCalendarUnitWeekOfYear;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notif];
    }
}

- (void)checkUserNotificationEnable { // 判断用户是否允许接收通知
    if (@available(iOS 10.0, *)) {
        __block BOOL isOn = NO;
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            if (settings.notificationCenterSetting == UNNotificationSettingEnabled) {
                isOn = YES;
                NSLog(@"打开了通知");
            }else {
                isOn = NO;
                NSLog(@"关闭了通知");
                [self showAlertView];
            }
        }];
    }else {
        if ([[UIApplication sharedApplication] currentUserNotificationSettings].types == UIUserNotificationTypeNone){
            NSLog(@"关闭了通知");
            [self showAlertView];
        }else {
            NSLog(@"打开了通知");
        }
    }
}

- (void)showAlertView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"通知" message:@"未获得通知权限，请前去设置" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self goToAppSystemSetting];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

// 如果用户关闭了接收通知功能，该方法可以跳转到APP设置页面进行修改
- (void)goToAppSystemSetting {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIApplication *application = [UIApplication sharedApplication];
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([application canOpenURL:url]) {
            if (@available(iOS 10.0, *)) {
                if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
                    [application openURL:url options:@{} completionHandler:nil];
                }
            }else {
                [application openURL:url];
            }
        }
    });
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    [self removeAllNotification];
}
//MARK:移除所有通知
- (void)removeAllNotification {
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center removeAllPendingNotificationRequests];
    }else {
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
}
@end
