//
//  XCPhotoBrowser.h
//  消汇邦
//
//  Created by 1244 on 2017/9/9.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>








#pragma mark - XCPhotoModel

@interface XCPhotoModel : NSObject

/** 原图链接 */
@property (nonatomic, strong) NSURL *originImageUrl;

/** 缩略链接 */
@property (nonatomic, strong) NSURL *thumbImageUrl;

/** 缩略图片 */
@property (nonatomic, strong) UIImage  *thumbImage;

/** 原图图片 */
@property (nonatomic, strong) UIImage  *originImage;

/** 数据是否更新 */
@property (nonatomic, assign) BOOL modelUpdate;

/** 是否是当前图片 */
@property (nonatomic, assign) BOOL isCurrentItem;

/** 是否有二维码 */
@property (nonatomic, assign) BOOL hasQrcode;

/** 二维码 */
@property (nonatomic, strong) NSString *qrCode;


//- (instancetype)initWithMessage:(NIMMessage *)message;

- (instancetype)initWithImageUrl:(NSString *)imageUrl;

- (instancetype)initWithUid:(NSString *)uid;

@end



#pragma mark - XCPhotoFlowLayout 

@interface XCPhotoFlowLayout : UICollectionViewFlowLayout

@end







#pragma mark - XCPhotoCell

@protocol XCPhotoCellDelegate <NSObject>

- (void)longPressWithPhotoModel:(XCPhotoModel *)photoModel;

- (void)tapWithPhotoModel:(XCPhotoModel *)photoModel;


/**
 cell将被复用的时候更新数据源（如果cell数据被更新的话）

 @param photoModel 数据
 @param uuid 标识符
 */
- (void)cellPrepareForReuseWithPhotoModel:(XCPhotoModel *)photoModel uuid:(NSString *)uuid;

@end

@interface XCPhotoCell : UICollectionViewCell

@property (nonatomic, strong) XCPhotoModel *photoModel;

@property (nonatomic, weak) id<XCPhotoCellDelegate> delegate;

@property (nonatomic, strong) NSString *uuid;

@end



#pragma mark - XCPhotoBrowser 

typedef NS_ENUM(NSUInteger, XCPhotoBrowserType) {
    XCPhotoBrowserNIMMessage = 0, //云信消息
    XCPhotoBrowserNormalImage,    //普通图片
    XCPhotoBrowserUserHeader,     //用户头像
};

@interface XCPhotoBrowser : UIViewController

/** 被点击的图片 */
@property (nonatomic, strong) UIImageView *imageView;

/** 被点击的图片在图片数组的位置 */
@property (nonatomic, assign) NSUInteger currentIndex;

/** 当前Window的截图 */
@property (nonatomic, strong) UIImage     *screenImage;

/** 图片数组 */
@property (nonatomic, strong) NSArray<NSString *> *imageUrlArr;

/** 消息数组 */
//@property (nonatomic, strong) NSArray<NIMMessage *> *messageArr;

/** 用户id */
@property (nonatomic, strong) NSString *userId;

/** 当前状态栏的风格 */
@property (nonatomic, assign) UIStatusBarStyle fromViewStatusBarStyle;

/** 类型分为三种，需对相应数据源赋值 */
@property (nonatomic, assign) XCPhotoBrowserType type;


/**
 构造方法

 @param dataSource 数据源，可以是消息数组，图片链接数组，用户Uid数组（只包含一个uid的数组）
 @param currentIndex 当前索引，如果索引数超过数据源个数，索引为最后一个
 @param imageView 图片
 @param type 类型
 */
+ (void)showWithDataSource:(NSArray *)dataSource
              currentIndex:(NSInteger)currentIndex
                 imageView:(UIImageView *)imageView
                      type:(XCPhotoBrowserType)type;

@end
