//
//  BusinessTableViewCell.h
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessInfo.h"
@interface BusinessTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *s_photo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *coupon_description;
@property (weak, nonatomic) IBOutlet UILabel *avg_price;
@property (weak, nonatomic) IBOutlet UILabel *deal_count;
@property (nonatomic,strong) BusinessInfo *business;
@end
