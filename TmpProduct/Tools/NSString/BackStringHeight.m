//
//  BackStringHeight.m
//  消汇邦
//
//  Created by bang on 2018/4/3.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import "BackStringHeight.h"

@implementation BackStringHeight
#pragma mark - 根据字符串计算label高度
+ (CGFloat)getHeightLineWithString:(NSString *)string withWidth:(CGFloat)width withFont:(UIFont *)font LableLineHeight:(CGFloat )lineheight{
    
    //1.1最大允许绘制的文本范围
    CGSize size = CGSizeMake(width, 2000);
    //1.2配置计算时的行截取方法,和contentLabel对应
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineSpacing:lineheight];
    //1.3配置计算时的字体的大小
    //1.4配置属性字典
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style};
    //2.计算
    //如果想保留多个枚举值,则枚举值中间加按位或|即可,并不是所有的枚举类型都可以按位或,只有枚举值的赋值中有左移运算符时才可以
    CGFloat height = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size.height;
//    [string containsString:@"\n"];
//    NSArray *array = [string componentsSeparatedByString:@"\n"];
//    XSYLogDebug(@"换行的次数%li",array.count-1);
    
#ifdef DEBUG
    
#endif
    NSMutableAttributedString *Mutablestring = [[NSMutableAttributedString alloc]initWithString:string];
    Mutablestring.yy_font = font;
    //计算文字高度
    YYTextLinePositionSimpleModifier *modifier = [[YYTextLinePositionSimpleModifier alloc]init];
    modifier.fixedLineHeight = 17;
    
    YYTextContainer *container = [[YYTextContainer alloc]init];
    container.linePositionModifier = modifier;
    container.size = CGSizeMake(width, MAXFLOAT);
    
    YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:Mutablestring];
    
    
    height = layout.textBoundingSize.height;
//    height-=(array.count-1)*17;
//    XSYLogDebug(@"height is %f",height);
    return height;
}

@end
