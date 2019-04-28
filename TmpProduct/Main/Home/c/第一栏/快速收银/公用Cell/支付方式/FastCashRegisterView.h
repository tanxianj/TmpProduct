//
//  FastCashRegisterView.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FastCashRegisterViewDeletage <NSObject>

-(void)FastCashRegisterViewPay_code:(NSString *)pay_code;

@end
@interface FastCashRegisterView : UIView
@property (nonatomic, weak) id<FastCashRegisterViewDeletage> delegate;
@end
