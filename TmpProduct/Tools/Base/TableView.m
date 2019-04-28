//
//  TableView.m
//  yidiankuang
//
//  Created by 谭显敬 on 2019/1/7.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "TableView.h"

#import <YYTextView.h>
@implementation TableView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame
                          style:style];
    if (self) {
        self.backgroundColor = [UIColor appBackgroundColor];
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.separatorColor = [UIColor appLineColor];
        self.separatorInset = UIEdgeInsetsMake(0, 12, 0, 0);
        self.showsVerticalScrollIndicator = NO;
        self.bounces = YES;
        self.estimatedRowHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
    }
    return self;
}


@end
