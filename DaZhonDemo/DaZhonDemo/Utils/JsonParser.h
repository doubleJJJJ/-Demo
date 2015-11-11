//
//  JsonParser.h
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParser : NSObject
//解析首页
+ (NSMutableArray *)parseBussinessByDic:(NSDictionary *)dic;
//解析团购
+ (NSMutableArray *)parseGroupBuysByDic:(NSDictionary *)dic;
@end
