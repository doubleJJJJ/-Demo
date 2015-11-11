//
//  GroupBuysTableViewCell.h
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/11.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupBuys.h"
#import "BusinessInfo.h"
@interface GroupBuysTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *s_image;
@property (weak, nonatomic) IBOutlet UILabel *name_label;
@property (weak, nonatomic) IBOutlet UIImageView *tuan_image;
@property (weak, nonatomic) IBOutlet UIImageView *ding_image;
@property (weak, nonatomic) IBOutlet UILabel *current_price_label;
@property (weak, nonatomic) IBOutlet UILabel *review_label;
@property (weak, nonatomic) IBOutlet UILabel *description_label;
@property (weak, nonatomic) IBOutlet UILabel *region_label;
@property (weak, nonatomic) IBOutlet UILabel *distance_label;
@property (nonatomic,strong)GroupBuys *groupBuys;
@property (nonatomic,strong)BusinessInfo *business;
@end
