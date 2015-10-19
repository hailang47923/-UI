//
//  LNewsVC.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/15.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "LNewsVC.h"

@interface LNewsVC ()

@end

@implementation LNewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self buildUI];
}

-(void)buildUI
{
    self.view.backgroundColor = [UIColor redColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 50, 50, 50);
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick
{
    UIViewController *VC = [[UIViewController alloc] init];
    VC.title = @"SS";
    VC.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:VC animated:YES];
}


@end
