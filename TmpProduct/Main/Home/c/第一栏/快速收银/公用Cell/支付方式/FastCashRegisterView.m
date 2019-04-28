//
//  FastCashRegisterView.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/16.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "FastCashRegisterView.h"
#import "SelectPayTypeCollectionViewCell.h"
@interface FastCashRegisterView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic)  UICollectionView *CollectionView;
@property (weak, nonatomic) IBOutlet UIView *vieww;
@property (nonatomic, strong) NSArray * dataArray;
@end
@implementation FastCashRegisterView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = UIColor.appBackgroundColor;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _CollectionView.backgroundColor = UIColor.appBackgroundColor;
    _CollectionView.showsVerticalScrollIndicator = 0;
    _CollectionView.showsHorizontalScrollIndicator = 0;
    _CollectionView.delegate = self;
    _CollectionView.dataSource = self;
    //        _CollectionView.pagingEnabled = 1;
    [_CollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    [_CollectionView registerNib:[UINib nibWithNibName:@"SelectPayTypeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[SelectPayTypeCollectionViewCell reuseIdentifier]];
    [self.vieww addSubview:self.CollectionView];
    [self.CollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.vieww);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.CollectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    });
    
    self.dataArray = @[@{
                           @"title":@"现金",
                           @"titleSeletColor":@"#FF8757",
                           @"image":@"wallet",
                           @"selectimage":@"wallet_checked",
                           @"pay_code":@"cash"
                           },
                            @{
                           @"title":@"银行卡",
                           @"titleSeletColor":@"#E8C032",
                           @"image":@"bank card",
                           @"selectimage":@"bank card_checked",
                           @"pay_code":@"bank"
                           },@{
                           @"title":@"支付宝",
                           @"titleSeletColor":@"#02AAEE",
                           @"image":@"Alipay",
                           @"selectimage":@"Alipay_checked",
                           @"pay_code":@"alipay"
                           },@{
                           @"title":@"微信",
                           @"titleSeletColor":@"#09BB07",
                           @"image":@"WeChat 2",
                           @"selectimage":@"WeChat_checked",
                           @"pay_code":@"weixin"
                           }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.delegate &&[self.delegate respondsToSelector:@selector(FastCashRegisterViewPay_code:)]) {
            [self.delegate FastCashRegisterViewPay_code:self.dataArray[0][@"pay_code"]];
        }
    });
    
}
#pragma mark --UICollectionViewDelegateFlowLayout
//MARK:item 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kScreenWidth/4, self.bounds.size.height-38);
}
//MARK:section 间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}
//MARK:最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
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
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//MARK:定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
//MARK:每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SelectPayTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[SelectPayTypeCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
       
}


#pragma mark --UICollectionViewDelegate
//MARK:UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(FastCashRegisterViewPay_code:)]) {
        [self.delegate FastCashRegisterViewPay_code:self.dataArray[indexPath.row][@"pay_code"]];
    }
}
//MARK:返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//MARK:Heder / Footer
/*
 -(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
 //kind有两种 一种时header 一种事footer
 if (kind == UICollectionElementKindSectionHeader) {
 UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headIdentifier" forIndexPath:indexPath];
 header.backgroundColor = [UIColor yellowColor];
 return header;
 }
 return nil;
 
 }
 */

@end
