//
//  AddShopFooterViewTableViewCell.m
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "AddShopFooterViewTableViewCell.h"
#import "NSString+Height.h"
@interface AddShopFooterViewTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;
@property (nonatomic, strong) NSMutableArray * listArray;
@property (nonatomic, strong) NSMutableArray * selectArray;
@property (nonatomic, assign) CGFloat heightED;
@property (nonatomic, strong) NSMutableDictionary * selectDic;
@end
@implementation AddShopFooterViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    //    _CollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [_CollectionView setCollectionViewLayout:layout];
    _CollectionView.backgroundColor = UIColor.clearColor;
    _CollectionView.showsVerticalScrollIndicator = 0;
    _CollectionView.showsHorizontalScrollIndicator = 0;
    _CollectionView.delegate = self;
    _CollectionView.dataSource = self;
    _CollectionView.scrollEnabled = NO;
    _CollectionView.allowsMultipleSelection = NO;
    //        _CollectionView.pagingEnabled = 1;
    [_CollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    [_CollectionView registerNib:[UINib nibWithNibName:@"AddShopFooterViewCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[AddShopFooterViewCollectionViewCell reuseIdentifier]];
//    [self loadData];
}
-(void)loadData{
   
     
    if (!YES) {
    [self.listArray addObjectsFromArray:@[@{
                                              @"id": @1,
                                              @"label_name": @"空调",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },
                                          @{
                                              @"id": @2,
                                              @"label_name": @"空调空调空调空调空调空调",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },
                                          @{
                                              @"id": @3,
                                              @"label_name": @"空调",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },
                                          @{
                                              @"id": @4,
                                              @"label_name": @"空调",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },@{
                                              @"id": @5,
                                              @"label_name": @"空调",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },@{
                                              @"id": @6,
                                              @"label_name": @"空调",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },@{
                                              @"id": @7,
                                              @"label_name": @"空调",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },
                                          @{
                                              @"id": @8,
                                              @"label_name": @"wifiwifiwifiwifiwifi",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },
                                          @{
                                              @"id": @9,
                                              @"label_name": @"wifiwifiwifiwifiwifi",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },@{
                                              @"id": @10,
                                              @"label_name": @"wifiwifiwifiwifiwifi",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },@{
                                              @"id": @11,
                                              @"label_name": @"wifiwifiwifiwifiwifi",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },@{
                                              @"id": @12,
                                              @"label_name": @"wifiwifiwifiwifiwifi",
                                              @"type": @2,
                                              @"label_color": @"",
                                              @"desc": @"",
                                              @"created_at": @""
                                              },]];
    }else{
        [[HTTPSessionManager sharedManager] listPOST:@"/api/manager/getlabel" page:1 parameters:@{@"type":_tagsType,@"pagesize":@"100"} callBack:^(ListModel *responseModel, id responseObject) {
            if (responseModel.status == 200) {
                [self.listArray addObjectsFromArray:responseModel.data.data];
                [UIView performWithoutAnimation:^{
                    [self.CollectionView reloadData];
                    [self.CollectionView layoutIfNeeded];
                }];
            }
        }];
    }
    [UIView performWithoutAnimation:^{
        [self.CollectionView reloadData];
        [self.CollectionView layoutIfNeeded];
    }];
    
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//MARK:item 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([NSString getWidth_With_height:20 String:[[AddShopTageModel alloc]initWithDictionary:self.listArray[indexPath.row]].label_name FontSize:10]+10, 20);
}
//MARK:section 间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 0, 5, 0);
}
//MARK:最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//MARK:Item之间最小的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
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
    return 1;
}
//MARK:定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.listArray.count;
}
//MARK:每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AddShopFooterViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AddShopFooterViewCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.model = [[AddShopTageModel alloc]initWithDictionary:self.listArray[indexPath.row]];
    NSString *cellidStr = [NSString stringWithFormat:@"%@",cell.model.idField];
    //MARK:包含就设为选中样式
    if ([self.selectArray containsObject:cellidStr]) {
        cell.contentView.backgroundColor = UIColor.appBlueColor;
        cell.titleLab.textColor = UIColor.whiteColor;
    //MARK:不包含就设为未选中样式
    }else{
        cell.contentView.backgroundColor =UIColor.whiteColor ;
        cell.titleLab.textColor = UIColor.appBlueColor;
    }
    cell.contentView.layer.masksToBounds = YES;
    cell.contentView.layer.cornerRadius = 10;
    cell.contentView.layer.borderWidth = kOnePx;
    cell.contentView.layer.borderColor = UIColor.appBlueColor.CGColor;

    
    [self updateCollectionViewHeight:self.CollectionView.collectionViewLayout.collectionViewContentSize.height];
    return cell;
}
- (void)updateCollectionViewHeight:(CGFloat)height {
    if (self.heightED != height) {
        self.heightED = height;
        self.CollectionView.frame = CGRectMake(0, 0, self.CollectionView.frame.size.width, height);
        
        if (_delegate && [_delegate respondsToSelector:@selector(updateTableViewCellHeight:andheight:andIndexPath:)]) {
            [self.delegate updateTableViewCellHeight:self andheight:height andIndexPath:self.indexPath];
        }
    }
}

#pragma mark --UICollectionViewDelegate
//MARK:UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     AddShopFooterViewCollectionViewCell *cell = (AddShopFooterViewCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
   
    NSString *idstr = [NSString stringWithFormat:@"%@",cell.model.idField];
    //MARK:不包含就添加
        if (![self.selectArray containsObject:idstr]) {
            [self.selectArray addObject:idstr];
    //MARK:包含就删掉
        }else{
             [self.selectArray removeObject:idstr];
        }
    
    [UIView performWithoutAnimation:^{
        [self.CollectionView reloadData];
    }];
    
    if ([self.delegate respondsToSelector:@selector(didSelectItemAtIndexPath:withContent:)]) {
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSString *str in self.selectArray) {
            if (str.length) {
                [tmpArray addObject:str];
            }
        }
        [self.delegate didSelectItemAtIndexPath:self.indexPath withContent:tmpArray.copy];
    }
}

//MARK:返回这个UICollectionView是否可以被选择
#pragma mark - 返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}
-(NSMutableDictionary *)selectDic{
    if (!_selectDic) {
        _selectDic = [NSMutableDictionary dictionary];
    }
    return _selectDic;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.CollectionView.frame = CGRectMake(0, 0, self.CollectionView.frame.size.width, self.CollectionView.collectionViewLayout.collectionViewContentSize.height);
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
//-(CGFloat)cellHeight{
//    CGFloat height = self.CollectionView.collectionViewLayout.collectionViewContentSize.height;
//    return height;
//}
-(void)setTagsType:(NSString *)tagsType{
    _tagsType = tagsType;
    [self loadData];
}
-(void)setServerData:(NSArray *)ServerData{
    _ServerData = ServerData;
    txjLog(@"ServerData is %@",_ServerData);
    for (NSDictionary *dic in _ServerData) {
        AddShopTageModel * tmpmodel = [[AddShopTageModel alloc]initWithDictionary:dic];
        NSString *tmpid = [NSString stringWithFormat:@"%@",tmpmodel.idField];
        if (![tmpid isEqualToString:@"[]"]) {
            [self.selectArray addObject:tmpid];
        }
        
    }
    
    
}
-(NSMutableArray *)selectArray{
    if (!_selectArray) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
@interface AddShopFooterViewCollectionViewCell ()

@end
@implementation AddShopFooterViewCollectionViewCell
-(void)awakeFromNib{
    [super awakeFromNib];
}
-(void)setModel:(AddShopTageModel *)model{
    _model = model;
    _titleLab.text = _model.label_name;
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
//    self.contentView.backgroundColor =selected?UIColor.appBlueColor:UIColor.whiteColor;
//    self.titleLab.textColor = selected?UIColor.whiteColor:UIColor.appBlueColor;
}
@end
