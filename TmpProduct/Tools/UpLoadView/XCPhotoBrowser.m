//
//  Created by 1244 on 2017/9/9.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "XCPhotoBrowser.h"
#import "ImageUrlTool.h"
#import "HelpCenterViewController.h"

#pragma mark - XCPhotoModel

@interface XCPhotoModel()

@end

@implementation XCPhotoModel

//- (instancetype)initWithMessage:(NIMMessage *)message{
//    if (self = [super init]) {
//
//        NIMImageObject *imageObject = (NIMImageObject *)message.messageObject;
//
//        if (imageObject.thumbPath.length) {
//            self.thumbImageUrl = [NSURL fileURLWithPath:imageObject.thumbPath];
//        }else if (imageObject.path.length) {
//            self.thumbImageUrl = [NSURL fileURLWithPath:imageObject.path];
//        }else{
//            self.thumbImageUrl = [NSURL URLWithString:@"https://www.baidu.com"];
//        }
//
//        if (imageObject.url.length) {
//            self.originImageUrl = [NSURL URLWithString:imageObject.url];
//        }else if (imageObject.thumbUrl.length) {
//            self.originImageUrl = [NSURL URLWithString:imageObject.thumbUrl];
//        }else{
//            self.originImageUrl = [NSURL URLWithString:@"https://www.baidu.com"];
//        }
//
//    }
//    return self;
//}

- (instancetype)initWithImageUrl:(NSString *)imageUrl{
    if (self = [super init]) {
        
        self.thumbImageUrl = [ImageUrlTool commonImageUrlWithName:imageUrl];
        self.originImageUrl = [ImageUrlTool originImageWithName:imageUrl];
        
    }
    return self;
}

- (instancetype)initWithUid:(NSString *)uid{
    if (self = [super init]) {
        self.thumbImageUrl = [ImageUrlTool userAvatarImageUrlWithUid:uid];
        self.originImageUrl = [ImageUrlTool originUserAvatarImageUrlWithUid:uid];
    }
    return self;
}

- (void)setThumbImage:(UIImage *)thumbImage{
    _thumbImage = thumbImage;
    self.modelUpdate = YES;
}

- (void)setOriginImage:(UIImage *)originImage{
    _originImage = originImage;
    self.modelUpdate = YES;
}

- (BOOL)hasQrcode{
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:(self.originImage.CGImage ?: (self.thumbImage.CGImage ?: nil))]];
    if (features.count > 0) {
        CIQRCodeFeature *feature = [features objectAtIndex:0];
        self.qrCode = feature.messageString;
    }
    return features.count;
}

@end










#pragma mark - XCPhotoFlowLayout

@implementation XCPhotoFlowLayout
@end










#pragma mark - XCPhotoCell

#import <UIView+WebCache.h>
#import "XCAlertController.h"
//#import "UIViewController+Qrcode.h"
#import <UIImage+Saving.h>

#define PhotoCellMaxScale 2.0
#define PhotoCellMinScale 0.8

@interface XCPhotoCell()<UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic,strong) UIScrollView *scrollView;

/** 获取原图的按钮 */
@property (nonatomic, strong) UIButton *originButton;

@end

@implementation XCPhotoCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initSubviews];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapAction:)];
        doubleTap.numberOfTapsRequired = 2;
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
        
        [tap requireGestureRecognizerToFail:longPress];
        [tap requireGestureRecognizerToFail:doubleTap];
        
        self.contentView.userInteractionEnabled = YES;
        [self.contentView addGestureRecognizer:tap];
        [self.contentView addGestureRecognizer:doubleTap];
        [self.contentView addGestureRecognizer:longPress];
        
        
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    }
    return self;
}



- (void)initSubviews {
    self.imageView = [[UIImageView alloc]init];
    
    [self.imageView sd_setShowActivityIndicatorView:YES];
    [self.imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];
    [self.contentView addSubview:self.originButton];
    /**
     *  开始生成 设备旋转 通知
     */
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    
    /**
     *  添加 设备旋转 通知
     *
     *  当监听到 UIDeviceOrientationDidChangeNotification 通知时，调用handleDeviceOrientationDidChange:方法
     *  @param handleDeviceOrientationDidChange: handleDeviceOrientationDidChange: description
     *
     *  @return return value description
     */
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleDeviceOrientationDidChange:)
//                                                 name:UIDeviceOrientationDidChangeNotification
//                                               object:nil
//     ];
    

}


- (void)dealloc{
    
    /**
     *  销毁 设备旋转 通知
     *
     *  @return return value description
     */
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIDeviceOrientationDidChangeNotification
//                                                  object:nil
//     ];
    
    
    /**
     *  结束 设备旋转通知
     *
     *  @return return value description
     */
//    [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
    
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}
    
- (void)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation
{
    //1.获取 当前设备 实例
    UIDevice *device = [UIDevice currentDevice] ;
    
    
    
    
    /**
     *  2.取得当前Device的方向，Device的方向类型为Integer
     *
     *  必须调用beginGeneratingDeviceOrientationNotifications方法后，此orientation属性才有效，否则一直是0。orientation用于判断设备的朝向，与应用UI方向无关
     *
     *  @param device.orientation
     *
     */
    
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕朝上平躺");
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            break;
            
            //系統無法判斷目前Device的方向，有可能是斜置
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"屏幕向左横置");
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"屏幕直立，上下顛倒");
            break;
            
        default:
            NSLog(@"无法辨识");
            break;
    }
    
}



- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.maximumZoomScale = PhotoCellMaxScale;
        _scrollView.minimumZoomScale = PhotoCellMinScale;
        _scrollView.showsVerticalScrollIndicator = 0;
        _scrollView.showsHorizontalScrollIndicator = 0;
        _scrollView.zoomScale = 1;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIButton *)originButton{
    if (!_originButton) {
        _originButton = [[UIButton alloc]init];
        [_originButton setTitle:@"点击查看大图" forState:UIControlStateNormal];
        [_originButton setTitle:kLoading forState:UIControlStateSelected];
        _originButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _originButton.backgroundColor = kColorWithRGBA(153, 153, 153, .5);
        _originButton.layer.cornerRadius = 16;
        _originButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _originButton.layer.masksToBounds = 1;
        [_originButton sizeToFit];
        CGRect rect = _originButton.frame;
        rect.size.width += 24;
        rect.size.height = 32;
        
        _originButton.hidden = YES;
        
        _originButton.frame = rect;
        _originButton.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds) - 44);
        [_originButton addTarget:self action:@selector(getOriginImageAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _originButton;
}

- (void)setPhotoModel:(XCPhotoModel *)photoModel{
    _photoModel = photoModel;
    
    //初始化状态
    _photoModel.modelUpdate = NO;
    
    if (self.photoModel.originImage != nil) {
        self.imageView.image = self.photoModel.originImage;
        [self adjustFrame];
        self.originButton.hidden = YES;
    }else{

        if ([AFNetworkReachabilityManager sharedManager].isReachableViaWiFi) {
            
            //是WI-FI，尝试去加载原图
            
            [[SDWebImageManager sharedManager] diskImageExistsForURL:self.photoModel.thumbImageUrl completion:^(BOOL isInCache) {
                
                if (isInCache) {
                    //有缩略缓存
                    UIImage *image = [[SDImageCache sharedImageCache]imageFromCacheForKey:self.photoModel.thumbImageUrl.absoluteString];
                    if (image) {
                        self.photoModel.thumbImage = image;
                    }
                }
                [self getOriginImageAction:nil];
                
            }];
            
        }else{
            //不是WI-FI
            if (self.photoModel.thumbImage != nil) {
                //有缩略图片
                
                [[SDWebImageManager sharedManager] diskImageExistsForURL:self.photoModel.originImageUrl completion:^(BOOL isInCache) {
                    
                    if (isInCache) {
                        //有高清缓存
                        UIImage *image = [[SDImageCache sharedImageCache]imageFromCacheForKey:self.photoModel.originImageUrl.absoluteString];
                        if (image) {
                            self.photoModel.originImage = image;
                            self.imageView.image = image;
                            [self adjustFrame];
                            self.originButton.hidden = YES;
                        }else{
                            
                            self.imageView.image = self.photoModel.thumbImage;
                            [self adjustFrame];
                            self.originButton.hidden = NO;
                        }
                        
                    }else{
                        //没有高清缓存
                        self.imageView.image = self.photoModel.thumbImage;
                        [self adjustFrame];
                        self.originButton.hidden = NO;
                    }
                }];

                
            }else{
                //没有缩略图,加载缩略图
                [self.imageView sd_setImageWithURL:self.photoModel.thumbImageUrl completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    if (error) {
                        //出错，尝试加载原图
                        [self getOriginImageAction:nil];
                    }else{
                        //成功，更新Model，计算尺寸
                        self.photoModel.thumbImage = image;
                        [self adjustFrame];
                        self.originButton.hidden = NO;
                        
                    }
                }];
                
            }
            
        }
        
    }
    
}

- (void)getOriginImageAction:(UIButton *)button{
    
    //加载原图，有缩略图就用缩略图作为占位图
    
    self.originButton.hidden = YES;
    
    if (self.photoModel.thumbImage == nil) {
        [self.imageView sd_setShowActivityIndicatorView:YES];
//        self.imageView.frame = [UIScreen mainScreen].bounds;
    }else{
        [self.imageView sd_setShowActivityIndicatorView:YES];
        self.imageView.image = self.photoModel.thumbImage;
        [self adjustFrame];
    }
    
    [self.imageView sd_addActivityIndicator];
    
    [self.imageView sd_setImageWithURL:self.photoModel.originImageUrl placeholderImage:self.photoModel.thumbImage ?: nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        [self.imageView sd_removeActivityIndicator];
        
        if (error) {
            //错误
            if (self.photoModel.thumbImage == nil) {
                
                //没有缩略图，没有原图，提示错误
                [XCToast showWithMessage:[NSString stringWithFormat:@"获取原图失败%ld",(long)error.code]];
                self.originButton.hidden = NO;
                
            }else{
                
                //有缩略图，没有原图
                if (button == nil) {
                    
                    //不是点击事件，Do nothing
                    self.originButton.hidden = NO;
                    
                }else{
                    
                    //是点击事件，提示
                    [XCToast showWithMessage:[NSString stringWithFormat:@"获取原图失败%ld",(long)error.code]];
                    self.originButton.hidden = NO;
                    
                }
                
            }
            
        }else{
            //成功
            self.photoModel.originImage = image;
            [self updateCache];
            [self adjustFrame];
        }
    }];
    
}


/**
 更新缩略图缓存
 */
- (void)updateCache{
    [[SDWebImageManager sharedManager]saveImageToCache:self.photoModel.originImage forURL:self.photoModel.thumbImageUrl];
}

#pragma mark - 图片处理
- (void)adjustFrame{
    
    [self.imageView sizeToFit];
    
    CGRect frame = self.scrollView.frame;
    
    if (self.imageView.image) {
        CGSize imageSize = self.imageView.image.size;
        if (imageSize.height == 0 || imageSize.width == 0) {
            return;
        }
        CGRect imageFrame = {CGPointZero,imageSize};
        
        CGFloat ratio = frame.size.width/imageFrame.size.width;
        imageFrame.size.height = imageFrame.size.height*ratio;
        imageFrame.size.width = frame.size.width;
        
        
        
        self.imageView.frame = imageFrame;
        self.scrollView.contentSize = imageFrame.size;
        self.imageView.center = [self centerOfScrollViewContent:self.scrollView];
        
        CGFloat maxScale = frame.size.height/imageFrame.size.height;
        maxScale = frame.size.width/imageFrame.size.width>maxScale?frame.size.width/imageFrame.size.width:maxScale;
        //        CGFloat maxScale = MAX(frame.size.height/imageFrame.size.height,
        //                               frame.size.width/imageFrame.size.width);
        
        maxScale = maxScale>PhotoCellMaxScale?maxScale:PhotoCellMaxScale;
        self.scrollView.minimumZoomScale = PhotoCellMinScale;
        self.scrollView.maximumZoomScale = maxScale;
        self.scrollView.zoomScale = 1.0f;
        
        
    }else{
        frame.origin = CGPointZero;
        self.imageView.frame = frame;
        self.scrollView.contentSize = self.imageView.frame.size;
    }
    self.scrollView.contentOffset = CGPointZero;
    
    //更新按钮状态
//    self.originButton.hidden = self.photoModel.originImage != nil;
}

- (CGPoint)centerOfScrollViewContent:(UIScrollView *)scrollView{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    CGPoint actualCenter = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                       scrollView.contentSize.height * 0.5 + offsetY);
    return actualCenter;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    UIView *subView = self.imageView;
    
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    
    subView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                 scrollView.contentSize.height * 0.5 + offsetY);
}

- (void)resetScale{
    if (self.scrollView.zoomScale > 1.0) {
        self.scrollView.zoomScale = 1.0;
    }
}

#pragma mark - 点击事件
- (void)longPressAction:(UILongPressGestureRecognizer *)longPress{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        if ([self.delegate respondsToSelector:@selector(longPressWithPhotoModel:)]) {
            [self.delegate longPressWithPhotoModel:self.photoModel];
        }
    }

}

- (void)doubleTapAction:(UITapGestureRecognizer *)doubleTap{
    
    if (!self.photoModel.thumbImage)return;
    
    CGPoint touchPoint = [doubleTap locationInView:self];
    if (self.scrollView.zoomScale <= 1.0) {
        CGFloat scaleX = touchPoint.x + self.scrollView.contentOffset.x;
        CGFloat sacleY = touchPoint.y + self.scrollView.contentOffset.y;
        [self.scrollView zoomToRect:CGRectMake(scaleX, sacleY, 10, 10) animated:YES];
    } else {
        [self.scrollView setZoomScale:1.0 animated:YES];
    }
}

- (void)tapAction{
    if (self.scrollView.zoomScale != 1.0) {
        [self.scrollView setZoomScale:1.0 animated:YES];
    }else{
        if ([self.delegate respondsToSelector:@selector(tapWithPhotoModel:)]) {
            [self.delegate tapWithPhotoModel:self.photoModel];
        }
    }
}



/**
 将被复用的时候，如果Model 被更新过，回传给Controller
 */
- (void)prepareForReuse{
    [super prepareForReuse];
    if (!self.photoModel.modelUpdate) return;
    
    if ([self.delegate respondsToSelector:@selector(cellPrepareForReuseWithPhotoModel:uuid:)]) {
        [self.delegate cellPrepareForReuseWithPhotoModel:self.photoModel uuid:self.uuid];
    }
}


@end










#pragma mark - XCPhotoBrowser

#import <UIView+Screenshot.h>
#import "PrivacyPermissionManager.h"

@interface XCPhotoBrowser ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,XCPhotoCellDelegate>

@property (nonatomic, strong) NSMutableArray<XCPhotoModel *> *dataSource;
@property (nonatomic, strong) NSMutableArray<NSString *> *uuidArr;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) BOOL statusBarShouldBeHidden;

@property (nonatomic, assign) BOOL statusBarShouldBeRefresh;
/**  */
@property (nonatomic, strong) UIImageView *transitionImageView;

@property (nonatomic, strong) UIImageView *screenImageView;

@end

@implementation XCPhotoBrowser{
    CGAffineTransform transform;
    CGFloat animationDuration;
    CGRect originFrame;
}

#pragma mark - LifeCyle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubviews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //如果是POP回来的，需刷新状态栏
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //如果是PUSH走的，需要做以下操作
    self.statusBarShouldBeHidden = NO;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //如果是POP回来的，需刷新状态栏
    if (self.statusBarShouldBeHidden == NO) {
        self.statusBarShouldBeHidden = YES;
        [UIView animateWithDuration:animationDuration animations:^(void) {
            [self setNeedsStatusBarAppearanceUpdate];
        } completion:^(BOOL finished) {}];
    }
}

#pragma mark - Intial Methods
- (void)initSubviews {
    self.fd_prefersNavigationBarHidden = YES;
    self.fd_interactivePopDisabled = YES;
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    self.screenImageView = [[UIImageView alloc]initWithFrame:screenRect];
    self.screenImageView.image = _screenImage;
    [self.view addSubview:_screenImageView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc]initWithFrame:screenRect collectionViewLayout:layout];
    
    _collectionView.showsVerticalScrollIndicator = 0;
    _collectionView.showsHorizontalScrollIndicator = 0;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = 1;
//    _collectionView.
    
    [_collectionView registerClass:[XCPhotoCell class] forCellWithReuseIdentifier:NSStringFromClass([XCPhotoCell class])];
    
    [self configDataSource];
    
    [self.view addSubview:_collectionView];
    self.collectionView.hidden = YES;
    
    if (self.dataSource.count > 1) {
        NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:self.currentIndex > self.dataSource.count - 1 ? self.dataSource.count - 1 : self.currentIndex inSection:0];
        
        [_collectionView scrollToItemAtIndexPath:currentIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    
    
    
    //过渡动画
    
//    self.statusBarShouldBeHidden = YES;
    animationDuration = .25;
    
//    [UIView animateWithDuration:animationDuration animations:^(void) {
//        [self setNeedsStatusBarAppearanceUpdate];
//    } completion:^(BOOL finished) {}];
    
    originFrame = [self.imageView.superview convertRect:self.imageView.frame toView:[UIApplication sharedApplication].keyWindow];
    // TODO: Frame
    CGRect targetFrame = {CGPointZero, self.imageView.image.size};
    
    self.transitionImageView = [[UIImageView alloc]initWithImage:self.imageView.image];
    self.transitionImageView.contentMode = self.imageView.contentMode;
    self.transitionImageView.clipsToBounds = YES;
    
    [self.view addSubview:self.transitionImageView];
    
    CGFloat ratio = screenRect.size.width/targetFrame.size.width;
    targetFrame.size.height = targetFrame.size.height*ratio;
    targetFrame.size.width = screenRect.size.width;
    
//    CGFloat sx = originFrame.size.width / targetFrame.size.width;
//    CGFloat sy = originFrame.size.height / targetFrame.size.height;
    
//    CGFloat tx = -(targetFrame.size.width - sx * targetFrame.size.width)/2.f + originFrame.origin.x;
//    CGFloat ty = -(targetFrame.size.height - sy * targetFrame.size.height)/2.f + originFrame.origin.y;
    
    
    
//    transform = CGAffineTransformMakeTranslation(tx, ty);
//    transform = CGAffineTransformScale(transform, sx, sy);
    
//    self.transitionImageView.transform = transform;
    self.transitionImageView.frame = originFrame;
    
    [UIView animateWithDuration:animationDuration animations:^{
        self.screenImageView.alpha = 0;
//        self.transitionImageView.transform = CGAffineTransformIdentity;
        self.transitionImageView.frame = targetFrame;
        self.transitionImageView.center = self.view.center;
        
    } completion:^(BOOL finished) {
        
        self.collectionView.hidden = NO;
        self.transitionImageView.hidden = YES;
        
    }];
    

}



- (UIStatusBarStyle)preferredStatusBarStyle{
    return self.fromViewStatusBarStyle;
}

- (BOOL)prefersStatusBarHidden{
    return self.statusBarShouldBeHidden;
}
#pragma mark - FetchData
- (void)configDataSource{
    
    self.dataSource = [NSMutableArray array];
    self.uuidArr = [NSMutableArray array];
    
    NSInteger index = 0;
    
    switch (self.type) {
        case XCPhotoBrowserNIMMessage:{
//            for(NIMMessage *message in self.messageArr){
//                XCPhotoModel *model = [[XCPhotoModel alloc]initWithMessage:message];
//                if (index == self.currentIndex) {
//                    model.thumbImage = self.imageView.image;
//                }
//                [self.dataSource addObject:model];
//                [self.uuidArr addObject:[NSUUID UUID].UUIDString];
//                index ++;
//            }
            break;
        }
            
        case XCPhotoBrowserNormalImage:{
            for(NSString *imageUrl in self.imageUrlArr){
                XCPhotoModel *model = [[XCPhotoModel alloc]initWithImageUrl:imageUrl];
                if (index == self.currentIndex) {
                    model.thumbImage = self.imageView.image;
                }
                [self.dataSource addObject:model];
                [self.uuidArr addObject:[NSUUID UUID].UUIDString];
                index ++;
            }
            break;
        }
            
        case XCPhotoBrowserUserHeader:{
            XCPhotoModel *model = [[XCPhotoModel alloc]initWithUid:self.userId];
            model.thumbImage = self.imageView.image;
            [self.dataSource addObject:model];
            [self.uuidArr addObject:[NSUUID UUID].UUIDString];
            break;
        }
            
        default:
            break;
    }
}

//- (void)setMessageArr:(NSArray<NIMMessage *> *)messageArr{
//    _messageArr = messageArr;
//    
//}

#pragma mark - Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return collectionView.bounds.size;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XCPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([XCPhotoCell class]) forIndexPath:indexPath];
    cell.photoModel = self.dataSource[indexPath.row];
    cell.uuid = self.uuidArr[indexPath.row];
    cell.delegate = self;
    return cell;
}

- (void)tapWithPhotoModel:(XCPhotoModel *)photoModel{
    
    self.statusBarShouldBeHidden = NO;
    
    CGPoint pInView = [self.view convertPoint:self.collectionView.center toView:self.collectionView];
    NSIndexPath *indexPathNow = [self.collectionView indexPathForItemAtPoint:pInView];
    
    //　当前索引是不是原来的索引
    BOOL isOriginImageIndex = indexPathNow.row == self.currentIndex;
    
    
    CGFloat dismissAnimationDuration = .22;
    
    if (isOriginImageIndex) {
        
        
        self.collectionView.hidden = YES;
        self.transitionImageView.hidden = NO;
        self.transitionImageView.clipsToBounds = YES;
        
        if (self.type == XCPhotoBrowserUserHeader) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dismissAnimationDuration/3.f * 2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.transitionImageView.layer.cornerRadius = 50;
            });
        }
        
        [UIView animateWithDuration:dismissAnimationDuration animations:^{
            
            [self setNeedsStatusBarAppearanceUpdate];
            self.screenImageView.alpha = 1;
            self.transitionImageView.frame = originFrame;
            if (self.type == XCPhotoBrowserNIMMessage) {
                self.transitionImageView.alpha = 0;
            }
            
        } completion:^(BOOL finished) {
            
            [self.navigationController popViewControllerAnimated:NO];
            
        }];
    }else{
        self.screenImageView.alpha = 1;
        self.statusBarShouldBeHidden = NO;
        
        [UIView animateWithDuration:dismissAnimationDuration animations:^{
            
            [self setNeedsStatusBarAppearanceUpdate];
            self.collectionView.alpha = 0;
            self.collectionView.transform = CGAffineTransformMakeScale(.3, .3);
            
        } completion:^(BOOL finished) {
            self.screenImageView.hidden = YES;
            [self.navigationController popViewControllerAnimated:NO];
        }];
    }
    
    

}

- (void)longPressWithPhotoModel:(XCPhotoModel *)photoModel{
//    [self.navigationController popViewControllerAnimated:NO];
//    HelpCenterViewController *vc = [[HelpCenterViewController alloc]init];
//    self.statusBarShouldBeHidden = NO;
//    [self.navigationController pushViewController:vc animated:YES];
    
    NSMutableArray *titleArr = [NSMutableArray array];
//    if (photoModel.hasQrcode) {
//            [titleArr addObject:@"识别图中二维码"];
//    }
    [titleArr addObject:@"保存图片到本地"];
    [YZActionSheet showActionSheetWithTitles:[titleArr copy] selected:^(NSInteger idx) {
        if (idx == titleArr.count - 1) {
            if (![[PrivacyPermissionManager sharedManager]hasBeenBannedForPhotoLibraryPermission]){
                    UIImageWriteToSavedPhotosAlbum(photoModel.originImage ? photoModel.originImage : photoModel.thumbImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
            }

        }else{
//            [self qrcodeHandleResult:photoModel.qrCode completed:^(RespondModel *respondModel) {
//                if (respondModel.code != 200) {
//                    [PromptViewTwo promptTitle:respondModel.desc];
//                }
//            }];
        }
    }];


//    
//    XCAlertController *alertC = [XCAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    
//    if (photoModel.hasQrcode) {
//        [alertC addAction:[XCAlertAction actionWithTitle:@"识别图中二维码" style:UIAlertActionStyleDefault handler:^(XCAlertAction *action) {
//            [self qrcodeHandleResult:photoModel.qrCode completed:^(RespondModel *respondModel) {
//                if (respondModel.code != 200) {
//                    [PromptViewTwo promptTitle:respondModel.desc];
//                }
//            }];
//        }]];
//    }
//    
//    // TODO: HUD
//    [alertC addAction:[XCAlertAction actionWithTitle:@"保存图片到本地" style:UIAlertActionStyleDefault handler:^(XCAlertAction *action) {
//        UIImageWriteToSavedPhotosAlbum(photoModel.originImage ? photoModel.originImage : photoModel.thumbImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
//    }]];
//    
//    [alertC addAction:[XCAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(XCAlertAction *action) {
//        [self setStatusBarShouldBeRefresh:YES];
//    }]];
//    
//    [self presentViewController:alertC animated:YES completion:nil];

}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        [XCToast showWithMessage:error.localizedDescription];
    }else{
        [XCToast showWithMessage:@"保存成功"];
    }
}

- (void)cellPrepareForReuseWithPhotoModel:(XCPhotoModel *)photoModel uuid:(NSString *)uuid{
    [self.dataSource replaceObjectAtIndex:[self.uuidArr indexOfObject:uuid] withObject:photoModel];
}

- (instancetype)initWithDataSource:(NSArray *)dataSource
                      currentIndex:(NSInteger)currentIndex
                         imageView:(UIImageView *)imageView
                              type:(XCPhotoBrowserType)type
                       screenImage:(UIImage *)screenImage
            fromViewStatusBarStyle:(UIStatusBarStyle)fromViewStatusBarStyle{
    if (self = [super init]) {
        
        switch (type) {
            case XCPhotoBrowserNIMMessage:
//                self.messageArr = dataSource;
                break;
                
            case XCPhotoBrowserNormalImage:
                self.imageUrlArr = dataSource;
                break;
                
            case XCPhotoBrowserUserHeader:
                self.userId = dataSource.lastObject;
                break;
                
            default:
                break;
        }
        
        self.currentIndex = currentIndex;
        self.imageView = imageView;
        self.type = type;
        self.screenImage = screenImage;
        self.fromViewStatusBarStyle = fromViewStatusBarStyle;
        
    }
    return self;
}

+ (void)showWithDataSource:(NSArray *)dataSource
              currentIndex:(NSInteger)currentIndex
                 imageView:(UIImageView *)imageView
                      type:(XCPhotoBrowserType)type{
    
    if (dataSource.count == 0) return;
    
    XCPhotoBrowser *browser = [[XCPhotoBrowser alloc]initWithDataSource:dataSource
                                                           currentIndex:currentIndex
                                                              imageView:imageView
                                                                   type:type
                                                            screenImage:[[UIApplication sharedApplication].keyWindow imageByRenderingView]
                                                 fromViewStatusBarStyle:[UIApplication sharedApplication].statusBarStyle];
   
    [[UIViewController getCurrentVC].navigationController pushViewController:browser animated:NO];
}

#pragma mark - Target Methods

@end
