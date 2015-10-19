//
//  MessgeCoverView.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/17.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "MessgeCoverView.h"

@interface MessgeCoverView()
@property (nonatomic,strong) NSMutableArray *btnArray;
@property (nonatomic,weak) UIView *popoverView;
@property (nonatomic,weak) UIView *coverView;

@end


@implementation MessgeCoverView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverClick)];
        [self addGestureRecognizer:tap];
        
        UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, VIEW_HEIHT)];
        coverView.backgroundColor = [UIColor blackColor];
        coverView.alpha = 0.1;
        [self insertSubview:coverView atIndex:0];
        
        //是固定的位置，不会变化的话 就先设置好fream，改变view的tranfrom 会触发layoutsubviews 会出现问题。
        UIView *popoverView = [[UIView alloc] init];
        popoverView.backgroundColor = [UIColor whiteColor];
        popoverView.layer.cornerRadius = 4;
        popoverView.clipsToBounds = YES;
        popoverView.alpha = 0.1;
        //我特么日了🐶了 不要问我为什么这么写！！！！！
        popoverView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width- 75, -114, 125,240);
        _popoverView = popoverView;
        [self addSubview:popoverView];

        _btnArray = [NSMutableArray array];
        
        //添加按钮
        UIButton *btn1 = [self buttonWithTitle:@"扫一扫" image:@"right_menu_QR"];
        btn1.frame = CGRectMake(0,0, 129, 40);
        UIButton *btn2 = [self buttonWithTitle:@"加好友" image:@"right_menu_addFri"];
        btn2.frame = CGRectMake(0,40, 129, 40);
        UIButton *btn3 = [self buttonWithTitle:@"创建讨论组" image:@"right_menu_multichat"];
        btn3.frame = CGRectMake(0,80, 129, 40);
        UIButton *btn4 = [self buttonWithTitle:@"发送到电脑" image:@"right_menu_sendFile"];
        btn4.frame = CGRectMake(0,120, 129, 40);
        UIButton *btn5 = [self buttonWithTitle:@"面对面快传" image:@"right_menu_facetoface"];
        btn5.frame = CGRectMake(0,160, 129, 40);
        UIButton *btn6 = [self buttonWithTitle:@"收钱" image:@"right_menu_payMoney"];
        btn6.frame = CGRectMake(0,200, 129, 40);
        
        //添加分割线
        for (int i = 0; i < _btnArray.count; i++) {
            UIView *line = [[UIView alloc] init];
            line.backgroundColor = [UIColor blackColor];
            line.alpha = 0.1;
            line.frame = CGRectMake(0, i * 40, 125, 1);
            [_popoverView addSubview:line];
        }
        
    }
    return self;
}


-(UIButton *)buttonWithTitle:(NSString *)title image:(NSString *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"app_share_popup_button_right_press"] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [_popoverView addSubview:btn];
    [_btnArray addObject:btn];
    return btn;
}

//显示出来
-(void)show
{
    self.hidden = NO;
    //这只锚点 这个点进行缩放
    _popoverView.layer.anchorPoint = CGPointMake(1,0);
    //先让要显示的view最小直至消失
    _popoverView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.4 animations:^{
        _popoverView.alpha = 1.0;
        _popoverView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}

//缩回去
-(void)hidden
{
    [UIView animateWithDuration:0.4 animations:^{
        _popoverView.alpha = 0.1;
        _popoverView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

-(void)coverClick
{
    [self hidden];
}
@end
