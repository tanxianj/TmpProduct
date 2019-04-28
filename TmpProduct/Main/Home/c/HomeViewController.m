//
//  HomeViewController.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/12.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeOneCollectionViewCell.h"
#import "HomeTwoCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic)  UICollectionView * CollectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self defaultNavigationBarSetWithTitle:@"首页"];
//    self.navcBar.leftItem = nil;
    // Do any additional setup after loading the view.
    /*
    NSArray *array = @[@"满",@"123.00元",@"减",@"123.00元"];
    NSString *str = @"";
    for (NSString *strr in array) {
        str = [NSString stringWithFormat:@"%@%@",str,strr];
        
    }
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSString *strr in array) {
     
        for (NSString * range in [self rangeOfSubString:strr inString:str]) {
            if (![tmpArray containsObject:range] ) {
                [tmpArray addObjectsFromArray:[self rangeOfSubString:strr inString:str]];
            }
        }
     
        [tmpArray addObjectsFromArray:[self rangeOfSubString:strr inString:str]];
        
    }
    NSSet *set = [NSSet setWithArray:tmpArray.copy];
    [tmpArray removeAllObjects];
    for (NSString *str in set) {
        [tmpArray addObject:str];
    }
    txjLog(@"%@",tmpArray);
    for (int i = 0; i < tmpArray.count; i++) {
        for (int j = 0; j < tmpArray.count - 1 - i;j++) {
            if ([tmpArray[j+1] rangeValue].location < [tmpArray[j]  rangeValue].location) {
                NSString * tmp = tmpArray[j] ;
                [tmpArray replaceObjectAtIndex:j withObject:tmpArray[j + 1]];
                [tmpArray replaceObjectAtIndex:j+1 withObject:tmp];
//                tmpArray[j] = tmpArray[j + 1];
//                tmpArray[j + 1] = temp;
            }
        }
    }
    NSLog(@"冒泡升序排序后结果：%@", tmpArray);
    
    NSArray *array = [@"123,12333," componentsSeparatedByString:@","];
    
    NSMutableArray *tmparray = [NSMutableArray array];
    for (NSString *str in array) {
        if (str.length) {
            [tmparray addObject:str];
        }
    }
    
    txjLog(@"array is %@",array);
    txjLog(@"tmparray is %@",tmparray);
    [tmparray removeObject:@"123"];
    txjLog(@"tmparray is %@",tmparray);
     */
    [self.listArray addObjectsFromArray:@[@{@"image":@"gift",
                                            @"title":@"优惠活动",
                                            @"ViewController":@"Discount_activity_ViewController",
                                            },
                                          @{@"image":@"check in",
                                            @"title":@"会员登记",
                                            @"ViewController":@"VIP_register_ViewController",
                                            },
                                          @{@"image":@"operation analysis",
                                            @"title":@"经营分析",
                                            @"ViewController":@"Business_analysisViewController",
                                            },
                                          @{@"image":@"commodity management",
                                            @"title":@"商品管理",
                                            @"ViewController":@"GoodsmanagerViewController",
                                            },
                                          @{@"image":@"order",
                                            @"title":@"订单管理",
                                            @"ViewController":@"OrderManagerViewController",
                                            },
                                          @{@"image":@"expectation",
                                            @"title":@"敬请期待",
                                            @"ViewController":@"",
                                            },]];
}
- (NSArray*)rangeOfSubString:(NSString*)subStr inString:(NSString*)string {
    NSMutableArray * rangeArray = [NSMutableArray array];
    NSString *string1 = [string stringByAppendingString:subStr];
    NSString *temp;/*
          for(int i =0; i < string.length; i ++) {
                    temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
                    if ([temp isEqualToString:subStr]) {
                              NSRange range = {i,subStr.length};
                              [rangeArray addObject: [NSValue valueWithRange:range]];
                        }
              }
                */
    for (int i = 0; i<string.length; i++) {
        temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject:[NSValue valueWithRange:range]];
        }
    }
    return rangeArray;
}
//MARK:初始化子视图
- (void)initializeSubViews{
    
}
//MARK:添加子视图
- (void)addSubViews{
    [self.view addSubview:self.CollectionView];
}
//MARK:设置约束
- (void)setupSubViewMargins{
    [self.CollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake((ISX?-44:-20), 0, 0, 0));
    }];
}
#pragma mark --UICollectionViewDelegateFlowLayout
//MARK:item 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(kScreenWidth, 94+(ISX?88:88));
            break;
            
        default:
            return CGSizeMake(kScreenWidth/3, kScreenWidth/3);
            break;
    }
    return CGSizeZero;
}
//MARK:section 间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}
//MARK:最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return  kOnePx;
}
//MARK:Item之间最小的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}
//MARK:Heder 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeZero;
}
//MARK:Footer 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}
#pragma mark -- UICollectionViewDataSource
//MARK:定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
//MARK:定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return section?self.listArray.count:1;
}
//MARK:每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            HomeOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HomeOneCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
            return cell;
        }break;
            
        default:{
            HomeTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[HomeTwoCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
            cell.model = self.listArray[indexPath.row];
            return cell;
        }break;
    }
}


#pragma mark --UICollectionViewDelegate
//MARK:UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section) {
        if (![UserModel sharedUserModel].token) {
            [self jumpLoginInterface];
            return;
        }
        if (![UserInfoAndShopModel sharedUserModel].shop.idField) {
            [XCToast showWithMessage:@"请先设置默认店铺！"];
            return;
        }
        [self PushToViewControllerWithVCName:self.listArray[indexPath.row][@"ViewController"] vcTitle:self.listArray[indexPath.row][@"title"]];
    }
}
//MARK:返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(UICollectionView *)CollectionView{
    if (!_CollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _CollectionView.backgroundColor = UIColor.appBackgroundColor;
        _CollectionView.showsVerticalScrollIndicator = 0;
        _CollectionView.showsHorizontalScrollIndicator = 0;
        _CollectionView.delegate = self;
        _CollectionView.dataSource = self;
        [_CollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
        [_CollectionView registerNib:[UINib nibWithNibName:@"HomeOneCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[HomeOneCollectionViewCell reuseIdentifier]];
        [_CollectionView registerNib:[UINib nibWithNibName:@"HomeTwoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[HomeTwoCollectionViewCell reuseIdentifier]];
    }
    return _CollectionView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
