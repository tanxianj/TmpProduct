//
//  RootViewController.m
//  TmoProduct
//
//  Created by 谭显敬 on 2019/6/23.
//  Copyright © 2019年 成都乔鸥科技有限公司. All rights reserved.
//

#import "Entrance.h"
//#import "UIColor+Hex.h"
#import "LoginAPPViewController.h"
#import "TabBarController.h"
#import "JsonResourceTool.h"


@implementation Entrance


+ (UIViewController *)mainEntrance {
    NSArray *rootTabs = [NSArray array];
    rootTabs = [JsonResourceTool mainRootViewControllerInfo];
    NSMutableArray  *controllers    = [NSMutableArray array];
    for (NSDictionary *dict in rootTabs) {
        UIViewController *vc        = [[NSClassFromString(dict[@"ClassName"]) alloc] init];
        NavigationController *nc    = [[NavigationController alloc] initWithRootViewController:vc];
        
        nc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
        nc.tabBarItem.imageInsets             = UIEdgeInsetsMake(-2, 0, 2, 0);
        
        nc.tabBarItem.title         = dict[@"title"];
        
        nc.tabBarItem.image         = [[UIImage imageNamed:dict[@"image"]]          imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nc.tabBarItem.selectedImage = [[UIImage imageNamed:dict[@"selectedImage"]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [nc.tabBarItem    setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor appBlueColor]}
                                        forState:UIControlStateSelected];
        [nc.tabBarItem    setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"0x444547"]}
                                        forState:UIControlStateNormal];
        
        [controllers addObject:nc];
    }
    TabBarController *tbc = [[TabBarController alloc] init];
    tbc.viewControllers = controllers;
    return tbc;
}

+ (UIViewController *)logonEntrance {
    
    LoginAPPViewController *vc = [[LoginAPPViewController alloc] init];
    return [[NavigationController alloc] initWithRootViewController:vc];
}



@end
