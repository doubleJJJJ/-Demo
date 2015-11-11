//
//  GroupBuysViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/11.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "GroupBuysViewController.h"
#import "DianpingApi.h"
#import "GroupBuysTableViewCell.h"
@interface GroupBuysViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *groupBuys;
@property (nonatomic,strong)NSMutableDictionary *params;
@property (nonatomic)int currentPage;
@end

@implementation GroupBuysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.params = [NSMutableDictionary dictionary];
    self.currentPage = 1;
    [self.params setObject:@(self.currentPage) forKey:@"page"];
    //设置导航栏
    self.navigationController.navigationBar.barTintColor = TOPIC_COLOR_ORANGE;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [DianpingApi requestGroupBuysWithParams:@{} AndCallback:^(id obj) {
        self.groupBuys = obj;
        [self.tableView reloadData];
    }];
}

#pragma tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.groupBuys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GroupBuysTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GroupBuysTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GroupBuysTableViewCell" owner:self options:nil]firstObject];
    }
    cell.groupBuys = self.groupBuys[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
