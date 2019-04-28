//
//  NavigationBar.m
//  消汇邦
//
//  Created by Apple on 2017/6/22.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "NavigationBar.h"
#import "Button.h"

@interface NavigationBar()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, weak) UIViewController *vc;

@end

@implementation NavigationBar

- (void)buttonAction:(UIButton *)sender{
    if (sender == _leftButton) {
        if (self.leftBlock) {
            self.leftBlock();
        }else{
            //返回
            [self.vc.navigationController popViewControllerAnimated:1];
        }
    }else{
        if (self.rightBlock) {
            self.rightBlock();
        }
    }
}

- (instancetype)initWithVC:(UIViewController *)vc{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, kScreenWidth, 64 + ((ISX)?24:0));
        self.titleLabel = [BaseClassTool labelWithFont:18 textColor:[UIColor appBlackColor] textAlignment:NSTextAlignmentCenter];
        self.leftButton = [BaseClassTool buttonWithFont:15 titleColor:[UIColor whiteColor] contentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft title:nil];
        self.rightButton = [BaseClassTool buttonWithFont:15 titleColor:[UIColor whiteColor] contentHorizontalAlignment:UIControlContentHorizontalAlignmentRight title:nil];
        [self.rightButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 12)];
        [self.leftButton setContentEdgeInsets:UIEdgeInsetsMake(0, 12, 0, 0)];
        
        [self.leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(ISX?21:11);
            make.centerX.equalTo(self);
        }];
        [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel);
            make.height.mas_equalTo(44);
            make.width.mas_greaterThanOrEqualTo(64);
            make.left.equalTo(self).offset(0);
        }];
        [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel);
            make.height.mas_equalTo(44);
            make.width.mas_greaterThanOrEqualTo(64);
            make.right.equalTo(self).offset(-0);
        }];
        
        self.vc = vc;
        self.style = NavigationBarStyleDefault;
    }
    return self;
}

- (void)setStyle:(NavigationBarStyle)style{
    _style = style;
    switch (style) {
        case NavigationBarStyleDefault:
        [self.leftButton setImage:[UIImage imageNamed:@"icon_nav_back"] forState:UIControlStateNormal];
        self.titleLabel.textColor = [UIColor appBlackColor];
        [self.rightButton setTitleColor:[UIColor appBlackColor] forState:UIControlStateNormal];
        break;
        
        case NavigationBarStyleLightContent:
        [self.leftButton setImage:[UIImage imageNamed:@"icon_nav_back_white"] forState:UIControlStateNormal];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        break;
        
        default:
        [self.leftButton setImage:[UIImage imageNamed:@"icon_nav_back"] forState:UIControlStateNormal];
        self.titleLabel.textColor = [UIColor appBlackColor];
        [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        break;
    }
}

- (void)setLeftItem:(id)leftItem{
    _leftItem = leftItem;
        _leftButton.hidden = !_leftItem;
    if ([leftItem isKindOfClass:[UIImage class]]) {
        [_leftButton setImage:leftItem forState:UIControlStateNormal];
    }else{
        [_leftButton setTitle:leftItem forState:UIControlStateNormal];
    }
}

- (void)setRightItem:(id)rightItem{
    _rightItem = rightItem;
    _rightButton.hidden = !_rightItem;
    if ([rightItem isKindOfClass:[UIImage class]]) {
        [_rightButton setImage:rightItem forState:UIControlStateNormal];
    }else{
        [_rightButton setTitle:rightItem forState:UIControlStateNormal];
    }
}

- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = title;
}


@end
