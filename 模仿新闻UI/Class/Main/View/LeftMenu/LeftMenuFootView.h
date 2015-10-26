//
//  LeftMenuFootView.h
//  模仿新闻UI
//
//  Created by 林海 on 15/10/16.
//  Copyright © 2015年 林海. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftMenuFootViewDegelate <NSObject>

-(void)LeftMenuFootViewSettingButtonIsClick;

@end

@interface LeftMenuFootView : UIView

@property (nonatomic, weak) id <LeftMenuFootViewDegelate> degelate;

@end
