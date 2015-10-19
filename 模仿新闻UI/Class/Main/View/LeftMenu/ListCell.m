//
//  ListCell.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/16.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "ListCell.h"


@implementation ListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *line = [[UIView alloc] init];
        line.tag = 1;
        line.hidden = YES;
        line.alpha = 0.1;
        line.backgroundColor = [UIColor blackColor];
        [self addSubview:line];
    }
    return self;
}

-(void)setLineIsHidden:(BOOL)lineIsHidden
{
    UIView *line = [self viewWithTag:1];
    line.hidden = lineIsHidden;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    UIView *line = [self viewWithTag:1];
    line.frame = CGRectMake(15, self.frame.size.height, self.frame.size.width - 15, 1);
}


@end
