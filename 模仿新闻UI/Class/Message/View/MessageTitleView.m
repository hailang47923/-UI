//
//  MessageTitleView.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/18.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "MessageTitleView.h"
@interface MessageTitleView()
@property (nonatomic,weak) UIButton *seletedBtn;
@end

@implementation MessageTitleView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat btnW = 58;
        UIButton *phoneBtn = [self buttonWithTitle:@"消息" nor:@"header_lefttab_nor" hight:@"header_lefttab_press" seleted:@"header_lefttab_highlighted"];
        phoneBtn.frame = CGRectMake(0, 5, btnW, 30);
        phoneBtn.tag = 1;
        
        UIButton *mesBtn = [self buttonWithTitle:@"电话" nor:@"header_righttab_nor" hight:@"header_righttab_press" seleted:@"header_righttab_highlighted"];
        mesBtn.frame = CGRectMake(btnW,5, btnW, 30);
        mesBtn.tag = 2;
        [self btnClick:phoneBtn];
    }
    return self;
}



-(UIButton *)buttonWithTitle:(NSString *)title nor:(NSString *)nol hight:(NSString *)hight seleted:(NSString *)seleted;
{
    UIEdgeInsets edge;
    if (![title isEqualToString:@"消息"]) {
        edge = UIEdgeInsetsMake(10, 1, 10, 20);
    }else{
        edge = UIEdgeInsetsMake(10, 12, 10, 0);
    }
    UIImage *old = [UIImage imageNamed:nol];
    UIImage *new = [old resizableImageWithCapInsets:edge];
    UIImage *oldH= [UIImage imageNamed:hight];
    UIImage *newH = [oldH resizableImageWithCapInsets:edge];
    UIImage *oldS= [UIImage imageNamed:hight];
    UIImage *newS = [oldS resizableImageWithCapInsets:edge];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:new forState:UIControlStateNormal];
    [btn setBackgroundImage:newH forState:UIControlStateHighlighted];
    [btn setBackgroundImage:newS forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:QQDefaultColor forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    return btn;
}

-(void)btnClick:(UIButton *)btn
{
    _seletedBtn.selected = NO;
    btn.selected = YES;
    _seletedBtn = btn;
}
@end