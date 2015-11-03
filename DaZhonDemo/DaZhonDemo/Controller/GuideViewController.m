//
//  GuideViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/3.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    //设置contentsize
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    //将所有图片以子视图的方式添加到scrollView
    for (int i = 0; i<3; i++) {
        UIImageView *guideView = [[UIImageView alloc]initWithFrame:CGRectMake(scrollView.frame.size.width * i, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
        NSString *imageName = [NSString stringWithFormat:@"引导页－%d.jpg",i+1];
        guideView.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:guideView];
    }
    //设置scrollView
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    //为最后一屏添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(scrollView.frame.size.width*2, 0, scrollView.frame.size.width, scrollView.frame.size.height);
    [button addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button];
}

- (void)enter{
    [self.view removeFromSuperview];
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
