//
//  DianpingApi.h
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//
typedef void (^MyCallback)(id obj);
#import <Foundation/Foundation.h>

@interface DianpingApi : NSObject
//发送请求获取分类商家数据
+ (void)requestBusinessWithParams:(NSDictionary *)params AndCallback:(MyCallback)callback;
//发送请求获取团购信息
+ (void)requestGroupBuysWithParams:(NSDictionary *)params AndCallback:(MyCallback)callback;
@end
