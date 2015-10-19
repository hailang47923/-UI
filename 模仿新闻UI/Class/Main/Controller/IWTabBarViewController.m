//
//  IWTabBarViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWTabBarViewController.h"
#import "IWTabBar.h"
#import "DynamicTBVC.h"
#import "MessageTBVC.h"
#import "FriendTBVC.h"
#import "IWNavigationController.h"


@interface IWTabBarViewController () <IWTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, strong) IWTabBar *customTabBar;
@end

@implementation IWTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[NSThread sleepForTimeInterval:2.0];
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    IWTabBar *customTabBar = [[IWTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.backgroundColor = [UIColor whiteColor];
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

#pragma mark - tabbar的代理方法
/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(IWTabBar *)tabBar didSelectedButtonFrom:(long)from to:(long)to
{
    // 切换当前控制器
    self.selectedIndex = to;
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.消息
    MessageTBVC *messageVC = [[MessageTBVC alloc] init];
    [self setupChildViewController:messageVC title:@"消息" imageName:@"tab_recent_nor" selectedImageName:@"tab_recent_press"];
    
    // 2.联系人
    FriendTBVC *friendVC = [[FriendTBVC alloc] init];
    [self setupChildViewController:friendVC title:@"联系人" imageName:@"tab_buddy_nor" selectedImageName:@"tab_buddy_press"];
    
    // 4.动态
    DynamicTBVC *dynamicVC = [[DynamicTBVC alloc] init];
    [self setupChildViewController:dynamicVC title:@"动态" imageName:@"tab_qworld_nor" selectedImageName:@"tab_qworld_press"];
    
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.selectedImage = selectedImage;
    // 2.包装一个导航控制器
    IWNavigationController *nav = [[IWNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}


@end
