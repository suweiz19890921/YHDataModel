//
//  YHSkyModel.h
//  YHDataModelDemo
//
//  Created by 刘欢庆 on 2017/7/11.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHSkyModel : NSObject
@property (nonatomic, strong) NSString *geohash;
@property (nonatomic) long long ts;
@property (nonatomic) long long val;


- (instancetype)initWithData:(NSArray *)aData withGeohash:(NSString *)geohash;

+ (NSArray *)batchProcess:(NSArray *)datas withGeohash:(NSString *)geohash;
@end
