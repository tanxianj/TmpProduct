//
//  AddGoodsSectionHeaderView.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/19.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddGoodsSectionHeaderViewDelegate <NSObject>

-(void)AddGoodsSectionHeaderView:(NSInteger)section;

@end
@interface AddGoodsSectionHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (nonatomic, assign) NSInteger  section;
@property (nonatomic, weak) id<AddGoodsSectionHeaderViewDelegate> delegate;
@end
