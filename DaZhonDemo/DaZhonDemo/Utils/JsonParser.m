//
//  JsonParser.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "JsonParser.h"
#import "BusinessInfo.h"
#import "GroupBuys.h"
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

+ (NSMutableArray *)parseGroupBuysByDic:(NSDictionary *)dic{
    NSMutableArray *groupBuys = [NSMutableArray array];
    NSArray *groupsBuysArr = [dic objectForKey:@"deals"];
    for (NSDictionary *groupBuysDic in groupsBuysArr) {
        GroupBuys *g = [[GroupBuys alloc]init];
        g.deal_id = [groupBuysDic objectForKey:@"deal_id"];
        g.title = [groupBuysDic objectForKey:@"title"];
        g.regions = [groupBuysDic objectForKey:@"regions"];
        g.current_price = [NSString stringWithFormat:@"%.1f",[[groupBuysDic objectForKey:@"current_price"]floatValue]];
        g.categories = [groupBuysDic objectForKey:@"categories"];
        g.purchase_count = [[groupBuysDic objectForKey:@"purchase_count"]integerValue];
        g.distance = [groupBuysDic objectForKey:@"distance"];
        g.image_url = [groupBuysDic objectForKey:@"image_url"];
        g.s_image_url = [groupBuysDic objectForKey:@"s_image_url"];
        g.deal_h5_url = [groupBuysDic objectForKey:@"deal_h5_url"];
        g.businesses = [groupBuysDic objectForKey:@"businesses"];
        for (NSDictionary *businessDic in g.businesses) {
            g.latitude = [businessDic objectForKey:@"latitude"];
            g.longitude = [businessDic objectForKey:@"longitude"];
        }
        g.rating_s_img_url = [groupBuysDic objectForKey:@"rating_s_img_url"];
        [groupBuys addObject:g];
    }
    return groupBuys;
}
@end
