//
//  SelectCityViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/9.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "SelectCityViewController.h"
#import "pinyin.h"
@interface SelectCityViewController ()
@property (nonatomic,strong) NSMutableDictionary *cityDic;
@property (nonatomic,strong) NSArray *allKeys;
@end

@implementation SelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityDic = [NSMutableDictionary dictionary];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"citys" ofType:@"plist"];
    NSArray *citys = [NSArray arrayWithContentsOfFile:path];
    
    for (NSString *cityName in citys) {
        char firstLetter = pinyinFirstLetter([cityName characterAtIndex:0]);
        NSString *key = [NSString stringWithFormat:@"%c",firstLetter];
        NSMutableArray *newCitys = [self.cityDic objectForKey:key];
        //根据key创建首字母数组(一个key对应一个数组)，如果存在，则直接添加城市名
        if (newCitys == nil) {
            newCitys = [NSMutableArray array];
            [self.cityDic setObject:newCitys forKey:key];
        }
        [newCitys addObject:cityName];
    }
    self.allKeys = [self.cityDic.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
}

#pragma tableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cityDic.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = self.allKeys[section];
    NSArray *citys = [self.cityDic objectForKey:key];
    return citys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *key = self.allKeys[indexPath.section];
    NSArray *citys = [self.cityDic objectForKey:key];
    
    NSString *cityName = citys[indexPath.row];
    cell.textLabel.text = cityName;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.allKeys[section];
}
//添加索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.allKeys;
}

#pragma tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *key = self.allKeys[indexPath.section];
    NSArray *citys = [self.cityDic objectForKey:key];
    NSString *cityName = citys[indexPath.row];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:cityName forKey:@"cityName"];
    [ud synchronize];
    [self.navigationController popToRootViewControllerAnimated:YES];
//  [[NSNotificationCenter defaultCenter]postNotificationName:@"cityChange" object:nil userInfo:@{@"cityName":cityName}];
    
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
