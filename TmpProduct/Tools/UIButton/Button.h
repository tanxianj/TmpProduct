//
//  Button.h
//  TmoProduct
//
//  Created by 谭显敬 on 2019/1/4.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(void);

@interface Button : UIButton

@property (nonatomic, copy) ButtonBlock buttonBlock;

@end
