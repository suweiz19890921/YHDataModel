//
//  YHWeatherModel.m
//  YHWeatherDemo
//
//  Created by 刘欢庆 on 2017/4/19.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "YHWeatherModel.h"

@implementation YHWeatherModel

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
        if([p isEqualToString:@"geo"])
        {
            weather.geohash = aData[index];
        }
        else if([p isEqualToString:@"ts"])
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

@end
