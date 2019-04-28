//
//  TXJToslView.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/17.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^TXJToslViewLeftBtnAction)(void);
typedef void (^TXJToslViewRightBtnAction)(void);
@interface TXJToslView : UIView
@property (weak, nonatomic) IBOutlet UIButton *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (nonatomic, copy) TXJToslViewLeftBtnAction leftAction;
@property (nonatomic, copy) TXJToslViewRightBtnAction rightAction;
+(void)showToslViewWithContent:(NSString *)content leftAction:(void(^)(void))left rightAction:(void(^)(void))right;
+(void)showToslViewWithTitle:(NSString *)title content:(NSString *)content leftBtnTitle:(NSString *)leftTitle rightBtnTitle:(NSString *)rightTitle leftAction:(void(^)(void))left rightAction:(void(^)(void))right;
@end
