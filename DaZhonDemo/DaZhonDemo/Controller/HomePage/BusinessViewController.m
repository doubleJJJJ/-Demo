//
//  BusinessViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/5.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "BusinessViewController.h"
#import "BusinessTableViewCell.h"
#import "DianpingApi.h"
#import "WebViewController.h"
@interface BusinessViewController ()
@property (nonatomic,strong)NSMutableArray *business;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableDictionary *params;
@property (nonatomic) NSInteger page;
@end

@implementation BusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.params = [NSMutableDictionary dictionary];
    [self.params setObject:@(1) forKey:@"page"];
    [self.params setObject:self.category forKey:@"category"];
    [DianpingApi requestBusinessWithParams:self.params AndCallback:^(id obj) {
        self.business = obj;
        [self.tableView reloadData];
    }];
}

#pragma tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.business.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BusinessTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"BusinessTableViewCell" owner:self options:nil]firstObject];
    }
    if (self.business.count -1 == indexPath.row) {
        [self.params setObject:@(++self.page) forKey:@"page"];
        [DianpingApi requestBusinessWithParams:self.params AndCallback:^(id obj) {
            [self.business addObjectsFromArray:obj];
            [self.tableView reloadData];
        }];
    }
    cell.business = self.business[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

#pragma tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessInfo *business = self.business[indexPath.row];
    WebViewController *webVC = [[WebViewController alloc]init];
    webVC.urlString = business.business_url;
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
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
