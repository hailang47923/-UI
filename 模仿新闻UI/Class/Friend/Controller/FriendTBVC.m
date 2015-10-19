//
//  FriendTBVC.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/16.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "FriendTBVC.h"
#import "DynamicOneRowCell.h"

@interface FriendTBVC ()

@end

@implementation FriendTBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubViews];
    
}

-(void)addSubViews
{
    self.searchPlaceholder = @"搜索";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

-(void)rightItemClick
{
    
}



#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DynamicOneRowCell *cell = [[DynamicOneRowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.isFrendCell = YES;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}

@end
