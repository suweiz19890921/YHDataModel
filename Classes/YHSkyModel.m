//
//  YHSkyModel.m
//  YHDataModelDemo
//
//  Created by 刘欢庆 on 2017/7/11.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "YHSkyModel.h"

@implementation YHSkyModel

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

- (instancetype)initWithData:(NSArray *)aData withGeohash:(NSString *)geohash
{
    self = [super init];
    if(self)
    {
        self.geohash = geohash;
        self.ts = [aData.firstObject longLongValue];
        self.val = [aData.lastObject longLongValue];
    }
    return self;
}

+ (NSArray *)batchProcess:(NSArray *)datas withGeohash:(NSString *)geohash
{
    NSMutableArray *skys = [NSMutableArray arrayWithCapacity:datas.count];
    for (NSArray *array in datas)
    {
        id d =  [[self alloc] initWithData:array withGeohash:geohash];
        [skys addObject:d];
    }
    return [skys copy];
}

@end
