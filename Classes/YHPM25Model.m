//
//  YHPM25Model.m
//  YHDataModelDemo
//
//  Created by 刘欢庆 on 2017/7/11.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "YHPM25Model.h"

@implementation YHPM25Model

#pragma mark - 数据库模块
+ (nullable NSArray<NSString *> *)hq_propertyPrimarykeyList;
{
    return @[@"geohash",@"ts"];
}

/** 所属库名称 该字段是生成数据库的必要字段*/
+ (nonnull NSString *)hq_dbName
{
    return @"service.db";
}

@end
