//
//  JsonResourceTool.m
//  消汇邦
//
//  Created by 罗建 on 2017/6/23.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "JsonResourceTool.h"


@implementation JsonResourceTool


#pragma mark - 

+ (NSArray *)mainRootViewControllerInfo {
    return [self resource:@"MainRootViewControllerInfo" ofType:@"geojson"];
}

+ (NSArray *)fourRootViewControllerInfo{
    return [self resource:@"FourRootViewControllerInfo" ofType:@"geojson"];
}

#pragma mark -

+ (NSArray *)contactListControllerInfo {
    return [self resource:@"ContactListControllerInfo" ofType:@"geojson"];
}


#pragma mark -

+ (nullable id)resource:(NSString *)name ofType:(NSString *)ext {
    NSString    *filePath   = [[NSBundle mainBundle] pathForResource:name ofType:ext];
    NSData      *jsonData   = [NSData dataWithContentsOfFile:filePath];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
}


@end
