//
//  QQZoneTopView.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/20.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "QQZoneTopView.h"
@interface QQZoneTopView ()
@property (nonatomic,weak) UIView *cover;
@property (nonatomic,weak) UIView *topView;
@end

@implementation QQZoneTopView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.hidden = YES;
        
        UIView *cover = [[UIView alloc] init];
        cover.backgroundColor = [UIColor blackColor];
        cover.alpha = 0.1;
        cover.frame = [UIApplication sharedApplication].keyWindow.bounds;
        _cover = cover;
        [self addSubview:cover];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverClick)];
        [cover addGestureRecognizer:tap];
        
        
        UIView *topView = [[UIView alloc] init];
        topView.backgroundColor = [UIColor colorWithWhite:256 alpha:0.8];
        topView.frame = CGRectMake(0, -180, [UIApplication sharedApplication].keyWindow.frame.size.width, 180);
        _topView = topView;
        [self addSubview:topView];
        
        for (int i = 0; i < 4; i ++) {
            CGFloat btnW = 75;
            CGFloat btnX = [UIApplication sharedApplication].keyWindow.frame.size.width / 4;
            NSString *str = [NSString stringWithFormat:@"aio_icons_%d",i];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
            btn.frame = CGRectMake(btnX * i, btnW, btnW, btnW);
            [topView addSubview:btn];
            
            NSString *labelStr = nil;
            if (i == 0) {
                labelStr = @"签到";
            }else if (i == 1){
                labelStr = @"发说说";
            }else if (i == 2){
                labelStr = @"传照片";
            }else if (i == 3){
                labelStr = @"发视频";
            }
            
            UILabel *label = [[UILabel alloc] init];
            label.text = labelStr;
            label.font = [UIFont systemFontOfSize:13];
            label.textAlignment = NSTextAlignmentCenter;
            label.frame = CGRectMake(btnX * i, CGRectGetMaxY(btn.frame) - 10, 75, 30);
            [topView addSubview:label];
        }
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setImage:[UIImage imageNamed:@"aio_face_store_button_canceldown"] forState:UIControlStateNormal];
        cancelBtn.frame = CGRectMake([UIApplication sharedApplication].keyWindow.frame.size.width - 40, 30, 40, 40);
        [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:cancelBtn];
    }
    return self;
}




-(void)show
{
    self.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        _topView.frame = CGRectMake(0, 0, self.frame.size.width, 180);
    }];
}

-(void)hidden
{
    [self coverClick];
}

-(void)coverClick
{
    [UIView animateWithDuration:0.5 animations:^{
        _topView.frame = CGRectMake(0, -180, self.frame.size.width, 180);
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

-(void)cancelBtnClick
{
    [self coverClick];
}
@end
