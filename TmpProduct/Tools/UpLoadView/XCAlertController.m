//
//  Created by 1244 on 2017/9/11.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "XCAlertController.h"

@interface XCAlertAction()

@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, readwrite) UIAlertActionStyle style;

@end

@implementation XCAlertAction


+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(XCAlertAction *action))handler{
    if (title.length == 0) {
        NSAssert(NO, @"Title不可为空");
    }
    XCAlertAction *alertAction = [[XCAlertAction alloc]init];
    alertAction.title = title;
    alertAction.style = style;
    alertAction.handler = handler;
    return alertAction;
}

@end

@interface XCAlertController ()<
UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, readwrite) UIAlertControllerStyle preferredStyle;
@property (nonatomic, copy, readwrite) NSArray<XCAlertAction *> *actions;
@property (nonatomic, copy, readwrite) NSArray<XCAlertAction *> *cancelActions;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation XCAlertController

#pragma mark - LifeCyle



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
    
    CGFloat contentHeight = 0;
    if (self.cancelActions.count) {
        contentHeight += (10 + 44);
    }
    
    contentHeight += (44 * self.actions.count);
    
    // TODO: Title Height
    if (_message.length) {
        contentHeight += 44;
    }
    
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    
    CGRect tableFrame = CGRectMake(0, screenFrame.size.height, screenFrame.size.width, contentHeight);
    
    _tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStyleGrouped];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
    _tableView.scrollEnabled = NO;
    
    _tableView.showsVerticalScrollIndicator = 0;
    
    _tableView.showsHorizontalScrollIndicator = 0;
    
    _tableView.separatorColor = [UIColor groupTableViewBackgroundColor];
    
    _tableView.separatorInset = UIEdgeInsetsMake(0, 1, 0, 1);
    
    [self.view addSubview:_tableView];
    
    if (_message.length) {
        
        UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        header.backgroundColor = [UIColor whiteColor];
        
        //            UILabel *titleLabel = [[UILabel alloc]init];
        //            titleLabel.text = self.title;
        
        UILabel *messageLabel = [[UILabel alloc]init];
        messageLabel.font = [UIFont systemFontOfSize:13];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.text = self.message;
        
        [header addSubview:messageLabel];
        [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(header);
            make.left.equalTo(header).offset(12);
            make.right.equalTo(header).offset(-12);
        }];
        
        messageLabel.textColor = [UIColor appTextColor];
        
        _tableView.tableHeaderView = header;
        
    }




    
    // TODO: Style
    switch (_preferredStyle) {
        case UIAlertControllerStyleAlert:{
            switch (self.actions.count) {
                case 2:
                    
                    break;
                    
                default:
                    break;
            }
        }
            
            break;
            
        case UIAlertControllerStyleActionSheet:{
            
        }
            
            break;
            
        default:
            break;
    }
    
    tableFrame.origin.y -=  contentHeight;
    [UIView animateWithDuration:.22 animations:^{
        _tableView.frame = tableFrame;
    }];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cancelActions.count ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return self.cancelActions.count;
    }
    return self.actions.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return kOnePx;
    }else{
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    XCAlertAction *action = indexPath.section == 1 ? self.cancelActions[indexPath.row] : self.actions[indexPath.row];
    
    cell.textLabel.text = action.title;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor appBlackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XCAlertAction *action = indexPath.section == 1 ? self.cancelActions[indexPath.row] : self.actions[indexPath.row];
    
    [self dismissViewControllerAnimated:YES completion:^{
        if (action.handler) {
            action.handler(action);
        }
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (![touches.anyObject.view isDescendantOfView:self.tableView]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (UIView *)titleHeader{
    
    UIView *header = [[UIView alloc]init];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = self.title;
    titleLabel.numberOfLines = 0;
    
    UILabel *messageLabel = [[UILabel alloc]init];
    messageLabel.text = self.message;
    messageLabel.numberOfLines = 0;
    
    [header addSubview:titleLabel];
    [header addSubview:messageLabel];
    
    return header;
}

#pragma mark - Init Method 
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle{
    XCAlertController *alertController = [[XCAlertController alloc]initWithTitle:title message:message preferredStyle:preferredStyle];
    return alertController;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle{
    if (self = [super init]) {
        self.title = title;
        self.message = message;
        self.preferredStyle = preferredStyle;
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}



+ (void)showWithMessage:(NSString *)message
           actionsTitle:(NSArray <NSString *> *)actionsTitle
          selectedIndex:(void (^)(NSInteger index))selectedIndex{
    
    XCAlertController *alertController = [[XCAlertController alloc]init];
    alertController.title = nil;
    alertController.message = message;
    [actionsTitle enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [alertController addAction:[XCAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(XCAlertAction *action) {
            if (selectedIndex) {
                selectedIndex(idx);
            }
        }]];
    }];
    alertController.preferredStyle = UIAlertControllerStyleActionSheet;
    
    [[UIViewController getCurrentVC] presentViewController:alertController animated:YES completion:nil];
}



- (void)addAction:(XCAlertAction *)action{
    NSMutableArray *actions = [self.actions mutableCopy];
    if (action.style == UIAlertActionStyleCancel) {
        self.cancelActions = @[action];
    }else{
        [actions addObject:action];
    }
    self.actions = [actions copy];
}

- (NSArray *)actions{
    if (!_actions) {
        _actions = [NSArray array];
    }
    return _actions;
}


@end
