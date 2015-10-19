//
//  MessageCell.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/19.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "MessageCell.h"
@interface MessageCell()
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *message;
@end

@implementation MessageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _image = [[UIImageView alloc] init];
        [_image.layer setMasksToBounds:YES];
        [_image.layer setCornerRadius:5.0f];
        [self addSubview:_image];
        
        _name = [[UILabel alloc] init];
        [_name setFont:[UIFont systemFontOfSize:16]];
        [self addSubview:_name];
        
        _time = [[UILabel alloc] init];
        [_time setAlpha:0.8];
        [_time setFont:[UIFont systemFontOfSize:12]];
        [_time setTextAlignment:NSTextAlignmentRight];
        [_time setTextColor:[UIColor grayColor]];
        [self addSubview:_time];
        
        _message = [[UILabel alloc] init];
        [_message setTextColor:[UIColor grayColor]];
        [_message setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:_message];

    }
    return self;
}

- (void) layoutSubviews
{
    CGFloat leftFreeSpace = 10;
    
    [super layoutSubviews];
    
    float imageWidth = self.frame.size.height * 0.72;
    float space = leftFreeSpace;
    [_image setFrame:CGRectMake(space, space, imageWidth, imageWidth)];
    
    float labelX = space * 2 + imageWidth;
    float labelY = self.frame.size.height * 0.135;
    float labelHeight = self.frame.size.height * 0.4;
    float labelWidth = self.frame.size.width - labelX - space * 1.5;
    
    float dateWidth = 70;
    float dateHeight = labelHeight * 0.75;
    float dateX = self.frame.size.width - space * 1.5 - dateWidth;
    [_time setFrame:CGRectMake(dateX, labelY * 0.7, dateWidth, dateHeight)];
    
    float usernameLabelWidth = self.frame.size.width - labelX - dateWidth - space * 2;
    [_name setFrame:CGRectMake(labelX, labelY, usernameLabelWidth, labelHeight)];
    
    labelY = self.frame.size.height * 0.91 - labelHeight;
    [_message setFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
}

-(void)setMessageItem:(Message *)messageItem
{
    _messageItem = messageItem;
    _name.text = messageItem.userName;
    _time.text = messageItem.userTime;
    _message.text = messageItem.userMessage;
    _image.image = [UIImage imageNamed:messageItem.userImage];
}

@end
