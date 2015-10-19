//
//  SettingTBVC.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/19.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "SettingTBVC.h"
#import "TLUIHelper.h"
#import "TLFounctionCell.h"
@interface SettingTBVC ()
@property (nonatomic ,strong) NSMutableArray *datas;
@end

@implementation SettingTBVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubViews];
}

-(void)addSubViews
{
    self.title = @"设置";
    _datas = [TLUIHelper getSettingItems];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.tableView.tableHeaderView = headerView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _datas.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TLSettingGrounp *group = _datas[section];
    return group.itemsCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingGrounp *group = _datas[indexPath.section];
    TLSettingItem *item = [group itemAtIndex:indexPath.row];
    static NSString *ID = @"setting";
    TLFounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TLFounctionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    [cell setItem:item];
    [cell setTitleFontSize:13];
    [cell setSubTitleFontSize:13];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] :[cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else {
        return 20;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
