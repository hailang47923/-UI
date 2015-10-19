//
//  DynamicTBVC.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/16.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "DynamicTBVC.h"
#import "DynamicOneRowCell.h"
#import "TLUIHelper.h"
#import "TLFounctionCell.h"

@interface DynamicTBVC ()
@property (nonatomic,strong) UISearchController *searchVC;
@property (nonatomic,strong) NSMutableArray *datas;
@end

@implementation DynamicTBVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addSubViews];
    
    [self initTestData];
}

#pragma mark - 初始化
-(void)addSubViews
{
    self.searchPlaceholder = @"搜索电源/音乐/商品...";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStyleDone target:self action:@selector(rithtItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.tableView.backgroundColor = QQColor(247, 247, 247);
}

-(void)rithtItemClick
{
    
}

-(void)initTestData
{
    _datas = [TLUIHelper getDynamicItems];
    [self.tableView reloadData];
    
}

#pragma mark - tableViewDegelete
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _datas.count +1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else{
        TLSettingGrounp *group = [_datas objectAtIndex:section - 1];
        return group.itemsCount;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.section;
    if (row == 0) {
        DynamicOneRowCell *cell = [[DynamicOneRowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        return cell;
    }
    TLSettingGrounp *group = [_datas objectAtIndex:indexPath.section - 1];
    TLSettingItem *item = [group itemAtIndex: indexPath.row];
    
    TLFounctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
    if (!cell) {
        cell = [[TLFounctionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FunctionCell"];
    }
    [cell setItem:item];
    [cell setTitleFontSize:13];
    [cell setSubTitleFontSize:13];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] :[cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];

    return cell;

   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 75;
    }else{
        return 44;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else{
        return 20;
    }
}

@end
