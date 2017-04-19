//
//  YHWeatherModel.m
//  YHWeatherDemo
//
//  Created by 刘欢庆 on 2017/4/19.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "YHWeatherModel.h"
#import "NSObject+HQDBDecode.h"
@implementation YHWeatherModel

+ (NSArray <YHWeatherModel *> *)weatherWithJSON:(NSDictionary *)json withGeohash:(NSString *)geohash
{
    NSArray *propertys = [json objectForKey:@"header"];
    NSArray *data = [json objectForKey:@"data"];
    if(propertys.count == 0 || data.count == 0 || propertys.count != data.count || geohash == nil) return nil;
    
    NSMutableArray *tws = [NSMutableArray arrayWithCapacity:data.count];
    for (NSArray *aData in data)
    {
        YHWeatherModel *weather = [YHWeatherModel new];
        weather.geohash = geohash;
        [self aDatahandler:aData propertys:propertys weather:weather];
        [tws addObject:weather];
    }
    [YHWeatherModel hq_deleteByColumns:@{@"geohash":geohash}];
    [YHWeatherModel hq_insertObjects:tws];
    return tws;
}


+ (NSArray <YHWeatherModel *> *)timeWeather:(NSString *)geohash
{
    if(geohash == nil) return nil;
    return [YHWeatherModel hq_selectByColumns:@{@"geohash":geohash}];
}

+ (NSArray <NSArray<YHWeatherModel *> *> *)dayWeather:(NSString *)geohash
{
    if(geohash == nil) return nil;
    NSArray *times = [self timeWeather:geohash];
    
    
    NSCalendar *sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    NSTimeZone *timezone = [NSTimeZone localTimeZone];
    sharedCalendar.timeZone = timezone;
    unsigned componentFlags = (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);
    
    NSInteger day = -1;
    NSMutableArray *tempArray;
    NSMutableArray *dayWeather = [NSMutableArray array];

    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval minTime = now;
    YHWeatherModel *nowWeather = nil;;

    for (YHWeatherModel *weather in times)
    {
        NSTimeInterval time = weather.ts/1000.0f;
        NSTimeInterval t = fabs(now - time);
        if(t < minTime)//判断当前时刻
        {
            minTime = t;
            nowWeather = weather;
        }
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:time];
        NSDateComponents *components = [sharedCalendar components:componentFlags fromDate:date];

        if(day == components.day)
        {
            [tempArray addObject:weather];
        }
        else
        {
            tempArray = [NSMutableArray array];
            day = components.day;
            [tempArray addObject:weather];
            [dayWeather addObject:tempArray];
        }
    }
    return dayWeather;
}


+ (void)aDatahandler:(NSArray *)aData propertys:(NSArray *)propertys weather:(YHWeatherModel *)weather
{
    NSInteger index = 0;
    for (NSString *p in propertys)
    {
        NSNumber *num = aData[index];
        if([num isEqual:[NSNull null]])
        {
            num = @(-1);
        }
        if([p isEqualToString:@"ts"])
        {
            weather.ts = [num longLongValue];
        }
        else if([p isEqualToString:@"pres"])
        {
            weather.pressure = [num floatValue];
        }
        else if([p isEqualToString:@"tmp"])
        {
            weather.temperature = [num floatValue];
        }
        else if([p isEqualToString:@"hcdc"])
        {
            weather.hcloudcover = [num floatValue];
        }
        else if([p isEqualToString:@"mcdc"])
        {
            weather.mcloudcover = [num floatValue];
        }
        else if([p isEqualToString:@"lcdc"])
        {
            weather.lcloudcover = [num floatValue];
        }
        else if([p isEqualToString:@"rh"])
        {
            weather.humidity = [num floatValue];
        }
        else if([p isEqualToString:@"mm"])
        {
            weather.precipitation = [num floatValue];
        }
        else if([p isEqualToString:@"snow"])
        {
            weather.snow = [num floatValue];
        }
        else if([p isEqualToString:@"wdir"])
        {
            weather.winddirection = [num floatValue];
        }
        else if([p isEqualToString:@"gust"])
        {
            weather.gust = [num floatValue];
        }
        else if([p isEqualToString:@"wind"])
        {
            weather.windspeed = [num floatValue];
        }
        else if([p isEqualToString:@"wave"])
        {
            weather.wave = [num floatValue];
        }
        else if(([p isEqualToString:@"tcdc"]))
        {
            weather.tcloudcover = [num floatValue];
        }
        else if([p isEqualToString:@"dirpw"])
        {
            weather.dirpw = [num floatValue];
        }
        else if([p isEqualToString:@"perpw"])
        {
            weather.perpw = [num floatValue];
        }
        else if([p isEqualToString:@"swdir1"])
        {
            weather.swdir1 = [num floatValue];
        }
        else if([p isEqualToString:@"swell1"])
        {
            weather.swell1 = [num floatValue];
        }
        else if([p isEqualToString:@"swper1"])
        {
            weather.swper1 = [num floatValue];
        }
        else if([p isEqualToString:@"swdir2"])
        {
            weather.swdir2 = [num floatValue];
        }
        else if([p isEqualToString:@"swell2"])
        {
            weather.swell2 = [num floatValue];
        }
        else if([p isEqualToString:@"swper2"])
        {
            weather.swper2 = [num floatValue];
        }
        else if([p isEqualToString:@"wvhgt"])
        {
            weather.wvhgt = [num floatValue];
        }
        else if([p isEqualToString:@"wvdir"])
        {
            weather.wvdir = [num floatValue];
        }
        else if([p isEqualToString:@"wvper"])
        {
            weather.wvper = [num floatValue];
        }
        
        index++;
    }
    
}

#pragma mark - 数据库模块
+ (nullable NSArray<NSString *> *)hq_propertyPrimarykeyList;
{
    return @[@"geohash"];
}

/** 所属库名称 该字段是生成数据库的必要字段*/
+ (nonnull NSString *)hq_dbName
{
    return @"service.db";
}
@end
