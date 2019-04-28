//
//  NSString+Height.m
//  消汇邦
//
//  Created by 1244 on 2017/7/19.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "NSString+Height.h"

@implementation NSString (Height)

+ (CGFloat)heightForString:(NSString*)string fontSize:(NSInteger)fontSize width:(CGFloat)width headerIndent:(CGFloat)headerIndent{
    return [self heightForString:string fontSize:fontSize width:width headerIndent:0 lineHeight:fontSize + 5];
}

+ (CGFloat)heightForString:(NSString*)string fontSize:(NSInteger)fontSize width:(CGFloat)width headerIndent:(CGFloat)headerIndent lineHeight:(CGFloat)lineHeight{
    NSMutableParagraphStyle *style =[[NSMutableParagraphStyle alloc]init];
    style.minimumLineHeight = lineHeight;
    if (headerIndent > 0) {
        style.firstLineHeadIndent = headerIndent;
    }
    if (string.length == 0) {
        return 0;
    }
    NSAttributedString *temp = [[NSAttributedString alloc]initWithString:string attributes:@{
                                                                                             NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                                                                             NSParagraphStyleAttributeName:style}];
    
    return [temp boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.height;
    
}

- (NSAttributedString *)stringWithHeightForFontSize:(NSInteger)fontSize{
    if (self.length == 0) {
        return nil;
    }
    NSMutableParagraphStyle *style =[[NSMutableParagraphStyle alloc]init];
    style.minimumLineHeight = fontSize + 5;
    NSAttributedString *temp = [[NSAttributedString alloc]initWithString:self attributes:@{
                                                                                           NSFontAttributeName:[UIFont systemFontOfSize:fontSize],
                                                                                           NSParagraphStyleAttributeName:style}];
    
    return temp;
    
}


- (CGFloat)zcl_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width {
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
    
    return ceil(textSize.height);
}

- (CGFloat)zcl_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing {
    UIFont *textFont = font ? font : [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGSize textSize;
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.lineSpacing  = lineSpacing;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                  options:(NSStringDrawingUsesLineFragmentOrigin |
                                           NSStringDrawingTruncatesLastVisibleLine)
                               attributes:attributes
                                  context:nil].size;
    
    return ceil(textSize.height);
}
//得到宽度传入高度
+(CGFloat)getWidth_With_height:(CGFloat)height String:(NSString *)string FontSize:(CGFloat)fontSize{
    NSDictionary * dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    /*计算宽度时要确定高度*/
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0,height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width+10;
}
//得到高度传入宽度
+(CGFloat)getHeight_With_Width:(CGFloat)width String:(NSString *)string FontSize:(CGFloat)fontSize{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    /*计算高度要先指定宽度*/
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width,0) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height+10;
}

@end
