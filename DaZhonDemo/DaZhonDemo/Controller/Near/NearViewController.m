//
//  NearViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/12.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "NearViewController.h"

@interface NearViewController ()

@end

@implementation NearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1111");
    self.navigationController.navigationBar.barTintColor = TOPIC_COLOR_ORANGE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
