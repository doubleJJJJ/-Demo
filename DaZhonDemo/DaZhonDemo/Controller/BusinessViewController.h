//
//  BusinessViewController.h
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusinessViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSString *category;
@end
