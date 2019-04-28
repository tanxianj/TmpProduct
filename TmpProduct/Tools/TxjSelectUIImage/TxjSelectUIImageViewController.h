//
//  TxjSelectUIImageViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TxjSelectUIImageViewController : UIViewController
@property (nonatomic, strong) void(^blackSelectImag1)(UIImage *image);
-(void)pushTZImagePickerController:(void(^)(UIImage *image))complete;
- (void)pushImagePickerController:(void(^)(UIImage *image))complete;
@end
