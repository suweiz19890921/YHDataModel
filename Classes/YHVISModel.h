//
//  YHVISModel.h
//  YHDataModelDemo
//
//  Created by 刘欢庆 on 2017/7/11.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "YHSkyModel.h"

@interface YHVISModel : NSObject
@property (nonatomic, strong) NSString *geohash;
@property (nonatomic) long long ts;
@property (nonatomic) long long val;
@end
