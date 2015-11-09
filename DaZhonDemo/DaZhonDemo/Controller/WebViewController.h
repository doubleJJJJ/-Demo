//
//  WebViewController.h
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/9.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (nonatomic,strong) NSString *urlString;
@property (nonatomic,strong) UIWebView *webView;
@end
