//
//  JsonParser.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "JsonParser.h"
#import "BusinessInfo.h"
@implementation JsonParser
+ (NSMutableArray *)parseBussinessByDic:(NSDictionary *)dic{
    NSMutableArray *business = [NSMutableArray array];
    NSArray *businessArr = [dic objectForKey:@"businesses"];
    for (NSDictionary *businessDic in businessArr) {
        BusinessInfo *b = [[BusinessInfo alloc]init];
        b.name = [businessDic objectForKey:@"name"];
        b.city = [businessDic objectForKey:@"caity"];
        b.latitude = [[businessDic objectForKey:@"latitude"]floatValue];
        b.longitude = [[businessDic objectForKey:@"longitude"]floatValue];
        b.avg_rating = [[businessDic objectForKey:@"avg_rating"]floatValue];
        b.rating_img_url = [businessDic objectForKey:@"rating_img_url"];
        b.rating_s_img_url = [businessDic objectForKey:@"rating_s_img_url"];
        
        b.avg_price = [[businessDic objectForKey:@"avg_price"]intValue];
        b.business_url = [businessDic objectForKey:@"business_url"];
        b.photo_url = [businessDic objectForKey:@"photo_url"];
        b.s_photo_url = [businessDic objectForKey:@"s_photo_url"];
        b.has_coupon = [[businessDic objectForKey:@"has_copon"]intValue];
        
        b.coupon_description = [businessDic objectForKey:@"coupon_description"];
        b.has_deal = [[businessDic objectForKey:@"has_deal"]intValue];
        b.deal_count = [[businessDic objectForKey:@"deal_count"]intValue];
        b.deals = [businessDic objectForKey:@"deals"];
        b.has_online_reservation = [[businessDic objectForKey:@"has_online_reservation"]intValue];
        b.online_reservation_url = [businessDic objectForKey:@"online_reservation_url"];
        [business addObject:b];
    }
    return business;
}
@end
