//
//  UIColor+AppColors.m
//  TmoProduct
//
//  Created by 1244 on 2019/8/14.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "UIColor+AppColors.h"


@implementation UIColor (AppColors)

+ (UIColor *)appBackgroundColor{
    //F4F5F7
    return [UIColor colorWithHexString:@"#F4F5F9"];
}
+ (UIColor *)appBlackDescColor{
    return [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0/1.0];
}
+(UIColor *)appGreenColor{
    return [UIColor colorWithHexString:@"11B68B"];
}
+(UIColor *)appYellowColor{
    
    return [UIColor colorWithHexString:@"#FF8757"];
}
+(UIColor *)appBlueColor{
    return [UIColor colorWithHexString:@"#3D6CDE"];
}
+(UIColor *)appBlueDescColor{
    return [UIColor colorWithHexString:@"#3FACFD"];
}
+ (UIColor *)appBlackColor{
    return [UIColor colorWithRed: 43/255.0 green: 44/255.0 blue: 46/255.0 alpha:1.0/1.0];
}
+(UIColor *)appRedColor{
    return [UIColor colorWithHexString:@"#FB5771"];
}
+(UIColor *)appLineColor{
    return [UIColor colorWithHexString:@"#EFEFF4"];
}
+(UIColor *)appTextColor{
    return [UIColor colorWithHexString:@"#333333"];
}
+(UIColor *)appTextDescColor{
    return [UIColor colorWithHexString:@"#666666"];
}
+(UIColor *)appTextDescTwoColor{
    return [UIColor colorWithHexString:@"#999999"];
}
+ (UIColor *)appWhiteDisableColor{
    return [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.7/1.0];
}
+ (UIColor *)appColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha/1.0];
}
+ (UIColor *)arc4randomColor{
    return [UIColor colorWithRed:arc4random() % 255/255.0 green:arc4random() % 255/255.0 blue:arc4random() % 255/255.0 alpha:1.0];
}
@end
