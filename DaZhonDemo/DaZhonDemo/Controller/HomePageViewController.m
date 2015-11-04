//
//  HomePageViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/4.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageHeaderView.h"
@interface HomePageViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = TOPIC_COLOR_ORANGE;
    HomePageHeaderView *headerView = [[HomePageHeaderView alloc]init];
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cells = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cells];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cells];
    }
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
