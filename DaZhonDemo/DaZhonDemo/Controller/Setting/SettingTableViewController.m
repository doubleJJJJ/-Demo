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
@interface SettingTableViewController ()<UIAlertViewDelegate>


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
            //计算缓存图片大小
            float folderSize = 0;
            folderSize+=[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
            //创建提示框
            NSString *text = [NSString stringWithFormat:@"缓存大小为%.1fM,确定要清理缓存吗？",folderSize];
            UIAlertView *clearAV = [[UIAlertView alloc]initWithTitle:@"提示" message:text delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [clearAV show];
        }else if (indexPath.row == 1){
            NSLog(@"意见反馈");
        }else{
            NSLog(@"关于我们");
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        //清理缓存图片
        [[SDImageCache sharedImageCache] clearDisk];
    }
}


@end
