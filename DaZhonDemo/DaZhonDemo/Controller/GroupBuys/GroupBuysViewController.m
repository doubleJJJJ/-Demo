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
#import "WebViewController.h"
#import "MHTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirstViewController.h"
#import <MBProgressHUD.h>
@interface GroupBuysViewController ()<MHTabBarControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *groupBuys;
@property (nonatomic,strong)NSMutableDictionary *params;
@property (nonatomic)int currentPage;
@property (nonatomic,strong)MHTabBarController *tbc;
@property (nonatomic,strong) MBProgressHUD* hud;
@end

@implementation GroupBuysViewController

- (void)subViewController:(UIViewController *)subViewController SelectedCell:(NSString *)selectedText{
    if ([subViewController.title isEqualToString:@"全部分类"]) {
        [self.params setObject:selectedText forKey:@"category"];
    }else if([subViewController.title isEqualToString:@"全部地区"]){
        [self.params setObject:selectedText forKey:@"region"];
    }else{
        int sortType = 1;
        if ([selectedText isEqualToString:@"价格低优先"]) {
            sortType = 2;
        }else if ([selectedText isEqualToString:@"价格高优先"]){
            sortType = 3;
        }else if ([selectedText isEqualToString:@"购买人数多优先"]){
            sortType = 4;
        }else if ([selectedText isEqualToString:@"最新发布优先"]){
            sortType = 5;
        }
        [self.params setObject:@(sortType) forKey:@"sort"];
    }
    [DianpingApi requestGroupBuysWithParams:self.params AndCallback:^(id obj) {
        self.groupBuys = obj;
        [self.tableView reloadData];
    }];
}

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
    //初始化指示器
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = @"正在加载....";
    self.hud.labelFont = [UIFont fontWithName:@"Arial" size:13];
    [DianpingApi requestGroupBuysWithParams:@{} AndCallback:^(id obj) {
        self.groupBuys = obj;
        [self.tableView reloadData];
        if (self.groupBuys == nil) {
            self.hud.labelText = @"加载失败";
            [self.hud hide:YES afterDelay:1];
        }else{
            self.hud.labelText = @"加载成功";
            [self.hud hide:YES afterDelay:1];
        }
    }];
    //创建顶部tabBar
    [self createTabBar];
}

- (void)createTabBar{
    //如果创建过，就不在创建
    if (self.tbc) {
        return;
    }
    self.tbc = [[MHTabBarController alloc]init];
    self.tbc.delegate = self;
    FirstViewController *first = [[FirstViewController alloc]init];
    first.title = @"全部分类";
    SecondViewController *second = [[SecondViewController alloc]init];
    second.title = @"全部地区";
    ThirstViewController *thirst = [[ThirstViewController alloc]init];
    thirst.title = @"智能排序";
    self.tbc.viewControllers = @[first,second,thirst];
    //设置为headView
    self.tableView.tableHeaderView = self.tbc.view;
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    
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
    //下拉加载更多
    if (indexPath.row == self.groupBuys.count - 1) {
        [self.params setObject:@(self.currentPage++) forKey:@"page"];
        [DianpingApi requestGroupBuysWithParams:self.params AndCallback:^(id obj) {
            [self.groupBuys addObjectsFromArray:obj];
            [self.tableView reloadData];
        }];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

#pragma tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WebViewController *webVC = [[WebViewController alloc]init];
    GroupBuys *groupBuys = self.groupBuys[indexPath.row];
    webVC.urlString = groupBuys.deal_h5_url;
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
