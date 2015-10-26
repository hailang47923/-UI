//
//  ViewController.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/15.
//  Copyright © 2015年 林海. All rights reserved.
//

#define LeftMenu_Width [UIScreen mainScreen].bounds.size.width * 0.75
#define LeftMenu_Hight [UIScreen mainScreen].bounds.size.height - 64
#define TIMER 0.25

#import "BaseVC.h"
#import "LeftMenu.h"
#import "LNewsVC.h"
#import "IWTabBarViewController.h"
#import "SettingTBVC.h"
#import "IWNavigationController.h"

@interface BaseVC ()<LeftMenuDegelate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) LeftMenu *leftMenu;
@property (nonatomic, weak) LNewsVC *LNewsVC;
@property (nonatomic, strong) UISearchController *searchVC;

@property (nonatomic, assign) CGFloat speedf; //滑动速度
@property (nonatomic, assign) CGFloat scalef; //滑动比例
@end

@implementation BaseVC

-(LNewsVC *)LNewsVC
{
    if (!_LNewsVC) {
        
        LNewsVC *newsVC = [[LNewsVC alloc] init];
        [self addChildViewController:newsVC];
        _LNewsVC = newsVC;
    }
    return _LNewsVC;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self buildUI];
    
    //添加背景图片
    [self addBackGroundImage];
    
    //添加左边的菜单
    [self addLeftMenu];
    
    //添加tableview
    [self addBaseTableView];
    
}

-(void)addBackGroundImage
{
    for (UIView  *view in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            [view  removeFromSuperview];
        }
    }
     
    
    //添加头部背景图片
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImage.image = [UIImage imageNamed:@"sidebar_bg"];
    bgImage.frame = CGRectMake(0, 0, screen_Widht, 150);
    [[UIApplication sharedApplication].keyWindow insertSubview:bgImage atIndex:0];
    
//    UIImage *backImage = [UIImage imageNamed:@"sidebar_bg_mask"];
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 180,18, 160)];
//    backgroundImage.image = backImage;
//    backgroundImage.contentMode = UIViewContentModeScaleToFill;
//    [bgImage addSubview:backgroundImage];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)addLeftMenu
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"list" ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    _leftMenu = [[LeftMenu alloc] initWithFrame:CGRectMake(0, 64, LeftMenu_Width,LeftMenu_Hight)];
    _leftMenu.degelate = self;
    _leftMenu.lists = array;
    _leftMenu.hidden = YES;
    [[UIApplication sharedApplication].keyWindow insertSubview:_leftMenu atIndex:1];
}

-(void)addBaseTableView
{
    UITableView *BaseTBV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, VIEW_HEIHT)];
    BaseTBV.separatorStyle = UITableViewCellSeparatorStyleNone;
    BaseTBV.delegate = self;
    BaseTBV.dataSource = self;
    BaseTBV.showsVerticalScrollIndicator = NO;
    _tableView = BaseTBV;
    [self.view addSubview:BaseTBV];
    
    LNewsVC *VC = [[LNewsVC alloc] init];
    _searchVC = [[UISearchController alloc] initWithSearchResultsController:VC];
    _searchVC.hidesNavigationBarDuringPresentation = YES;
    _searchVC.searchBar.barTintColor = QQColor(229, 229, 229);
    [_searchVC.searchBar setDelegate:self];
    [_searchVC.searchBar.layer setBorderWidth:0.5f];
    [_searchVC.searchBar.layer setBorderColor:[UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0].CGColor];
    [BaseTBV setTableHeaderView:_searchVC.searchBar];
}

-(void)setSearchPlaceholder:(NSString *)searchPlaceholder
{
    _searchVC.searchBar.placeholder = searchPlaceholder;
}

-(void)buildUI
{
    _speedf = 0.5;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0,0, 40, 40);
    [button setImage: [UIImage imageNamed:@"qqstar2"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

#pragma mark - 点击事件
-(void)leftItemClick
{
    self.navigationItem.leftBarButtonItem = nil;
    CGAffineTransform sacleForm = CGAffineTransformMakeScale(0.9, 0.9);//缩放
    CGAffineTransform tranSacleForm = CGAffineTransformTranslate(sacleForm, -80, 0); //缩放+移动
    self.leftMenu.transform = tranSacleForm;
    self.leftMenu.hidden = NO;
    self.leftMenu.alpha = 1.0;
    [UIView animateWithDuration:TIMER animations:^{
        self.leftMenu.transform = CGAffineTransformIdentity;
        //算出比例
        CGFloat navH = Screen_Height - 124;
        CGFloat scale = navH / Screen_Height;
        
        //左边菜单的距离
        CGFloat leftMagin = screen_Widht * (1 - scale) *0.5;
        CGFloat translteX = (LeftMenu_Width - leftMagin)/scale;
        
        //设置移动缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        CGAffineTransform transScaleForm = CGAffineTransformTranslate(scaleForm, translteX, 0);
        self.tabBarController.view.transform = transScaleForm;
        
        //添加一个遮盖层
        UIButton *cover = [[UIButton alloc] initWithFrame:self.navigationController.view.bounds];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationController.view addSubview:cover];
        
    }];
}

-(void)coverClick:(UIButton *)cover
{
    [UIView animateWithDuration:TIMER *1.5 animations:^{
        CGAffineTransform scaleform = CGAffineTransformMakeScale(0.9, 0.9);
        CGAffineTransform anim = CGAffineTransformTranslate(scaleform, -80, 0);
        self.leftMenu.transform = anim;
        self.leftMenu.alpha = 0.1;
        self.tabBarController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.leftMenu.hidden = YES;
        [cover removeFromSuperview];
        [self buildUI];
    }];
}

#pragma mark - leftMenuDegelate
-(void)leftMenuDidSeletedAtRow:(NSInteger)row title:(NSString *)title
{
    [self coverClick:nil];
    
        LNewsVC *news = [[LNewsVC alloc] init];
    [self.navigationController pushViewController:news animated:YES];
}

-(void)leftMenuSettingButtonIsClick
{
    [self coverClick:nil];
    SettingTBVC *setTBVC = [[SettingTBVC alloc] init];
    [self.navigationController pushViewController:setTBVC animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - GestureRecognizerDegelaete




@end
