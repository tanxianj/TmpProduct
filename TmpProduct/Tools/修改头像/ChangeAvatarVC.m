//
//  ChangeAvatarVC.m
//  yidiankuang
//
//  Created by 谭显敬 on 2019/1/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ChangeAvatarVC.h"

//#import "ImageUrlTool.h"
//#import "ImageManager.h"
#import <TZImagePickerController.h>

#import "NavigationBar.h"

#import "UIImage+WSSCategory.h"
#import "UserModel.h"

#define MaxSCale 2.0  //最大缩放比例
#define MinScale 0.5  //最小缩放比例

@interface ChangeAvatarVC () <TZImagePickerControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView  *avatarIV;

@property (nonatomic, strong) UIPinchGestureRecognizer *pin;
@property (nonatomic, strong) UIPanGestureRecognizer   *pan;

@property (nonatomic, assign) CGFloat totalScale;

@property (nonatomic, strong) UIButton *rightBUtton;



@end

@implementation ChangeAvatarVC

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColorWithRGBA(40, 41, 43,1);
//    __weak typeof(self) weakSelf = self;
//    self.navcBar.rightItem = @"修改";
//    self.navcBar.rightBlock = ^{
//        [weakSelf presentToPickerController];
//    };
    [self setupNavigationItems];
}

- (BOOL)xhb_preferredNavigationBarHidden{
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.topSeparatorLine.hidden = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.avatarIV.transform = CGAffineTransformIdentity;
    self.avatarIV.layer.anchorPoint = CGPointMake(0.5, 0.5);
    self.avatarIV.frame = CGRectMake(0, (kScreenHeight  - kScreenWidth)/2.0 + 32, kScreenWidth, kScreenWidth);
    
}



#pragma mark - private methods

- (void)pinch:(UIPinchGestureRecognizer *)pin {
    if (pin.state == UIGestureRecognizerStateBegan) {
        //手势发生在哪个view上
        UIView *piece = pin.view;
        //获得当前手势在view上的位置。
        CGPoint locationInView = [pin locationInView:piece];
        piece.layer.anchorPoint =CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        //根据在view上的位置设置锚点。
        //防止设置完锚点过后，view的位置发生变化，相当于把view的位置重新定位到原来的位置上。
        CGPoint locationInSuperview = [pin locationInView:piece.superview];
        piece.center = locationInSuperview;
    }
    else if (pin.state == UIGestureRecognizerStateChanged) {
        CGFloat scale = pin.scale;
        self.avatarIV.transform = CGAffineTransformScale(self.avatarIV.transform, scale, scale);
        self.totalScale *=scale;
    }
    
    else if  (pin.state == UIGestureRecognizerStateEnded && (self.totalScale < 1.0 || self.totalScale > 2.0))  {
        CGFloat toScale;
        toScale = self.totalScale < 1.0 ? 1.0 : 2.0;
        self.totalScale = toScale;
        [UIView animateWithDuration:0.1 animations:^{
            self.avatarIV.transform = CGAffineTransformIdentity;
            self.avatarIV.transform = CGAffineTransformScale(self.avatarIV.transform, toScale, toScale);
        }];
    }
    pin.scale = 1.0;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    if (pan.state != UIGestureRecognizerStateEnded) {
        CGPoint point = [pan translationInView:self.avatarIV];
        pan.view.center = CGPointMake(pan.view.center.x + point.x, pan.view.center.y + point.y);
        [pan setTranslation:CGPointMake(0, 0) inView:self.view];
    }
    else {
        CGRect frame = self.avatarIV.frame;
        if (frame.size.height < kScreenHeight - 64) {
            frame.origin.y = (kScreenHeight - 64 - frame.size.height) / 2.0 + 64;
        }
        else {
            if (frame.origin.y > 64) {
                frame.origin.y = 64;
            }
            else if (frame.origin.y + frame.size.height < kScreenHeight) {
                frame.origin.y = kScreenHeight - frame.size.height;
            }
        }
        if (frame.size.width < kScreenWidth) {
            frame = CGRectMake(0, (kScreenHeight - 64 - kScreenWidth) / 2.0, kScreenWidth, kScreenWidth);
        }
        else {
            if (frame.origin.x > 0) {
                frame.origin.x = 0;
            }
            else if (frame.origin.x + frame.size.width < kScreenWidth) {
                frame.origin.x = kScreenWidth - frame.size.width;
            }
        }
        [UIView animateWithDuration:0.1 animations:^{
            self.avatarIV.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
    }
}

#pragma mark - 界面跳转

- (void)presentToPickerController {
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
    imagePicker.allowPickingVideo  =NO;
    imagePicker.allowCrop = 1;
    imagePicker.circleCropRadius = kScreenWidth / 2.f;
    [self.navigationController presentViewController:imagePicker animated:1 completion:nil];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    UIImage *avatar;
    avatar = [UIImage imageWithImage:photos.lastObject maxLength:960];
    NSData *avatarData = UIImageJPEGRepresentation(avatar, 0.95);
    NSString *avatarStr = [avatarData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    avatarStr = [NSString stringWithFormat:@"data:image/jpeg;base64,%@", avatarStr];
    self.avatarIV.image = avatar;
    [[SDImageCache sharedImageCache]storeImage:photos.lastObject forKey:@"" completion:^{
        
    }];
    [[HTTPSessionManager sharedManager] POST:@"/api/file/upload" parameters:@{@"file":avatarStr,@"type":@"1"} callBack:^(RespondModel *responseModel) {
//        [XCToast showWithMessage:responseModel.message];
        if (responseModel.status == 200) {
            [self setHeadpic:responseModel.data[@"url"]];
        }
    }];

    
}
-(void)setHeadpic:(NSString *)hederUrl{
    [[HTTPSessionManager sharedManager] POST:@"/api/user/setHeadpic" parameters:@{@"head_pic":hederUrl} callBack:^(RespondModel *responseModel) {
        [XCToast showWithMessage:responseModel.message];
    }];
}
#pragma mark - <Initialization>

- (void)initializeData {
    _totalScale = 1.0;
}

- (void)initializeSubViews {
    _pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    
    _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    _avatarIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, (kScreenHeight - kScreenWidth)/2.0 + 32, kScreenWidth, kScreenWidth)];
    _avatarIV.image = [UIImage imageNamed:@"def-head"];
    NSString *url = [UserInfoAndShopModel sharedUserModel].user.head_pic;
    [_avatarIV sd_setImageWithURL:[NSURL URLWithString:url]];
    
        NSURL *originUrl = [NSURL URLWithString:url];
    
    //    [[SDWebImageManager sharedManager]diskImageExistsForURL:originUrl completion:^(BOOL isInCache) {
    //        if (isInCache) {
    [[SDWebImageManager sharedManager].imageDownloader downloadImageWithURL:originUrl
                                                                    options:0
                                                                   progress:nil
                                                                  completed:^(UIImage * _Nullable image,
                                                                              NSData * _Nullable data,
                                                                              NSError * _Nullable error,
                                                                              BOOL finished) {
                                                                      
                                                                      if (!error && finished) {
                                                                          
                                                                          self.avatarIV.image = image;
                                                                          
                                                                          [[SDImageCache sharedImageCache]storeImage:image
                                                                                                              forKey:originUrl.absoluteString
                                                                                                          completion:nil];
                                                                          
                                                                          NSURL *thumbUrl = [NSURL URLWithString:url];
                                                                          
                                                                          [[SDImageCache sharedImageCache]storeImage:image
                                                                                                              forKey:thumbUrl.absoluteString
                                                                                                          completion:nil];
                                                                      }
//                                                                      if (error) {
//                                                                          [self.avatarIV loadUserAvatarImageWithUnionid:[UserModel sharedUserModel].uid];
//                                                                      }
                                                                  }];




    _avatarIV.userInteractionEnabled = YES;
    [_avatarIV addGestureRecognizer:_pin];
    [_avatarIV addGestureRecognizer:_pan];
}

- (void)addSubViews {
    [self.view addSubview:self.avatarIV];
}

- (void)setupNavigationItems {
    
    __weak typeof(self) weakSelf = self;
    NavigationBar *bar = [[NavigationBar alloc]initWithVC:self];
    bar.title = @"个人头像";
    bar.style = NavigationBarStyleLightContent;
    bar.rightItem = @"修改";
    bar.rightBlock = ^{
        
        [weakSelf presentToPickerController];
        
    };
    
    bar.backgroundColor = [UIColor appBlueColor];
    
    [self.view addSubview:bar];
    
    
}

- (UIButton *)rightBUtton {
    if (!_rightBUtton) {
        _rightBUtton = [BaseClassTool buttonWithFont:15 titleColor:[UIColor whiteColor] contentHorizontalAlignment:UIControlContentHorizontalAlignmentRight title:@"修改"];
        _rightBUtton.bounds = CGRectMake(0, 0, 44, 44);
        _rightBUtton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -4);
        [_rightBUtton addTarget:self action:@selector(presentToPickerController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBUtton;
}

@end
