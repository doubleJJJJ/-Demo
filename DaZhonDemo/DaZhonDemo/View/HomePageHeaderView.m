//
//  HomePageHeaderView.m
//  DaZhonDemo
//
//  Created by doubleJJ on 15/11/4.
//  Copyright © 2015年 qingdaonews. All rights reserved.
//

#import "HomePageHeaderView.h"

@implementation HomePageHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0; i<8; i++) {
            CGFloat buttonWidth = SCREEN_WIDTH/4;
            CGFloat buttonHeight = 80;
            UIButton *headButton = [[UIButton alloc]initWithFrame:CGRectMake(i%4*buttonWidth, i/4*buttonHeight,buttonWidth , buttonHeight)];
            [headButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"首页_1%d",i+1]] forState:UIControlStateNormal];
            [self addSubview:headButton];
            self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 160);
        }
    }
    return self;
}

@end
