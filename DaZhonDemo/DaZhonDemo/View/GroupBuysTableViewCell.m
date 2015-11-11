//
//  GroupBuysTableViewCell.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/11.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "GroupBuysTableViewCell.h"
#import <UIImageView+AFNetworking.h>
@implementation GroupBuysTableViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.business.has_deal) {
        self.tuan_image.image = [UIImage imageNamed:@"团购_商户分类_03.png"];
    }
    if (self.business.has_online_reservation) {
        self.ding_image.image = [UIImage imageNamed:@"团购_商户分类_11.png"];
    }
    self.current_price_label.text = [self.groupBuys.current_price stringByAppendingString:@"元"];
    if (self.groupBuys.categories) {
        self.description_label.text = [self.groupBuys.categories firstObject];
    }
    self.review_label.text =[ @"已售" stringByAppendingString:[NSString stringWithFormat:@"%d",(int)self.groupBuys.purchase_count] ];
    self.distance_label.text = [[NSString stringWithFormat:@"%@",self.groupBuys.distance] stringByAppendingString:@"米"];
    self.name_label.text = self.groupBuys.title;
    [self.s_image setImageWithURL:[NSURL URLWithString:self.groupBuys.s_image_url]];
    //显示地区
    if ([self.groupBuys.regions count]>0) {
        if ([self.groupBuys.regions count] == 1) {
            self.region_label.text = [self.groupBuys.regions objectAtIndex:0];
        }else{
            self.region_label.text = @"多商区";
        }
    }
}
@end
