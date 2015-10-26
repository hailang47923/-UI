//
//  IWNavigationController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-6.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWNavigationController.h"

@interface IWNavigationController ()

@end

@implementation IWNavigationController

/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 1.设置导航栏主题
    [self setupNavBarTheme];
    
    // 2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

//-(void)viewDidLoad
//{
//    [super viewDidLoad];
//    // 获取系统自带滑动手势的target对象
//    id target = self.interactivePopGestureRecognizer.delegate;
//    
//    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
//    
//    // 设置手势代理，拦截手势触发
//    pan.delegate = self;
//    
//    // 给导航控制器的view添加全屏滑动手势
//    [self.view addGestureRecognizer:pan];
//    
//    // 禁止使用系统自带的滑动手势
//    self.interactivePopGestureRecognizer.enabled = NO;
//    
//}
//
//// 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
//// 作用：拦截手势触发
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
//    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
//    if (self.childViewControllers.count == 1) {
//        // 表示用户在根控制器界面，就不需要触发滑动手势，
//        return YES;
//    }
//    return YES;
//}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] =  [UIColor lightGrayColor];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}
/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置bar的颜色
    [navBar setBackgroundImage:[UIImage imageNamed:@"header_bg_ios7_ip4"] forBarMetrics:UIBarMetricsDefault];
    navBar.tintColor = [UIColor whiteColor];
    // 设置状态栏颜色
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [navBar setTitleTextAttributes:textAttrs];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMax) forBarMetrics:UIBarMetricsDefault];
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 导航栏都是盏管理的，如果盏里面的内容大于0，说明push了，
    if (self.viewControllers.count > 0) {
        // 把tabbar隐藏
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
