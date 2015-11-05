//
//  BusinessTableViewCell.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "BusinessTableViewCell.h"
#import <UIImageView+AFNetworking.h>
@implementation BusinessTableViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.avg_price.text = [[NSString stringWithFormat:@"%ld",self.business.avg_price]stringByAppendingString:@"元"];
    self.name.text = self.business.name;
    if (0 == self.business.has_coupon) {
        self.coupon_description.text = @"无优惠信息";
    }else{
        self.coupon_description.text = self.business.coupon_description;
    }
    self.deal_count.text = [@"已售" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)self.business.deal_count]];
    [self.s_photo setImageWithURL:[NSURL URLWithString:self.business.s_photo_url]];}

@end
