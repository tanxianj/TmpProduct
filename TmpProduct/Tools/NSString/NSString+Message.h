//
//  NSString+Message.h
//
//

#import <Foundation/Foundation.h>

@interface NSString (Message)


/**
 用于YYLabel，转化表情、解析网址并添加点击事件

 @param isSender 是否是发送者、决定颜色
 @param completed 回调、是否包含表情
 @return 包含表情图片、超链接的富文本
 */
- (NSAttributedString *)toMessageStringSender:(BOOL)isSender completed:(void (^)(BOOL haveEmoji))completed ;


/**
 用于UILabel、UITextview、不可用于YYLabel（会出现图片不显示的问题，因为NSAttachment和YYAttachment不同)

 @param lineHeight
 @param lineBreakMode
 @param font
 @param color
 @return 转化为含有表情图片的富文本
 */
- (NSAttributedString *)toEmojiStringWithLineHeight:(CGFloat)lineHeight
                                      lineBreakMode:(NSLineBreakMode)lineBreakMode
                                               font:(UIFont *)font
                                              color:(UIColor *)color;

@end
