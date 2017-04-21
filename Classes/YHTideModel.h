//
//  YHTideModel.h
//  YHWeatherDemo
//
//  Created by 刘欢庆 on 2017/4/19.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHTideModel : NSObject
@property (nonatomic,strong) NSString *latlng;
@property (nonatomic,strong) NSArray *hc;
@property (nonatomic,assign) float datum;
@end
