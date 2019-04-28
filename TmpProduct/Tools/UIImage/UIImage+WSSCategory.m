//
//  UIImage+WSSCategory.m
//  消汇邦
//
//  Created by 罗建 on 2017/3/17.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "UIImage+WSSCategory.h"

@implementation UIImage (WSSCategory)

+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage*)imageWithImage:(UIImage*)image size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage*)imageWithImage:(UIImage*)image maxLength:(CGFloat)maxLength {
    
    CGSize size = image.size;
    
    if (size.width <= size.height && size.height >= maxLength) {
        size.width = size.width / size.height * maxLength;
        size.height = maxLength;
    }
    else if (size.width > size.height && size.width >= maxLength) {
        size.height = size.height / size.width * maxLength;
        size.width = maxLength;
    }
    else {
        return image;
    }
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return newImage;
}

+ (UIImage *)imagePNGInMainBundleWithImageNamed:(NSString *)name {
    return [self imageInMainBundleWithImageNamed:name type:@"png"];
}

+ (UIImage *)imageJPGInMainBundleWithImageNamed:(NSString *)name {
    return [self imageInMainBundleWithImageNamed:name type:@"jpg"];
}

+ (UIImage *)imageInMainBundleWithImageNamed:(NSString *)name type:(NSString *)type{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:type];
    return [self imageWithContentsOfFile:filePath];
}

@end
