//
//  HomePageHeaderView.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/4.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "HomePageHeaderView.h"
@implementation HomePageHeaderView
//控件从代码中初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
        NSArray *labelText = @[@"美食",@"电影",@"酒店",@"KTV",@"购物",@"休闲娱乐",@"旅行社",@"更多"];
        for (int i = 0; i<8; i++) {
            //设置headButton
            CGFloat buttonWidth = SCREEN_WIDTH/4;
            CGFloat buttonHeight = 80;
            UIButton *headButton = [[UIButton alloc]initWithFrame:CGRectMake(i%4*buttonWidth, i/4*buttonHeight+10,buttonWidth , buttonHeight)];
            [headButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"首页_1%d",i+1]] forState:UIControlStateNormal];
            headButton.tag = i;
            [headButton addTarget: self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:headButton];
            //设置headLabel
            UILabel *headLabel = [[UILabel alloc]initWithFrame:CGRectMake(i%4*buttonWidth, i/4*buttonHeight + buttonHeight, buttonWidth, 20)];
            headLabel.text = labelText[i];
            headLabel.textAlignment = NSTextAlignmentCenter;
            headLabel.font = [UIFont fontWithName:@"Arial" size:13];
            [self addSubview:headLabel];
        }
    }
    return self;
}

- (void)clickButton:(UIButton*)button{
    NSString *category = nil;
    switch (button.tag) {
        case 0:
            category = @"美食";
            break;
        case 1:
            category = @"电影";
            break;
        case 2:
            category = @"酒店";
            break;
        case 3:
            category = @"KTV";
            break;
        case 4:
            category = @"购物";
            break;
        case 5:
            category = @"休闲娱乐";
            break;
        case 6:
            category = @"旅行社";
            break;
        case 7:
            category = @"购物";
            break;
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:@"clickCategory" object:nil userInfo:@{@"category":category}];
}

@end
