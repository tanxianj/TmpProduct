//
//  UIImage+WSSCategory.h
//  消汇邦
//
//  Created by 罗建 on 2017/3/17.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WSSCategory)

+ (UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size;
+ (UIImage *)imageWithImage:(UIImage*)image size:(CGSize)size;
+ (UIImage *)imageWithImage:(UIImage*)image maxLength:(CGFloat)maxLength;

+ (UIImage *)imagePNGInMainBundleWithImageNamed:(NSString *)name;
+ (UIImage *)imageJPGInMainBundleWithImageNamed:(NSString *)name;

@end
