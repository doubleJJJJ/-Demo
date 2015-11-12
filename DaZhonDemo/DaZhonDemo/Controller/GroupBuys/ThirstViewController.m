//
//  ThirstViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/12.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "ThirstViewController.h"

@interface ThirstViewController ()

@end

@implementation ThirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dataDict setObject:@[@"默认",@"价格低优先",@"价格高优先",@"购买人数多优先",@"最新发布优先"]  forKey:self.title];
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
