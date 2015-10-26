//
//  LeftMenu.h
//  模仿新闻UI
//
//  Created by 林海 on 15/10/15.
//  Copyright © 2015年 林海. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftMenuDegelate <NSObject>

-(void)leftMenuDidSeletedAtRow:(NSInteger)row title:(NSString *)title;
-(void)leftMenuSettingButtonIsClick;

@end


@interface LeftMenu : UIView

@property (nonatomic,weak)id <LeftMenuDegelate> degelate;

@property (nonatomic,strong) NSArray *lists;

@end
