//
//  PrivacyPermissionManager.h
//  TmoProduct
//
//  Created by 谭显敬 on 2019/2/12.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 系统权限
 *  相册
<key>NSPhotoLibraryUsageDescription</key>
<string>App需要您的同意,才能访问相册</string>
 *  相机
<key>NSCameraUsageDescription</key>
<string>App需要您的同意,才能访问相机</string>
 *  麦克风
<key>NSMicrophoneUsageDescription</key>
<string>App需要您的同意,才能访问麦克风</string>
 *  位置
<key>NSLocationUsageDescription</key>
<string>App需要您的同意,才能访问位置</string>
 *  在使用期间访问位置
<key>NSLocationWhenInUseUsageDescription</key>
<string>App需要您的同意,才能在使用期间访问位置</string>
 *  始终访问位置
<key>NSLocationAlwaysUsageDescription</key>
<string>App需要您的同意,才能始终访问位置</string>
 *  日历
<key>NSCalendarsUsageDescription</key>
<string>App需要您的同意,才能访问日历</string>
 *  提醒事项
<key>NSRemindersUsageDescription</key>
<string>App需要您的同意,才能访问提醒事项</string>
 *  运动与健身
<key>NSMotionUsageDescription</key> 
<string>App需要您的同意,才能访问运动与健身</string>
 *  健康更新
<key>NSHealthUpdateUsageDescription</key>
<string>App需要您的同意,才能访问健康更新 </string>
 *  健康分享
<key>NSHealthShareUsageDescription</key>
<string>App需要您的同意,才能访问健康分享</string>
 *  蓝牙
<key>NSBluetoothPeripheralUsageDescription</key>
<string>App需要您的同意,才能访问蓝牙</string>
 *  媒体资料库
<key>NSAppleMusicUsageDescription</key>
<string>App需要您的同意,才能访问媒体资料库</string>
 */

@interface PrivacyPermissionManager : NSObject


+ (instancetype)sharedManager;


/**
 是否已经被禁止访问相册

 @return 1：已被禁止 0：未被禁止
 */
- (BOOL)hasBeenBannedForPhotoLibraryPermission;

/**
 是否已经被禁止访问相机
 
 @return 1：已被禁止 0：未被禁止
 */
- (BOOL)hasBeenBannedForCameraPermission;

/**
 是否已经被禁止访问麦克风
 
 @return 1：已被禁止 0：未被禁止
 */
- (BOOL)hasBeenBannedForMicrophoePermission;

/**
 是否已经被禁止访问通讯录
 
 @return 1：已被禁止 0：未被禁止
 */
- (BOOL)hasBeenBannedForAddressBookPermission;


@end
