//
//  LeftMenuHeaderView.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/16.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "LeftMenuHeaderView.h"

@implementation LeftMenuHeaderView

-(instancetype)init
{
    self = [super init];
    if (self) {
        //头像
        UIImageView *headerIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qqstar2"]];
        headerIcon.frame = CGRectMake(10, 0, 85, 85);
        [self addSubview:headerIcon];
        
        //姓名
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(93, 20, 100, 30)];
        nameLabel.text = @"飞翔的🐧🐧";
        nameLabel.font = [UIFont boldSystemFontOfSize:17];
        nameLabel.textColor = [UIColor whiteColor];
        [self addSubview:nameLabel];
        
        //等级图标
        for (int i = 0; i < 3; i++) {
            UIImageView *gradeImage = [[UIImageView alloc] init];
            gradeImage.image = [UIImage imageNamed:@"usersummary_icon_lv_crown"];
            CGFloat X = 93 + i * 20;
            gradeImage.frame = CGRectMake(X, CGRectGetMaxY(nameLabel.frame)+10, 16, 16);
            [self addSubview:gradeImage];
        }
        
        //添加一个二维码按钮
        UIButton *QRBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [QRBtn setImage:[UIImage imageNamed:@"sidebar_QRcode_small"] forState:UIControlStateNormal];
        QRBtn.frame = CGRectMake(190, 30, 40, 40);
        [QRBtn addTarget:self action:@selector(QRBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:QRBtn];
        //头像背景按钮
        UIButton *backGround = [UIButton buttonWithType:UIButtonTypeSystem];
        backGround.frame = CGRectMake(0, 0, 290, 85);
        [backGround setBackgroundImage:[UIImage imageNamed:@"sidebar_bg"] forState:UIControlStateHighlighted];
        [backGround addTarget:self action:@selector(headerIconClick) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:backGround atIndex:0];
        
        CGFloat W = 300;
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(backGround.frame),W, 30)];
        //添加线
        UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W, 1)];
        line1.backgroundColor = [UIColor blackColor];
        line1.alpha = 0.1;
        [header addSubview:line1];
        
        //添加图标
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 20, 20)];
        imageView.image = [UIImage imageNamed:@"sidebar_signature_nor"];
        [header addSubview:imageView];
        
        //添加文字
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 6, W - 35, 20)];
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:13];
        label.text = @"编辑个性签名";
        [header addSubview:label];
        
        //添加线2
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 29, W, 1)];
        line2.backgroundColor = [UIColor blackColor];
        line2.alpha = 0.1;
        [header addSubview:line2];
        
        UIButton *backGround2 = [UIButton buttonWithType:UIButtonTypeSystem];
        backGround2.frame = header.bounds;
        [backGround2 setBackgroundImage:[UIImage imageNamed:@"sidebar_bg"] forState:UIControlStateHighlighted];
        [header insertSubview:backGround2 atIndex:0];
        [backGround2 addTarget:self action:@selector(signatureClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:header];
    }
    return self;
}

-(void)signatureClick
{
    NSLog(@"点击了签名");
}

-(void)headerIconClick
{
    NSLog(@"点击了头像");
}

-(void)QRBtnClick
{
    NSLog(@"点击了二维码");
}
@end
