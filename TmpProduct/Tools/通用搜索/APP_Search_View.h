//
//  APP_Search_View.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    AppSearchTypeOne,//满减优惠
    AppSearchTypeTwo,//电子优惠券
    AppSearchTypeThree,//商品
    AppSearchTypeFour,//订单
} AppSearchType;
@protocol APP_Search_ViewDelegate <NSObject>

-(void)APP_Search_ViewWithString:(NSString *)string;

@end
@interface APP_Search_View : UIView
@property (weak, nonatomic) IBOutlet UITextField *searchTextFld;
@property (nonatomic, strong) NSString * placehodel;

/**
 1 :满减优惠 2:电子优惠券 3:商品
 */
@property (nonatomic, assign) AppSearchType searchType;
@property (nonatomic, weak) id <APP_Search_ViewDelegate> delegate;
@end
