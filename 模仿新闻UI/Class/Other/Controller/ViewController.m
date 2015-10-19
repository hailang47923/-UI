//
//  ViewController.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/15.
//  Copyright © 2015年 林海. All rights reserved.
//
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define screen_Widht [UIScreen mainScreen].bounds.size.width
#define LeftMenu_Width [UIScreen mainScreen].bounds.size.width * 0.65
#define LeftMenu_Hight [UIScreen mainScreen].bounds.size.height - 64
#define TIMER 0.25

#import "ViewController.h"
#import "LeftMenu.h"
#import "LNewsVC.h"

@interface ViewController ()<LeftMenuDegelate>
@property (nonatomic, weak) LeftMenu *leftMenu;
@property (nonatomic, weak) LNewsVC *LNewsVC;
@end

@implementation ViewController

-(LNewsVC *)LNewsVC
{
    if (!_LNewsVC) {
        
        LNewsVC *newsVC = [[LNewsVC alloc] init];
        [self addChildViewController:newsVC];
        _LNewsVC = newsVC;
    }
    return _LNewsVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUI];
    
    //添加背景图片
    [self addBackGroundImage];
    
    //添加左边的菜单
    [self addLeftMenu];
}

-(void)addBackGroundImage
{
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImage.image = [UIImage imageNamed:@"dd.png"];
    [[UIApplication sharedApplication].keyWindow insertSubview:bgImage belowSubview:self.navigationController.view];
    
}

-(void)addLeftMenu
{
    NSArray *lists = @[@"头条",@"新闻",@"电台",@"附件"];
    LeftMenu *menu = [[LeftMenu alloc] initWithFrame:CGRectMake(0, 64, LeftMenu_Width,LeftMenu_Hight)];
    menu.degelate = self;
    menu.lists = lists;
    _leftMenu = menu;
    menu.hidden = YES;
    [[UIApplication sharedApplication].keyWindow insertSubview:menu atIndex:1];
}


-(void)buildUI
{
    
    self.title = @"首页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"列表" style:UIBarButtonItemStyleDone target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"我" style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}

-(void)leftItemClick
{
    CGAffineTransform sacleForm = CGAffineTransformMakeScale(0.9, 0.9);
    CGAffineTransform tranSacleForm = CGAffineTransformTranslate(sacleForm, -80, 0);
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
        self.navigationController.view.transform = transScaleForm;
        
        //添加一个遮盖层
        UIButton *cover = [[UIButton alloc] initWithFrame:self.navigationController.view.bounds];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationController.view addSubview:cover];
        
    }];
}

-(void)rightItemClick
{
    
}

-(void)coverClick:(UIButton *)cover
{
    [UIView animateWithDuration:TIMER *1.5 animations:^{
        CGAffineTransform scaleform = CGAffineTransformMakeScale(0.9, 0.9);
        CGAffineTransform anim = CGAffineTransformTranslate(scaleform, -80, 0);
        self.leftMenu.transform = anim;
        self.leftMenu.alpha = 0.1;
        self.navigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.leftMenu.hidden = YES;
        [cover removeFromSuperview];
    }];
}


#pragma mark - leftMenuDegelate
-(void)leftMenuDidSeletedAtRow:(NSInteger)row title:(NSString *)title
{
    for (UIView *subView in self.view.subviews) {
        [subView removeFromSuperview];
    }
    [self coverClick:nil];
    self.title = title;
    
    if (row == 1) {
         [self.view addSubview:self.LNewsVC.view];
    }
   
    
}
@end
