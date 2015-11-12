//
//  SettingTableViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/12.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "SettingTableViewController.h"
#import <UIImageView+WebCache.h>
#import <SDImageCache.h>
@interface SettingTableViewController ()


@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showImage:(UISwitch *)sender {
}

#pragma mark tableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return 3;
    }
}

#pragma mark tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSLog(@"显示图片");
    }else{
        if (indexPath.row == 0) {
            NSLog(@"清空缓存");
            [[SDImageCache sharedImageCache]cleanDisk];
            
        }else if (indexPath.row == 1){
            NSLog(@"意见反馈");
        }else{
            NSLog(@"关于我们");
        }
    }
}

+(float)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}

@end
