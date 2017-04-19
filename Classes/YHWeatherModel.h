//
//  YHWeatherModel.h
//  YHWeatherDemo
//
//  Created by 刘欢庆 on 2017/4/19.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHWeatherModel : NSObject
@property (nonatomic, strong) NSString *geohash;
@property (nonatomic) long long ts;
@property (nonatomic) float winddirection; // 风向,  "184,178,161 ..."
@property (nonatomic) float windspeed; // 风速（默认是 节）,  "4.5,4.4 ..."
@property (nonatomic) float gust; // 阵风（默认是 节）,  "6.1,6.2 ..."
@property (nonatomic) float precipitation; // 降水量(mm/3h) "0,0,0.1 ..."
@property (nonatomic) float pressure;   // 气压(ph)   "12,12.5,13.9 ..."
@property (nonatomic) float temperature;// 气温(C)    "12,12.9,16.6 ..."
@property (nonatomic) float humidity;  // 湿度(%)        "96,96,88 ..."
@property (nonatomic) float tcloudcover;// 总云量(%)     "52,50,94 ..."
@property (nonatomic) float lcloudcover;// 低空云量(%)    "0,1,13 ..."
@property (nonatomic) float mcloudcover;// 中层云量(%)     "0,0,4 ..."
@property (nonatomic) float hcloudcover;// 高空云量(%)     "52,46,88 ..."
@property (nonatomic) float wave;//综合浪高
@property (nonatomic) float dirpw;//综合浪方向
@property (nonatomic) float perpw;//综合浪周期
@property (nonatomic) float swdir1;//一级涌浪方向
@property (nonatomic) float swell1;//一级涌浪高
@property (nonatomic) float swper1;//一级涌浪周期
@property (nonatomic) float swdir2;//二级涌浪方向
@property (nonatomic) float swell2;//二级涌浪高
@property (nonatomic) float swper2;//二级涌浪周期
@property (nonatomic) float wvhgt;//风浪高度
@property (nonatomic) float wvdir;//风浪方向
@property (nonatomic) float wvper;//风浪周期
@property (nonatomic) float snow;//降雪量

/** 解析天气的JSON数据
 *  JSON数据格式
 *  {
 *   header:[ts,tmp,gust,wind...]
 *   data:[时间戳,12,184,4.5...]
 *  }
 */
+ (NSArray <YHWeatherModel *> *)weatherWithJSON:(NSDictionary *)json withGeohash:(NSString *)geohash;

+ (NSArray <YHWeatherModel *> *)timeWeather:(NSString *)geohash;

+ (NSArray <NSArray<YHWeatherModel *> *> *)dayWeather:(NSString *)geohash;

@end
