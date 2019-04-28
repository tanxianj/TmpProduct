//
//  XCImageUploadView.m
//  消汇邦
//
//  Created by 1244 on 2017/9/12.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "XCImageUploadView.h"
#import "XCPhotoBrowser.h"

#import "UIImage+Category.h"
#import <YYCache.h>

NSString *const kXCImageUploadModelExtend = @"extend";
NSString *const kXCImageUploadModelFilename = @"image_name";
NSString *const kXCImageUploadModelFilenameUrl = @"url";

@implementation XCImageUploadModel

- (NSString *)base64String{
    return [self.image convertToBase64StringWithCompressionQuality:1];
}

-(void)configWithDictionary:(NSDictionary *)dictionary{
    if(![dictionary[kXCImageUploadModelExtend] isKindOfClass:[NSNull class]]){
        self.extend = dictionary[kXCImageUploadModelExtend];
    }
    if(![dictionary[kXCImageUploadModelFilename] isKindOfClass:[NSNull class]]){
        self.filename = dictionary[kXCImageUploadModelFilename];
    }
    if(![dictionary[kXCImageUploadModelFilenameUrl] isKindOfClass:[NSNull class]]){
        self.filenameUrl = dictionary[kXCImageUploadModelFilenameUrl];
    }	
}


@end










#pragma mark - XCImageUploadManager
#import <Photos/Photos.h>
@implementation XCImageUploadManager

static int finishOperationCount = 0;

+ (instancetype)sharedManager{
    static XCImageUploadManager *manger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manger) {
            manger = [[XCImageUploadManager alloc]init];
        }
    });
    
    return manger;
}

- (instancetype)init{
    if (self = [super init]) {
//        self.imageUploadQueue = [[NSOperationQueue alloc]init];
//        self.imageUploadQueue.maxConcurrentOperationCount = 3;
    }
    return self;
}

- (NSArray<XCImageUploadModel *> *)uploadImages:(NSArray<UIImage *> *)images sourceAssets:(NSArray *)assets{
    
    finishOperationCount = 0;
    
    NSInteger index = 0;
    NSMutableArray *tempArr = [NSMutableArray arrayWithCapacity:images.count];
//    __weak typeof(self) weakSelf = self;
    for (PHAsset *asset in assets) {
        
        XCImageUploadModel *model = [[XCImageUploadModel alloc]init];
        model.image = images[index];
        model.uuid = [NSUUID UUID].UUIDString;
        model.localIdentifier = asset.localIdentifier;
        model.status = XCImageUploadStatusProcessing;
        [tempArr addObject:model];
        __weak typeof(model) weakModel = model;
//        [_imageUploadQueue addOperationWithBlock:^{
            [self uploadImageWithModel:weakModel];
//        }];
        
        index ++;
    }
    
    
    return tempArr.copy;
    
}

- (void)uploadImageWithModel:(XCImageUploadModel *)model{
    
    //有缓存就读取缓存并回调
    if ([self.imageCache objectForKey:model.localIdentifier] != nil) {
        
        model.status = XCImageUploadStatusUploadSuccess;
        [model configWithDictionary:[self.imageCache objectForKey:model.localIdentifier]];
        if ([self.delegate respondsToSelector:@selector(successUploadImageWithModel:)]) {
//            [self.delegate successUploadImageWithModel:model];
        }
        
    }else{
        NSLog(@"Network start %@\%ld",model.imageUrl,(unsigned long)model.status);
        
        NSURLSessionTask *task = [[HTTPSessionManager sharedManager]POST:@"/api/file/upload" parameters:@{@"file":model.base64String,@"type":@"1"} callBack:^(RespondModel *responseModel) {
            finishOperationCount ++;
            
            if (responseModel.status == 200) {
                model.status = XCImageUploadStatusUploadSuccess;
                [model configWithDictionary:responseModel.data];
                
                //缓存
                [self.imageCache setObject:responseModel.data forKey:model.localIdentifier];
                
                NSLog(@"success %@",responseModel.data);
                
                //            if (finishOperationCount % 3 == 0) {
                if ([self.delegate respondsToSelector:@selector(successUploadImageWithModel:)]) {
                    [self.delegate successUploadImageWithModel:model];
                }
                //            }
                
            }else{
                
                NSLog(@"fail %@",responseModel.message);
                
                model.status = XCImageUploadStatusUploadError;
                //            if (finishOperationCount % 3 == 0) {
                if ([self.delegate respondsToSelector:@selector(failToUploadImageWithModel:)]) {
                    [self.delegate failToUploadImageWithModel:model];
                }
                //            }
            }
        }];
        
        NSLog(@"taskIdentifier:%lu",(unsigned long)task.taskIdentifier);

    }
    

}

- (NSCache *)imageCache{
    if (!_imageCache) {
        _imageCache = [[NSCache alloc]init];
    }
    return _imageCache;
}

@end









#pragma mark - XCImageUploadCell

#import <UIView+WebCache.h>

@interface XCImageUploadCell()

/**  */
@property (nonatomic, strong) UIImageView *deleteImage;
/**  */
@property (nonatomic, strong) UIImageView *errorImage;

/**  */
@property (nonatomic, strong) UIView *shadeView;

@end

@implementation XCImageUploadCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.imageView sd_setShowActivityIndicatorView:YES];
        
        self.imageView.layer.borderColor = [UIColor appLineColor].CGColor;
        self.imageView.layer.borderWidth = .5;
        
        self.imageView = [[UIImageView alloc]init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.layer.masksToBounds = YES;

        
        self.errorImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"send_failure"]];
        
        self.deleteImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"send_delete"]];
        
        self.shadeView = [[UIView alloc]init];
        self.shadeView.backgroundColor = [UIColor colorWithWhite:.5 alpha:.5];
        
        
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.errorImage];
        [self.contentView addSubview:self.deleteImage];
        [self.contentView addSubview:self.shadeView];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        [self.shadeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        [self.deleteImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.equalTo(self.contentView);
            make.width.height.mas_equalTo(16);
        }];
        [self.errorImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
            make.width.height.mas_equalTo(16);
        }];
        
        
    }
    return self;
}

- (void)setModel:(XCImageUploadModel *)model{
    _model = model;
    
    //根据数据更新UI
    
    switch (model.status) {
            
        case XCImageUploadStatusNormal:
        case XCImageUploadStatusUploadButton:
            self.deleteImage.hidden = YES;
            self.errorImage.hidden = YES;
            self.shadeView.hidden = YES;
            self.imageView.image = [UIImage imageNamed:@"evaluation_icon_picture"];
            [self loadImage];
            break;

            
        default:{
            self.deleteImage.hidden = (model.status != XCImageUploadStatusUploadSuccess && model.status != XCImageUploadStatusUploadError);
            self.errorImage.hidden = model.status != XCImageUploadStatusUploadError;
            self.shadeView.hidden = (model.status != XCImageUploadStatusProcessing);
            
            self.imageView.image = model.image;
            
            [self loadImage];

            if (model.status == XCImageUploadStatusProcessing) {
                [self.imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
                [self.imageView sd_addActivityIndicator];
            }else{
                [self.imageView sd_removeActivityIndicator];
            }
            break;
                
        }
    }
    

    
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.model.status == XCImageUploadStatusNormal) {
        if ([self.delegate respondsToSelector:@selector(didTapCell:)]) {
            [self.delegate didTapCell:self];
        }
        return;
    };
    
    CGPoint touchPoint = [touches.anyObject locationInView:self.contentView];
    //根据数据响应不用事件
    if (touchPoint.x >= 50 && touchPoint.y <= 30) {
        if (self.model.status == XCImageUploadStatusUploadSuccess || self.model.status == XCImageUploadStatusUploadError) {
            if ([self.delegate respondsToSelector:@selector(didDeletedCellWithModel:cell:)]) {
                [self.delegate didDeletedCellWithModel:self.model cell:self];
            }
        }
    }else{
        if (self.model.status == XCImageUploadStatusUploadError) {
            if ([self.delegate respondsToSelector:@selector(didRestartUploadWithModel:cell:)]) {
                [self.delegate didRestartUploadWithModel:self.model cell:self];
            }
        }else if (self.model.status == XCImageUploadStatusUploadButton){
            if ([self.delegate respondsToSelector:@selector(didTapUploadButton)]) {
                [self.delegate didTapUploadButton];
            }
        }
    }
}

- (void)loadImage{
    
    if (!self.model.imageUrl.length) return;
    
    [self.imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [self.imageView sd_addActivityIndicator];
    [self.imageView sd_setImageWithURL:[ImageUrlTool commonImageUrlWithName:self.model.imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [self.imageView sd_removeActivityIndicator];
        if (error) {
            
        }else{
            self.model.image = image;
        }
    }];
    
}


@end










#pragma mark - XCImageUploadView

#import <TZImagePickerController/TZImagePickerController.h>
#import "XCPhotoBrowser.h"

@interface XCImageUploadView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,XCImageUploadCellDelegate,TZImagePickerControllerDelegate,XCImageUploadManagerDelegate>

/**  */
@property (nonatomic, strong) UICollectionView *collectionView;

/**  */
@property (nonatomic, strong) NSMutableArray <XCImageUploadModel *> *dataSource;

/**  */
@property (nonatomic, strong) XCImageUploadManager *manager;


/**  */
@property (nonatomic, assign) BOOL canUpload;

@end

@implementation XCImageUploadView


- (instancetype)init{
    if (self = [super init]) {
        self.canUpload = YES;
        [self initSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.canUpload = YES;
        [self initSubviews];
    }
    return self;
}

- (instancetype)initWithImageUrlArray:(NSArray<NSString *> *)imageUrlArray canUpload:(BOOL)canUpload{
    if (self = [super init]) {
        
        [self setImageUrlArray:imageUrlArray canUpload:canUpload needReload:NO];
        
        [self initSubviews];
        
    }
    return self;
}

- (void)setImageUrlArray:(NSArray *)imageUrlArray canUpload:(BOOL)canUpload needReload:(BOOL)needReload{
    
    NSMutableArray<XCImageUploadModel *> *tempArr = [NSMutableArray arrayWithCapacity:imageUrlArray.count];
    
    for (NSString *imageUrl in imageUrlArray) {
        
        
        XCImageUploadModel *model = [[XCImageUploadModel alloc]init];
        model.imageUrl = imageUrl;
        model.filenameUrl = imageUrl;
        model.filename = imageUrl;
        NSString *uuid = [NSUUID UUID].UUIDString;
        model.uuid = uuid;
        model.status = canUpload ? XCImageUploadStatusUploadSuccess : XCImageUploadStatusNormal;
        model.localIdentifier = uuid;
        [tempArr addObject:model];
        
    }
    
    self.canUpload = canUpload;
    
    [self.dataSource removeAllObjects];
    
    [self.dataSource addObjectsFromArray:tempArr];
    
    if (needReload) {
        [self.collectionView reloadData];
    }
    
}

- (void)initSubviews {
    
    _manager = [XCImageUploadManager sharedManager];
    _manager.delegate = self;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumLineSpacing = 8;
    layout.minimumInteritemSpacing = 8;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = 0;
    _collectionView.showsHorizontalScrollIndicator = 0;
    [_collectionView registerClass:[XCImageUploadCell class] forCellWithReuseIdentifier:NSStringFromClass([XCImageUploadCell class])];
    
    [self addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self scrollToRight];
    
    self.tipsLabel = [BaseClassTool labelWithFont:14 textColor:[UIColor appBlackDescColor] textAlignment:NSTextAlignmentLeft];
    self.tipsLabel.text = @"晒晒图吧~";
    [_collectionView addSubview:self.tipsLabel];
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_collectionView.mas_centerY);
        make.left.equalTo(_collectionView).offset(10+80+10);
    }];
    
}



- (void)scrollToRight{
    
//    if (self.canUpload) {
//        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//    }else{
//        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.dataSource.count > 0 ? 0 : self.dataSource.count - 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//    }
    
//    [self.collectionView setContentOffset:CGPointMake(MAXFLOAT, 0)];
    
}

#pragma mark - Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.canUpload ? 2 : 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return section ? 1 : self.dataSource.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XCImageUploadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([XCImageUploadCell class]) forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.model = self.dataSource[indexPath.row];
    }else{
        XCImageUploadModel *model = [[XCImageUploadModel alloc]init];
        model.status = XCImageUploadStatusUploadButton;
        cell.model = model;
    }
    
    cell.delegate = self;
    
    return cell;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (self.dataSource.count == 0) {
        return UIEdgeInsetsZero;
    }else{
        return UIEdgeInsetsMake(0, 0, 0, 10);
    }
}


// TZImagePickerControllerDelegate
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos{
    
    
    self.tipsLabel.hidden = YES;
    //添加上传任务
    [self.dataSource addObjectsFromArray:[_manager uploadImages:photos sourceAssets:assets]];
    
    [self.collectionView reloadData];
    
    [self scrollToRight];
    
}


// XCImageUploadManagerDelegate
- (void)successUploadImageWithModel:(XCImageUploadModel *)model{
    //根据model查找cell，更新状态
    [self.dataSource replaceObjectAtIndex:[self getCurrentIndexWithModel:model] withObject:model];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(filenameArrayChanged)]) {
        [self.delegate filenameArrayChanged];
    }
    
    [self.collectionView reloadData];
}

- (void)failToUploadImageWithModel:(XCImageUploadModel *)model{
    //根据model查找cell，更新状态
    
    [self.dataSource replaceObjectAtIndex:[self getCurrentIndexWithModel:model] withObject:model];
    
    [self.collectionView reloadData];
    
}

// XCImageUploadCellDelegate
- (void)didDeletedCellWithModel:(XCImageUploadModel *)model cell:(XCImageUploadCell *)cell{
    //删除相关数据源，并更新CollectionView
    
    [self.dataSource removeObject:model];
    [self.collectionView deleteItemsAtIndexPaths:@[[self.collectionView indexPathForCell:cell]]];
    if (self.dataSource.count == 0) {
        self.tipsLabel.hidden = NO;
    }
}

- (void)didRestartUploadWithModel:(XCImageUploadModel *)model cell:(XCImageUploadCell *)cell{
    //刷新model，设置为XCImageUploadStatusProcessing，并启动上传
    
    model.status = XCImageUploadStatusProcessing;
    
    [self.dataSource replaceObjectAtIndex:[self.collectionView indexPathForCell:cell].row withObject:model];
    
    [self.collectionView reloadItemsAtIndexPaths:@[[self.collectionView indexPathForCell:cell]]];
    
    [self.manager uploadImageWithModel:model];
}

- (void)didTapUploadButton{
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc]initWithMaxImagesCount:self.imageArryCont ? self.imageArryCont : 9 - self.dataSource.count delegate:self];
    imagePicker.allowPickingVideo = NO;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:imagePicker animated:1 completion:nil];
}

- (void)didTapCell:(XCImageUploadCell *)cell{
    [XCPhotoBrowser showWithDataSource:self.fileNameArray currentIndex:[self.collectionView indexPathForCell:cell].row imageView:cell.imageView type:XCPhotoBrowserNormalImage];
}

- (NSInteger)getCurrentIndexWithModel:(XCImageUploadModel *)model{
    __block NSInteger index = 0;
    [self.dataSource enumerateObjectsUsingBlock:^(XCImageUploadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.uuid isEqualToString:model.uuid]) {
            index = idx;
        }
    }];
    
    return index;
}

#pragma mark - Getter/Setter
- (NSArray<NSString *> *)fileNameArray{
    
    NSMutableArray *fileNameTempArray = [NSMutableArray arrayWithCapacity:self.dataSource.count];
    
    for (XCImageUploadModel *model in self.dataSource) {
        
        if (model.filenameUrl) {
            [fileNameTempArray addObject:model.filenameUrl];
        }else if(model.imageUrl){
            [fileNameTempArray addObject:model.imageUrl];
        }
    }
    
    return fileNameTempArray.copy;
}



- (NSMutableArray <XCImageUploadModel *> *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

+ (CGFloat)minimumContentHeight{
    return 80;
}

@end










