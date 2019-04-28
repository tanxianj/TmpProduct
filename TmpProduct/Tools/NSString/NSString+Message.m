//
//  NSString+Message.m
//
//  Created on 17/3/15.
//  Copyright © 2017年. All rights reserved.
//

#import "NSString+Message.h"
#import <YYText.h>

@implementation NSString (Message)

- (NSAttributedString *)toMessageStringSender:(BOOL)isSender completed:(void (^)(BOOL))completed{
    
    NSRange stringRange = NSMakeRange(0, self.length);
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self];
    [attributeString yy_setMaximumLineHeight:21 range:stringRange];
    [attributeString yy_setFont:[UIFont systemFontOfSize:16] range:stringRange];
    [attributeString yy_setColor:isSender?[UIColor whiteColor]:[UIColor appBlackColor] range:stringRange];
    [attributeString yy_setLineBreakMode:NSLineBreakByCharWrapping range:stringRange];
    NSString *regex_emoji;
    //    NSString *pattern = @"http(s)?://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";
    if ([self rangeOfString:@"."].location != NSNotFound) {
        regex_emoji = @"\\[[a-zA-Z0-9\\/\\u4e00-\\u9fa5]+\\]|((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    }else{
        regex_emoji = @"\\[[a-zA-Z0-9\\/\\u4e00-\\u9fa5]+\\]";
    }
    
    NSError *error = nil;
    NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:regex_emoji options:NSRegularExpressionCaseInsensitive error:&error];
    if (!re) {
        WSSLog(@"[NSString toMessageString]: %@", [error localizedDescription]);
        return attributeString;
    }
    
    NSArray *resultArray = [re matchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    if (completed) {
        completed(resultArray.count);
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FaceEmoji" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *err;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
    
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:resultArray.count];
    for(NSTextCheckingResult *match in resultArray) {
        NSRange range = [match range];
        NSString *subStr = [self substringWithRange:range];
        if ([subStr hasPrefix:@"["] && [subStr hasSuffix:@"]"]) {
            
            for (NSString *emojiName in arr) {
                if ([emojiName isEqualToString:subStr]) {
                    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
                    textAttachment.image = [UIImage imageNamed:subStr];
                    textAttachment.bounds = CGRectMake(0, -4, 19, 19);
                    NSAttributedString *imageStr = [NSAttributedString yy_attachmentStringWithEmojiImage:[UIImage imageNamed:subStr] fontSize:15];
                    
                    NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
                    [imageDic setObject:imageStr forKey:@"image"];
                    [imageDic setObject:@"emoji" forKey:@"type"];
                    [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
                    [imageArray addObject:imageDic];
                }
            }
        }else{
            NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
            [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
            [imageDic setObject:@"url" forKey:@"type"];
            [imageArray addObject:imageDic];
        }
        
    }
    
    for (int i = (int)imageArray.count -1; i >= 0; i--) {
        
        NSRange range;
        [imageArray[i][@"range"] getValue:&range];
        
        NSString *type = imageArray[i][@"type"];
        
        if ([type isEqualToString:@"emoji"]) {
            [attributeString replaceCharactersInRange:range withAttributedString:imageArray[i][@"image"]];
        }else{
            [attributeString yy_setTextHighlightRange:range color:nil backgroundColor:nil tapAction:nil];
            [attributeString yy_setUnderlineColor:isSender?[UIColor whiteColor]:[UIColor appBlackColor] range:range];
            [attributeString yy_setUnderlineStyle:NSUnderlineStyleSingle range:range];
        }
    }
    return attributeString;
}



- (NSAttributedString *)toEmojiStringWithLineHeight:(CGFloat)lineHeight
                                      lineBreakMode:(NSLineBreakMode)lineBreakMode
                                               font:(UIFont *)font
                                              color:(UIColor *)color{
//    NSRange stringRange = NSMakeRange(0, self.length);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.lineBreakMode = NSLineBreakByTruncatingHead;
    style.minimumLineHeight = lineHeight;
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font,NSParagraphStyleAttributeName:style}];
    
    NSString *regex_emoji = @"\\[[a-zA-Z0-9\\/\\u4e00-\\u9fa5]+\\]";
    
    NSError *error = nil;
    NSRegularExpression *re = [NSRegularExpression regularExpressionWithPattern:regex_emoji options:NSRegularExpressionCaseInsensitive error:&error];
    
    if (!re) return attributeString;
    
    NSArray *resultArray = [re matchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, self.length)];
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:resultArray.count];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FaceEmoji" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *err;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&err];
    
    for(NSTextCheckingResult *match in resultArray) {
        NSRange range = [match range];
        NSString *subStr = [self substringWithRange:range];
  
        for (NSString *emojiName in arr) {
            if ([emojiName isEqualToString:subStr]) {
                NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
                textAttachment.image = [UIImage imageNamed:subStr];
                textAttachment.bounds = CGRectMake(0, -4, 19, 19);
                NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
                NSMutableDictionary *imageDic = [NSMutableDictionary dictionaryWithCapacity:2];
                [imageDic setObject:imageStr forKey:@"image"];
                [imageDic setObject:[NSValue valueWithRange:range] forKey:@"range"];
                
                [imageArray addObject:imageDic];
            }
        }
    }
    
    for (int i = (int)imageArray.count -1; i >= 0; i--) {
        NSRange range;
        [imageArray[i][@"range"] getValue:&range];
        [attributeString replaceCharactersInRange:range withAttributedString:imageArray[i][@"image"]];
    }
    return attributeString;

}

//- (NSMutableAttributedString *)attachmentStringWithEmojiImage:(UIImage *)image
//                                                        fontSize:(CGFloat)fontSize {
//    if (!image || fontSize <= 0) return nil;
//    
//    BOOL hasAnim = NO;
//    if (image.images.count > 1) {
//        hasAnim = YES;
//    } else if (NSProtocolFromString(@"YYAnimatedImage") &&
//               [image conformsToProtocol:NSProtocolFromString(@"YYAnimatedImage")]) {
//        NSNumber *frameCount = [image valueForKey:@"animatedImageFrameCount"];
//        if (frameCount.intValue > 1) hasAnim = YES;
//    }
//    
//    CGFloat ascent = YYTextEmojiGetAscentWithFontSize(fontSize);
//    CGFloat descent = YYTextEmojiGetDescentWithFontSize(fontSize);
//    CGRect bounding = YYTextEmojiGetGlyphBoundingRectWithFontSize(fontSize);
//    
//    YYTextRunDelegate *delegate = [YYTextRunDelegate new];
//    delegate.ascent = ascent;
//    delegate.descent = descent;
//    delegate.width = bounding.size.width + 0;
//    
//    
//    
//    YYTextAttachment *attachment = [YYTextAttachment new];
//    attachment.contentMode = UIViewContentModeScaleAspectFit;
//    attachment.contentInsets = UIEdgeInsetsMake(ascent - (bounding.size.height + bounding.origin.y), 0, descent + bounding.origin.y, 0);
//    if (hasAnim) {
//        Class imageClass = NSClassFromString(@"YYAnimatedImageView");
//        if (!imageClass) imageClass = [UIImageView class];
//        UIImageView *view = (id)[imageClass new];
//        view.frame = bounding;
//        view.image = image;
//        view.contentMode = UIViewContentModeScaleAspectFit;
//        attachment.content = view;
//    } else {
//        attachment.content = image;
//    }
//    
//    NSMutableAttributedString *atr = [[NSMutableAttributedString alloc] initWithString:YYTextAttachmentToken];
//    [atr yy_setTextAttachment:attachment range:NSMakeRange(0, atr.length)];
//    CTRunDelegateRef ctDelegate = delegate.CTRunDelegate;
//    [atr yy_setRunDelegate:ctDelegate range:NSMakeRange(0, atr.length)];
//    if (ctDelegate) CFRelease(ctDelegate);
//    
//    return atr;
//}



@end
