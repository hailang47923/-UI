//
//  LoginVC.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/15.
//  Copyright © 2015年 林海. All rights reserved.
//

#define View_width self.view.frame.size.width
#define View_height self.view.frame.size.height
#import "LoginVC.h"
#import "IWTabBarViewController.h"

@interface LoginVC ()
@property (nonatomic, weak) UIScrollView *iconSCView;
@property (nonatomic, weak) UITextField *passwordTF;
@property (nonatomic, weak) UIButton *loginBtn;
@property (nonatomic, weak) UIImageView *icon;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUI];
}

-(void)buildUI
{
    //背景
    CALayer *bgLayer = [[CALayer alloc] init];
    bgLayer.frame = self.view.bounds;
    bgLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"login_bg"].CGImage);
    [self.view.layer addSublayer:bgLayer];
    
    //头像
    UIImageView *icon = [[UIImageView alloc] init];
    icon.frame = CGRectMake(View_width * 0.5 - 40, View_height *0.1, 80, 80);
    icon.image = [UIImage imageNamed:@"login_avatar_default"];
    _icon = icon;
    [self.view addSubview:icon];
    
    CGFloat arrowBtnW = 20;
    
    //添加一个tabableView
    UITextField *numberTF = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(icon.frame) + 20, View_width - arrowBtnW , 40)];
    numberTF.placeholder = @"QQ号/手机号/邮箱";
    numberTF.backgroundColor = [UIColor whiteColor];
    numberTF.textAlignment = NSTextAlignmentCenter;
    numberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:numberTF];
    
    //添加一个箭头按钮
    UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowBtn.tag = 1;
    arrowBtn.frame = CGRectMake(CGRectGetMaxX(numberTF.frame), numberTF.frame.origin.y, arrowBtnW, 40);
    arrowBtn.backgroundColor = [UIColor whiteColor];
    [arrowBtn setImage:[UIImage imageNamed:@"login_textfield_more"] forState:UIControlStateNormal];
    [arrowBtn addTarget:self action:@selector(arrowBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrowBtn];
    
    //添加一条分割线
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(numberTF.frame), View_width, 1)];
    line.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    [self.view addSubview:line];
    
    UITextField *passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame), View_width, 40)];
    passwordTF.placeholder = @"密码";
    passwordTF.backgroundColor = [UIColor whiteColor];
    passwordTF.textAlignment = NSTextAlignmentCenter;
    passwordTF.secureTextEntry = YES;
    passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordTF = passwordTF;
    [self.view addSubview:passwordTF];
    
    UIImage *nor = [UIImage imageNamed:@"login_btn_blue_nor"];
    UIImage *newNor = [nor resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
    UIImage *press = [UIImage imageNamed:@"login_btn_blue_press"];
    UIImage *newPress = [press resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.layer.cornerRadius = 4;
    loginBtn.clipsToBounds = YES;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:newNor forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:newPress forState:UIControlStateHighlighted];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.frame = CGRectMake(20, CGRectGetMaxY(passwordTF.frame) + 20, View_width - 40, 40);
    _loginBtn = loginBtn;
    [self.view addSubview:loginBtn];
    
    //添加一个scrollView
    UIScrollView *iconSCView = [[UIScrollView alloc] init];
    iconSCView.contentSize = CGSizeMake(View_width + 1, 80);
    iconSCView.frame = CGRectMake(0, CGRectGetMaxY(line.frame), View_width, 80);
    iconSCView.backgroundColor = [UIColor whiteColor];
    iconSCView.hidden = YES;
    _iconSCView = iconSCView;
    [self.view insertSubview:iconSCView atIndex:1];
    
    //添加一条线
    UIView *twoLine = [[UIView alloc] initWithFrame:CGRectMake(-100, 79, 1000, 1)];
    twoLine.backgroundColor = [UIColor blackColor];
    twoLine.alpha = 0.1;
    [iconSCView addSubview:twoLine];
    
    
    for (int i = 0 ; i < 3 ; i ++) {
        UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *imageName = [NSString stringWithFormat:@"qqstar%d",i +1];
        [imageBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        CGFloat W = View_width / 3;
        imageBtn.frame = CGRectMake(i * W, 0, 80, 80);
        [imageBtn addTarget:self action:@selector(imagebtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [iconSCView addSubview:imageBtn];
    }
    
    //添加底部btn
    UIButton *newPreson = [UIButton buttonWithType:UIButtonTypeCustom];
    newPreson.titleLabel.font = [UIFont systemFontOfSize:14];
    [newPreson setTitle:@"新用户" forState:UIControlStateNormal];
    [newPreson setTitleColor:QQDefaultColor forState:UIControlStateNormal];
    [newPreson setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    newPreson.frame = CGRectMake(View_width - 60, View_height - 30, 50, 20);
    [self.view addSubview:newPreson];
    
    UIButton *unableLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    unableLogin.titleLabel.font = [UIFont systemFontOfSize:14];
    [unableLogin setTitle:@"无法登陆？" forState:UIControlStateNormal];
    [unableLogin setTitleColor:QQDefaultColor forState:UIControlStateNormal];
    [unableLogin setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    unableLogin.frame = CGRectMake(20, View_height - 30, 70, 20);
    [self.view addSubview:unableLogin];
}

#pragma mark - 点击事件
-(void)arrowBtnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    _iconSCView.alpha = !btn.selected ? 1 : 0;
    _iconSCView.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        btn.transform = CGAffineTransformIdentity;
        btn.imageView.transform = btn.selected ? CGAffineTransformMakeRotation(M_PI) : btn.transform;
        _iconSCView.alpha = btn.selected ? 1 : 0;
        _passwordTF.frame = CGRectMake(0, btn.selected ? CGRectGetMaxY(_iconSCView.frame) : CGRectGetMaxY(btn.frame) +1, View_width, 40);
        _loginBtn.frame = CGRectMake(20, CGRectGetMaxY(_passwordTF.frame) + 20, View_width - 40, 40);
    }completion:^(BOOL finished) {
        _iconSCView.hidden = !btn.selected;
       
    }];
    
}

-(void)imagebtnClick:(UIButton *)imageBtn
{
    _icon.image = imageBtn.imageView.image;
    UIButton *arrowBtn = (UIButton *)[self.view viewWithTag:1];
    [self arrowBtnClick:arrowBtn];
    
}

-(void)login
{
    IWTabBarViewController *tarbarVC = [[IWTabBarViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tarbarVC;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}






@end
