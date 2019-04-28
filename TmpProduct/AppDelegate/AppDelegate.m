//
//  AppDelegate.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/12.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "AppDelegate.h"
#import "LaunchIntroductionView.h"
#import <JPFPSStatus.h>
#import "LocalDataTool.h"
#import "Entrance.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "TXJNotificationViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 键盘
    IQKeyboardManager *manager          = [IQKeyboardManager sharedManager];
    manager.enable                      = YES;
    manager.shouldResignOnTouchOutside  = YES;
    manager.enableAutoToolbar           = NO;
    [manager registerTextFieldViewClass:[YYTextView class] didBeginEditingNotificationName:YYTextViewTextDidBeginEditingNotification didEndEditingNotificationName:YYTextViewTextDidEndEditingNotification];
    
    [self initUI];
    [self registerAPN];
    /**
     极光推送配置
     */

    //Required
    //notice: 3.0.0 及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义 categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    // Optional
    // 获取 IDFA
    // 如需使用 IDFA 功能请添加此代码并在初始化方法的 advertisingIdentifier 参数中填写对应值
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
//    [JPUSHService setBadge:10];
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:10];
    // Required
    // init Push
    // notice: 2.1.5 版本的 SDK 新增的注册方法，改成可上报 IDFA，如果没有使用 IDFA 直接传 nil
    // 如需继续使用 pushConfig.plist 文件声明 appKey 等配置内容，请依旧使用 [JPUSHService setupWithOption:launchOptions] 方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:@"66b8d12a9eb08ce7b56fb62a" channel:@"App Store" apsForProduction:NO];
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        txjLog(@"Appdelegate 极光推送 Registration id  is  %@",registrationID);
        
        /* 打印结果为:
         TXJ： 171976fa8acb4709efd 161a3797c84f68d24ac 121c83f7606ba71f393  161a3797c85b5ef91eb
         Wing: 161a3797c84f8027867 13165ffa4e4adbcb5b8
         */
        if ([UserModel sharedUserModel].token) {
            NSString *url = [NSString stringWithFormat:@"/api/user/setRid/%@",[UserInfoAndShopModel sharedUserModel].user.idField];
            [[HTTPSessionManager sharedManager] POST:url parameters:@{@"rid":registrationID} callBack:^(RespondModel *responseModel) {
                
            }];
        }
        
    }];
    return YES;
}
//MARK:star
//注册 APNs 成功并上报 DeviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    txjLog(@"deviceToken is %@",deviceToken);
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
//实现注册 APNs 失败接口（可选）
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    txjLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}



// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //从通知界面直接进入应用
    }else{
        //从通知设置界面进入应用
    }
}

// iOS 10 Support
//MARK:前台接收到通知（服务器通知）
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
//    [TXJNotificationViewController addLocalNoticeWithNotificationType:NotificationTypeTwo title:@"收款到账通知" body:userInfo[@"aps"][@"alert"][@"body"]];
    [self GotoBDYYBB:userInfo];
}

// iOS 10 Support
//MARK:前台点击通知
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
//    [TXJNotificationViewController addLocalNoticeWithNotificationType:NotificationTypeTwo title:@"收款到账通知" body:userInfo[@"aps"][@"alert"][@"body"]];
    [self GotoBDYYBB:userInfo];
    completionHandler();//系统要求执行这个方法  
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    txjLog(@"接受到了通知 \n%@",userInfo);
//    [TXJNotificationViewController addLocalNoticeWithNotificationType:NotificationTypeTwo title:@"收款到账通知" body:userInfo[@"aps"][@"alert"][@"body"]];
    [self GotoBDYYBB:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required, For systems with less than or equal to iOS 6
    [JPUSHService handleRemoteNotification:userInfo];
//    [TXJNotificationViewController addLocalNoticeWithNotificationType:NotificationTypeTwo title:@"收款到账通知" body:userInfo[@"aps"][@"alert"][@"body"]];
    [self GotoBDYYBB:userInfo];
}
-(void)GotoBDYYBB:(NSDictionary *)userInfo{
    [TXJNotificationViewController addLocalNoticeWithNotificationType:NotificationTypeTwo title:@"收款到账通知" body:userInfo[@"aps"][@"alert"][@"body"]];
    txjLog(@"userInfo is %@",userInfo);
}
//MARK:end










- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     txjLog(@"进入后台");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    txjLog(@"进入前台");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    txjLog(@"进入程序被激活 %li",[[UIApplication sharedApplication] applicationIconBadgeNumber]);
//    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:10];
    if ([[UIApplication sharedApplication] applicationIconBadgeNumber] >0) {
      [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    }
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TmpProduct"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
- (void)initUI {
    
    UIViewController *rootViewController;
    NSDictionary *keepUserInfo = [LocalDataTool readKeepUserInfo];
    rootViewController = [Entrance mainEntrance];
   
    //    //是否存在本地数据
        if (!keepUserInfo) {
            rootViewController = [Entrance mainEntrance];
        }
        else {
            rootViewController = [Entrance mainEntrance];
//            [[UserModel sharedUserModel] getMyUserInfo:YES completed:nil];
//    //        [[UserManager manager] updateUserCompleted:nil];
//            [[UserInfo sharedInfo]updateUserCompleted:^(BOOL success) {
//
//            }];
        }
    //
    
    if (!self.window) {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    
    if (!self.window.rootViewController) {
        self.window.rootViewController = rootViewController;
        [self.window makeKeyAndVisible];
#ifdef DEBUG
        [[JPFPSStatus sharedInstance] close];
        [[JPFPSStatus sharedInstance] open];
        
        [JPFPSStatus sharedInstance].fpsLabel.textColor = UIColor.redColor;
#endif
    }
    
    [XCToast sharedInstance];
    
}
#pragma mark - <引导页>

- (void)launchViewControll{
    NSArray *launchImages = @[@"引导页1",@"引导页2",@"引导页3"];
    LaunchIntroductionView *launch = [LaunchIntroductionView sharedWithImages:launchImages buttonImage:nil buttonFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    launch.currentColor = [UIColor clearColor];
    launch.nomalColor = [UIColor clearColor];
    
    
    
}
- (void)registerAPN {
    // 注册通知
    if (@available(iOS 10.0, *)) { // iOS10 以上
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
        }];
    } else {// iOS8.0 以上
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    }
}
-(void)SetNotification{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:SHOUKUANYUYINTIXING]) {
        [defaults setBool:YES forKey:SHOUKUANYUYINTIXING];
    }
    if (![defaults objectForKey:XIANSHANGDINGDANYUYINTIXING]) {
        [defaults setBool:YES forKey:XIANSHANGDINGDANYUYINTIXING];
    }
    if (![defaults objectForKey:XITONGTONGZTUISHONG]) {
        [defaults setBool:YES forKey:XITONGTONGZTUISHONG];
    }
}
@end
