//
//  TXJ_JHAddressPickView.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "TXJ_JHAddressPickView.h"

@implementation TXJ_JHAddressPickView
+(void)showJHAddressPickView:(ViewController *)vc columns:(NSInteger)columns complet:(void(^)(NSDictionary *dic))complet{
   JHAddressPickView* _pickView = [[JHAddressPickView alloc] init];
    _pickView.hideWhenTapGrayView = YES;
    //    _pickView.columns = 2;    // 省市二级选择
    _pickView.columns = columns?:3;  // 省市区三级选择
    _pickView.pickBlock = ^(NSDictionary *dic) {
        if (complet) {
            complet(dic);
        }
    };
    [_pickView showInView:vc.view];
}
@end
