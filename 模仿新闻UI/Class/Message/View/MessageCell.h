//
//  MessageCell.h
//  模仿新闻UI
//
//  Created by 林海 on 15/10/19.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "Message.h"
@interface MessageCell : CommonTableViewCell
@property (nonatomic, strong) Message *messageItem;
@end
