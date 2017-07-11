//
//  ViewController.m
//  YHDataModelDemo
//
//  Created by 刘欢庆 on 2017/4/19.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "ViewController.h"
#import "YHAQIModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    YHAQIModel *xx = [[YHAQIModel alloc] initWithData:@[@"20170607",@(111)] withGeohash:@"xxxxxx"];
    NSLog(@"xx");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
