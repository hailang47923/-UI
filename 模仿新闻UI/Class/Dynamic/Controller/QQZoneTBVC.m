//
//  QQZoneTBVC.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/20.
//  Copyright © 2015年 林海. All rights reserved.
//

#define HeaderViewH 250

#import "QQZoneTBVC.h"
#import "QQZoneTopView.h"
#import "UIImage+UIColor.h"
#import "QQZoneHeaderView.h"

@interface QQZoneTBVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) QQZoneTopView *topView;
@property (nonatomic, weak) QQZoneHeaderView *headerView;
@end


@implementation QQZoneTBVC
#pragma mark - 懒加载
-(QQZoneTopView *)topView
{
    if (!_topView) {
        _topView = [[QQZoneTopView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
        [[UIApplication sharedApplication].keyWindow addSubview:_topView];
    }
    return _topView;
}

#pragma mark - 初始化
-(void)viewDidLoad
{
    [super viewDidLoad];

    [self buildUI];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, 1) colorWithAlphaComponent:1]] forBarMetrics:UIBarMetricsDefault];
}

-(void)buildUI
{
    self.title = @"好友动态";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, 0) colorWithAlphaComponent:0]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, 0) colorWithAlphaComponent:0]]];
    
    
    UITableView *myTBV = [[UITableView alloc] init];
    myTBV.contentInset = UIEdgeInsetsMake(HeaderViewH, 0, 0, 0);
    myTBV.frame = CGRectMake(0, -64, self.view.frame.size.width, self.view.frame.size.height + 64);
    myTBV.delegate = self;
    myTBV.dataSource = self;
    [self.view addSubview:myTBV];
    
    QQZoneHeaderView *headerView = [[QQZoneHeaderView alloc] init];
    headerView.frame = CGRectMake(0, -HeaderViewH, screen_Widht, HeaderViewH);
    _headerView = headerView;
    [myTBV addSubview:headerView];
    
    //添加头部view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Height, 15.0f)];
    view.backgroundColor = [UIColor grayColor];
    [myTBV setTableHeaderView:view];
}

-(void)rightItemClick
{
    [self.topView show];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"ss";
    //cell.backgroundColor = [UIColor blackColor];
    return cell;
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    
    //拉伸头部的view的高度
    if (offset < -264) {
        _headerView.frame = CGRectMake(0, 0, screen_Widht, offset);
    }
    
    //渐变导航栏
    if (offset < 0) {
        CGFloat alpha= 1 / offset * (-10);
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, alpha) colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
        //注释这行 导航栏下面会有一个分割线
        [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, alpha) colorWithAlphaComponent:alpha]]];
    }else{
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, 1) colorWithAlphaComponent:1]] forBarMetrics:UIBarMetricsDefault];
    }
}
@end
