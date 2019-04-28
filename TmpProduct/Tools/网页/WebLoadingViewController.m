//
//  WebLoadingViewController.m
//  
//
//  Created by bang on 2018/1/17.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "WebLoadingViewController.h"
#import <WebKit/WebKit.h>
@interface WebLoadingViewController ()
@property (strong, nonatomic) WKWebView *web;
@property (strong, nonatomic) UIProgressView *loding;


@end

@implementation WebLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self defaultNavigationBarSetWithTitle:@""];
    [self.view addSubview:self.web];
    [self.view addSubview:self.loding];
    [self.web mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(ISX?88:64, 0, 0, 0));
    }];
    [self.loding mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.offset(1);
        make.top.equalTo(self.web.mas_top);
    }];
    _url = _url!=nil ? _url :@"https://www.baidu.com";
    NSLog(@"url is %@",_url);
    [_web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
//    [self.web valueForKey:@"estimatedProgress"];
    [self.web addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
//    self.loding.trackTintColor = [UIColor redColor];
    /*
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    //    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    //    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    */
}
- (void)back:(UIButton *)button {
    if ([self.web canGoBack]) {
        [self.web goBack];
    }else{
            [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        NSLog(@"change is %@",change);
        _loding.progress = [change[@"new"] floatValue];
        if ([change[@"new"] floatValue]<1) {
            _loding.hidden = NO;
        }
        else{
            _loding.hidden = YES;
            self.title = _web.title;
            self.navcBar.title = _web.title;
            NSLog(@"title  is %@",_web.title);
        }
    }
}
-(WKWebView *)web{
    if (!_web) {
        _web = [[WKWebView alloc]init];
    }
    return _web;
}
-(UIProgressView *)loding{
    if (!_loding) {
        _loding = [[UIProgressView alloc]init];
        _loding.progressTintColor = UIColor.appRedColor;
        _loding.trackTintColor = UIColor.clearColor;
    }
    return _loding;
}
-(void)dealloc{
    
    [self.web removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
