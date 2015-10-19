//
//  LeftMenu.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/15.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "LeftMenu.h"
#import "ListCell.h"
#import "LeftMenuFootView.h"
#import "LeftMenuHeaderView.h"

@interface LeftMenu()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) UITableView *listTableView;
@property (nonatomic, weak) LeftMenuFootView *footView;
@property (nonatomic, weak) LeftMenuHeaderView *headerView;
@end

@implementation LeftMenu

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加头部的View
        LeftMenuHeaderView *headerView = [[LeftMenuHeaderView alloc] init];
        _headerView = headerView;
        [self addSubview:headerView];
        
        //添加底部的View
        LeftMenuFootView *footerView = [[LeftMenuFootView alloc] init];
        _footView = footerView;
        [self addSubview:footerView];
        
        //添加一个tableView
        UITableView *tableview = [[UITableView alloc] init];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.backgroundColor = [UIColor clearColor];
        tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView = tableview;
        [self addSubview:tableview];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat W = self.frame.size.width;
    CGFloat footH = 40;
    _headerView.frame = CGRectMake(0, 0, W, 115);
    _listTableView.frame = CGRectMake(0, 115, W, 308);
    _footView.frame = CGRectMake(0, self.frame.size.height - footH - 20, W, footH);
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _lists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = _lists[indexPath.row];
    ListCell *cell = [[ListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = dict[@"title"];
    cell.imageView.image = [UIImage imageNamed:dict[@"imageName"]];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebar_rightarrow"]];
    if (indexPath.row == 3) {
        cell.lineIsHidden = NO;
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.degelate respondsToSelector:@selector(leftMenuDidSeletedAtRow:title:)]) {
        [self.degelate leftMenuDidSeletedAtRow:indexPath.row title:_lists[indexPath.row]];
    }
}
@end
