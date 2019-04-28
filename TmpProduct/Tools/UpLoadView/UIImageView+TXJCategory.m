//
//  UIImageView+TXJCategory.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "UIImageView+TXJCategory.h"

@implementation UIImageView (TXJCategory)
-(void)goodsImageUrl:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"picture"]];
}
@end
