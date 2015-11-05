//
//  HomePageViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/4.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageHeaderView.h"
#import "DianpingApi.h"
#import "BusinessTableViewCell.h"
@interface HomePageViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic)NSMutableArray *businesses;
@property (nonatomic,strong) NSMutableDictionary *params;
@property (nonatomic) int currentPage;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏和headerView
    self.navigationController.navigationBar.barTintColor = TOPIC_COLOR_ORANGE;
    HomePageHeaderView *headerView = [[HomePageHeaderView alloc]init];
    self.tableView.tableHeaderView = headerView;
    //设置请求参数
    self.params = [NSMutableDictionary dictionary];
    self.currentPage = 1;
    [self.params setObject:@(self.currentPage) forKey:@"page"];
    [self.params setObject:@(20) forKey:@"limit"];
    //发送请求
    [DianpingApi requestBusinessWithParams:self.params AndCallback:^(id obj) {
        self.businesses = obj;
        [self.tableView reloadData];
    }];
    
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.businesses.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BusinessTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BusinessTableViewCell" owner:self options:nil]firstObject];
    }
    BusinessInfo *business = self.businesses[indexPath.row];
    cell.business = business;
    return cell;
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
