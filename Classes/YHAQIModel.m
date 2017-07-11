//
//  YHAQIModel.m
//  YHDataModelDemo
//
//  Created by 刘欢庆 on 2017/7/11.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "YHAQIModel.h"

@implementation YHAQIModel
- (instancetype)initWithData:(NSArray *)aData withGeohash:(NSString *)geohash
{
    self = [super init];
    if(self)
    {
        NSDateFormatter *_dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyyMMdd"];

        self.geohash = geohash;
        NSDate *_newDate = [_dateFormatter dateFromString:[NSString stringWithFormat:@"%@",aData.firstObject]];
        self.ts = _newDate.timeIntervalSince1970 * 1000;
        self.val = [aData.lastObject longLongValue];

    }
    return self;
}

@end
