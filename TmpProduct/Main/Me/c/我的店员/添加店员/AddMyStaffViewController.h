//
//  MyStaffViewController.h
//  TmpProduct
//
//  Created by 谭显敬 on 2019/4/22.
//  Copyright © 2019年 谭显敬. All rights reserved.
//

#import "ViewController.h"
#import "AddMyStaffModel.h"

@interface AddMyStaffViewController : ViewController
@property (nonatomic, assign) NSInteger MyStaffType ;
@property (nonatomic, strong) NSString * idStr;
@property (nonatomic, strong) AddMyStaffModel * model;
@property (nonatomic, copy) void(^AddMyStaffblackSelectImag)(UIImage *image);
@end


