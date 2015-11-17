//
//  WebViewController.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/9.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "WebViewController.h"
#import <MBProgressHUD.h>
@interface WebViewController ()<UIWebViewDelegate>
@property (nonatomic,strong) MBProgressHUD *hud;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //把顶部的页面往上移动44点距离
    [self.webView.scrollView setContentInset:UIEdgeInsetsMake(-44, 0, 0, 0)];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
    //初始化指示器
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = @"正在加载....";
    self.hud.labelFont = [UIFont fontWithName:@"Arial" size:13];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.hud.labelText = @"加载成功";
    [self.hud hide:YES afterDelay:1];
    //[self.hud removeFromSuperview];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"%@",error);
    self.hud.labelText = @"正在加载....";
    [self.hud hide:YES afterDelay:1];
    //[self.hud removeFromSuperview];
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
