//
//  XCImageUploadView.h
//  消汇邦
//
//  Created by 1244 on 2017/9/12.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>


#pragma mark - XCImageUploadModel

typedef NS_ENUM(NSUInteger, XCImageUploadStatus) {
    XCImageUploadStatusNormal, //什么也没有，只有一张图片，不可以操作
    XCImageUploadStatusUploadSuccess, //上传成功，带一个删除按钮
    XCImageUploadStatusUploadError, //上传失败，带一个感叹号，点击重新上传
    XCImageUploadStatusProcessing, //上传中，转菊花
    XCImageUploadStatusUploadButton //一个按钮，
};

@interface XCImageUploadModel : NSObject

//图片链接，有就加载，无则忽略
@property (nonatomic, strong) NSString *imageUrl;

// Returns an identifier which persistently identifies the object on a given device
//用于缓存的标志符
@property (nonatomic, strong) NSString *localIdentifier;

//图片对象
@property (nonatomic, strong) UIImage *image;


//服务器要求的Base64 
@property (nonatomic, strong) NSString *base64String;

//用于刷新cell的标志符
@property (nonatomic, strong) NSString *uuid;

//以下三项为服务器返回数据
@property (nonatomic, strong) NSString * extend;
@property (nonatomic, strong) NSString * filename;
@property (nonatomic, strong) NSString * filenameUrl;

//状态
@property (nonatomic, assign) XCImageUploadStatus status;

-(void)configWithDictionary:(NSDictionary *)dictionary;

@end










#pragma mark - XCImageUploadManager

@protocol XCImageUploadManagerDelegate <NSObject>

- (void)successUploadImageWithModel:(XCImageUploadModel *)model;
- (void)failToUploadImageWithModel:(XCImageUploadModel *)model;


@end

@interface XCImageUploadManager : NSObject

@property (nonatomic, weak) id<XCImageUploadManagerDelegate> delegate;

/**  */
@property (nonatomic, strong) NSCache *imageCache;

+ (instancetype)sharedManager;

/**  */
//@property (nonatomic, strong) NSOperationQueue *imageUploadQueue;

- (NSArray <XCImageUploadModel *> *)uploadImages:(NSArray<UIImage *> *)images sourceAssets:(NSArray *)assets;

@end








#pragma mark - XCImageUploadCell

@class XCImageUploadCell;

@protocol XCImageUploadCellDelegate <NSObject>


- (void)didDeletedCellWithModel:(XCImageUploadModel *)model cell:(XCImageUploadCell *)cell;

- (void)didRestartUploadWithModel:(XCImageUploadModel *)model cell:(XCImageUploadCell *)cell;

- (void)didTapUploadButton;

- (void)didTapCell:(XCImageUploadCell *)cell;

@end

@interface XCImageUploadCell : UICollectionViewCell

/**  */
@property (nonatomic, strong) UIImageView *imageView;

/**  */
@property (nonatomic, strong) XCImageUploadModel *model;

/**  */
@property (nonatomic, weak) id<XCImageUploadCellDelegate> delegate;

@end








#pragma mark - XCImageUploadView

@protocol XCImageUploadViewDelegate <NSObject>

- (void)filenameArrayChanged;

@end


/**
 默认的Init的方法，创建一个可以上传图片的控件，从imageUrlArray中获取filename数组
 */
@interface XCImageUploadView : UIView

/**  */
@property (nonatomic, weak) id<XCImageUploadViewDelegate> delegate;

/**
 构建方法

 @param imageUrlArray 由图片url组成的数组
 @param canUpload 若为YES，有上传、删除等操作按钮。若为NO，什么都没有，仅展示图片，点击可以进入图片浏览器
 @return 1
 */
- (instancetype)initWithImageUrlArray:(NSArray <NSString *> *)imageUrlArray canUpload:(BOOL)canUpload;

//提示性文字
@property (nonatomic, strong)UILabel  *tipsLabel;

/** 图片链接数组，用于图片数据提交 */
@property (nonatomic, copy, readonly) NSArray<NSString *> *fileNameArray;
/*图片选择数组最大数量*/
@property (nonatomic,assign)NSInteger imageArryCont;
- (void)setImageUrlArray:(NSArray *)imageUrlArray canUpload:(BOOL)canUpload needReload:(BOOL)needReload;

+ (CGFloat)minimumContentHeight;

@end


