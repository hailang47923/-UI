//
//  UIImage+UIColor.m
//  P2P
//
//  Created by sWen on 15/9/22.
//  Copyright (c) 2015年 瑞彩. All rights reserved.
//

#import "UIImage+UIColor.h"

@implementation UIImage (UIColor)

/**
 *  用颜色生成图片
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();    
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
