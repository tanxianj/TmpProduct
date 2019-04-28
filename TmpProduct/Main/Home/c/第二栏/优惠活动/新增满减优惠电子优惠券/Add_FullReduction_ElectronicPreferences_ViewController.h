//
//  Add_FullReduction_ElectronicPreferences_ViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/18.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ViewController.h"
#import "AddOneModel.h"
#import "AddTwoModel.h"
typedef enum : NSUInteger {
    AddTypeOne,//满减优惠
    AddTypeTwo,//电子优惠券
} AddType;
typedef enum : NSUInteger {
    NewOrEditTypeNew,
    NewOrEditTypeEdit,
} NewOrEditType;
@interface Add_FullReduction_ElectronicPreferences_ViewController : ViewController
@property (nonatomic, assign) AddType type;
@property (nonatomic, strong) NSString * idF;//用于编辑
@property (nonatomic, assign) NewOrEditType newOrEdit;
@property (nonatomic, strong) AddOneModel * addOneModel;
@property (nonatomic, strong) AddTwoModel * addTwoModel;
@end
