//
//  DianpingApi.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "DianpingApi.h"
#import <AFNetworking/AFNetworking.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "JsonParser.h"
@implementation DianpingApi
#define APP_KEY @"3042736894"
#define APP_SECRET @"a4881577162f43caaf27a67610119376"

//生成请求签名
+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params
{
    NSURL* parsedURL = [NSURL URLWithString:[baseURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:[self parseQueryString:[parsedURL query]]];
    if (params) {
        [paramsDic setValuesForKeysWithDictionary:params];
    }
    
    NSMutableString *signString = [NSMutableString stringWithString:APP_KEY];
    NSMutableString *paramsString = [NSMutableString stringWithFormat:@"appkey=%@", APP_KEY];
    NSArray *sortedKeys = [[paramsDic allKeys] sortedArrayUsingSelector: @selector(compare:)];
    for (NSString *key in sortedKeys) {
        [signString appendFormat:@"%@%@", key, [paramsDic objectForKey:key]];
        [paramsString appendFormat:@"&%@=%@", key, [paramsDic objectForKey:key]];
    }
    [signString appendString:APP_SECRET];
    unsigned char digest[20];
    NSData *stringBytes = [signString dataUsingEncoding: NSUTF8StringEncoding];
    if (CC_SHA1([stringBytes bytes],[stringBytes length],digest)) {
        /* SHA-1 hash has been calculated and stored in 'digest'. */
        NSMutableString *digestString = [NSMutableString stringWithCapacity:20];
        for (int i=0; i<20; i++) {
            unsigned char aChar = digest[i];
            [digestString appendFormat:@"%02X", aChar];
        }
        [paramsString appendFormat:@"&sign=%@", [digestString uppercaseString]];
        return [NSString stringWithFormat:@"%@://%@%@?%@", [parsedURL scheme], [parsedURL host], [parsedURL path], [paramsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    } else {
        return nil;
    }
}

+ (NSDictionary *)parseQueryString:(NSString *)query {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        
        if ([elements count] <= 1) {
            return nil;
        }
        
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}

//发送请求获取分类商家数据
+ (void)requestBusinessWithParams:(NSDictionary *)params AndCallback:(MyCallback)callback{
    NSString *cityName = [[NSUserDefaults standardUserDefaults]objectForKey:@"cityName"];
    NSMutableDictionary *allParams = [params mutableCopy];
    [allParams setObject:cityName forKey:@"city"];
    NSString *path = @"http://api.dianping.com/v1/business/find_businesses";
    path = [DianpingApi serializeURL:path params:allParams];
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manger GET:path parameters:allParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *bussinesses = [JsonParser parseBussinessByDic:dic];
        callback(bussinesses);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
        callback(nil);
    }];
}

//发送请求获得团购信息
+ (void)requestGroupBuysWithParams:(NSDictionary *)params AndCallback:(MyCallback)callback{
    NSString *cityName = [[NSUserDefaults standardUserDefaults]objectForKey:@"cityName"];
    NSMutableDictionary *allParams = [params mutableCopy];
    [allParams setObject:cityName forKey:@"city"];
    NSString *path = @"http://api.dianping.com/v1/deal/find_deals";
    path = [DianpingApi serializeURL:path params:allParams];
    
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manger GET:path parameters:allParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *groupBuys = [JsonParser parseGroupBuysByDic:dic];
        callback(groupBuys);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
        callback(nil);
    }];

}

@end
