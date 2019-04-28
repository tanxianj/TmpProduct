//
//  PrivacyPermissionManager.m
//  TmoProduct
//
//  Created by 谭显敬 on 2019/2/12.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "PrivacyPermissionManager.h"

#import <Photos/Photos.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreTelephony/CTCellularData.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@implementation PrivacyPermissionManager


#pragma mark -

+ (instancetype)sharedManager {
    static PrivacyPermissionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PrivacyPermissionManager alloc] init];
    });
    return manager;
}


#pragma mark -

- (BOOL)hasBeenBannedForPhotoLibraryPermission {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(self) weakSelf = self;
            [YZActionSheet showActionSheetWithNotice:@"App已被禁止访问相册" titles:@[@"前往设置"] selected:^(NSInteger idx) {
                [weakSelf openSettingsURL];
            }];
        });
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)hasBeenBannedForCameraPermission {
#if (TARGET_IPHONE_SIMULATOR)
    [XCToast showWithMessage:@"模拟器中无法打开照相机，请在真机中使用"];
    return YES;
#else
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusDenied) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(self) weakSelf = self;
            [YZActionSheet showActionSheetWithNotice:@"App已被禁止访问相机" titles:@[@"前往设置"] selected:^(NSInteger idx) {
                [weakSelf openSettingsURL];
            }];
        });
        return YES;
    }
    else {
        return NO;
    }
#endif
}

- (BOOL)hasBeenBannedForMicrophoePermission {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];//麦克风权限
    if (status == AVAuthorizationStatusDenied) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(self) weakSelf = self;
            [YZActionSheet showActionSheetWithNotice:@"App已被禁止访问麦克风" titles:@[@"前往设置"] selected:^(NSInteger idx) {
                [weakSelf openSettingsURL];
            }];
        });
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)hasBeenBannedForAddressBookPermission {
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusDenied) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(self) weakSelf = self;
            [YZActionSheet showActionSheetWithNotice:@"App已被禁止访问通讯录" titles:@[@"前往设置"] selected:^(NSInteger idx) {
                [weakSelf openSettingsURL];
            }];
        });
        return YES;
    }
    else {
        return NO;
    }
}

//- (BOOL)hasBeenBannedForAddressBookPermission {
//    if (Cll == kABAuthorizationStatusDenied) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            __weak typeof(self) weakSelf = self;
//            [YZActionSheet showActionSheetWithNotice:@"App已被禁止访问通讯录" titles:@[@"前往设置"] selected:^(NSInteger idx) {
//                [weakSelf openSettingsURL];
//            }];
//        });
//        return YES;
//    }
//    else {
//        return NO;
//    }
//}

#pragma mark -

- (void)openSettingsURL {
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
        else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}


@end
