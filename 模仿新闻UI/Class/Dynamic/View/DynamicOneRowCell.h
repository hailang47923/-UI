//
//  DynamicOneRowCell.h
//  模仿新闻UI
//
//  Created by 林海 on 15/10/19.
//  Copyright © 2015年 林海. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DynamicOneCellDelegate <NSObject>

-(void)dynamicOneCellBtnClickWithTag:(NSInteger)tag;

@end

@interface DynamicOneRowCell : UITableViewCell
@property (nonatomic, weak) id <DynamicOneCellDelegate> delegate;
@property (nonatomic ,assign) BOOL isFrendCell;
@end
