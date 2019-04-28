//
//  AddShopViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ViewController.h"
#import "AddShopModel.h"

@interface AddShopViewController : ViewController
@property (nonatomic, strong) AddShopModel * addShopModel;
@property (nonatomic, assign) BOOL isEdit;
@property (nonatomic, strong) NSString * idF;
@end
