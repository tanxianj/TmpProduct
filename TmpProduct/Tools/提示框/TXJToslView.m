//
//  TXJToslView.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/17.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "TXJToslView.h"
@interface TXJToslView ()
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnArray;
@end
@implementation TXJToslView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self SetBtnattribute:_leftBtn Color:UIColor.appRedColor];
    [self SetBtnattribute:_rightBtn Color:UIColor.appBlueColor];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
}
-(void)SetBtnattribute:(UIButton*)btn Color:(UIColor *)color{
    [btn setTitleColor:color forState:UIControlStateNormal];
}
+(void)showToslViewWithContent:(NSString *)content leftAction:(void(^)(void))left rightAction:(void(^)(void))right{
    [TXJToslView showToslViewWithTitle:@"  提示  " content:content leftBtnTitle:@"取消" rightBtnTitle:@"确定" leftAction:left rightAction:right];
}
+(void)showToslViewWithTitle:(NSString *)title content:(NSString *)content leftBtnTitle:(NSString *)leftTitle rightBtnTitle:(NSString *)rightTitle leftAction:(void(^)(void))left rightAction:(void(^)(void))right{
    UIView *superview = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    superview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    TXJToslView * view = [[[NSBundle mainBundle] loadNibNamed:@"TXJToslView" owner:self options:nil] lastObject];
    [view.titleLab setTitle:title forState:UIControlStateNormal];
    [view.titleLab sizeToFit];
    view.contentLab.attributedText = [TXJToslView backattContentStr:content];
    [view.contentLab sizeToFit];
    [view.leftBtn  setTitle:leftTitle forState:UIControlStateNormal];
    [view.rightBtn  setTitle:rightTitle forState:UIControlStateNormal];
    [superview addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superview.mas_centerX);
        make.centerY.equalTo(superview.mas_centerY);
        make.width.offset(kScreenWidth *0.8);
    }];
    view.leftAction  = left;
    view.rightAction = right;
    UIWindow *keyWindow      = [UIApplication sharedApplication].keyWindow;
    [UIView animateWithDuration:0.1 animations:^{
        [keyWindow addSubview:superview];
    } completion:^(BOOL finished) {
        
    }];
}
- (IBAction)leftBtnAction:(id)sender {
    [self remove];
    if (self.leftAction) {
        self.leftAction();
    }
}
- (IBAction)rightBtnAction:(id)sender {
    [self remove];
    if (self.rightAction) {
        self.rightAction();
    }
}
- (void) remove {
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
    }];
}
+(NSMutableAttributedString *)backattContentStr:(NSString *)title{
    NSMutableAttributedString *attContentStr = [[NSMutableAttributedString alloc] initWithString:title];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [paragraphStyle setLineSpacing:3];
    [attContentStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [title length])];
    return attContentStr;
}
@end
