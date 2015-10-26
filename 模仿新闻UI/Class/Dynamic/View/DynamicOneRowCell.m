//
//  DynamicOneRowCell.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/19.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "DynamicOneRowCell.h"

@interface DynamicOneRowCell()
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSMutableArray *lableArray;
@property (nonatomic, weak) UIButton *friendBtn;
@property (nonatomic, weak) UIButton *nearBtn;
@property (nonatomic, weak) UIButton *tribeBtn;
@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;
@property (nonatomic, weak) UILabel *label3;
@property (nonatomic, weak) UIView *line;

@end

@implementation DynamicOneRowCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _btnArray = [NSMutableArray array];
        _lableArray = [NSMutableArray array];
        
        UIButton *frinedBtn = [self buttonWithImage:@"found_icons_qzone"];
        frinedBtn.tag = 1;
        _friendBtn = frinedBtn;
        UIButton *nearBtn = [self buttonWithImage:@"found_icons_location" ];
        nearBtn.tag = 2;
        _nearBtn = nearBtn;
        UIButton *tribeBtn = [self buttonWithImage:@"found_icons_group_buluo"];
        tribeBtn.tag = 3;
        _tribeBtn = tribeBtn;

        UILabel *label1 = [self labelWtihTiltle:@"好友动态"];
        _label1 = label1;
        
        UILabel *label2 = [self labelWtihTiltle:@"附近"];
        _label2 = label2;
        
        UILabel *label3 = [self labelWtihTiltle:@"兴趣部落"];
        _label3 = label3;
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor blackColor];
        line.alpha = 0.1;
        _line = line;
        [self addSubview:line];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnW = screen_Widht / _btnArray.count;
    for (int i = 0 ; i < _btnArray.count; i ++) {
        UIButton *btn = _btnArray[i];
        btn.frame = CGRectMake(btnW * i, 0, btnW, 60);
        
        UILabel *label = _lableArray[i];
        label.frame = CGRectMake(btnW * i,52, btnW,20);
    }
    _line.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
}

-(void)setIsFrendCell:(BOOL)isFrendCell
{
    _label1.text = @"新朋友";
    _label2.text = @"特别关心";
    _label3.text = @"群组";
        
    UIButton *btn4 = [self buttonWithImage:@"buddy_header_icon_public"];
    [_nearBtn setImage:[UIImage imageNamed:@"buddy_header_icon_newfriend"] forState:UIControlStateNormal];
    [_friendBtn setImage:[UIImage imageNamed:@"found_icons_location-1"] forState:UIControlStateNormal];
    [_tribeBtn setImage:[UIImage imageNamed:@"buddy_header_icon_group"] forState:UIControlStateNormal];
        
    UILabel *label4 = [self labelWtihTiltle:@"公众号"];
    [_lableArray addObject:label4];

}

-(UIButton *)buttonWithImage:(NSString *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self addSubview:btn];
    [_btnArray addObject:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

-(UILabel *)labelWtihTiltle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.textAlignment = 1;
    label.font = [UIFont boldSystemFontOfSize:12];
    [self addSubview:label];
    [_lableArray addObject:label];
    return label;
}

-(void)btnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(dynamicOneCellBtnClickWithTag:)]) {
        [self.delegate dynamicOneCellBtnClickWithTag:btn.tag];
    }
}
@end
