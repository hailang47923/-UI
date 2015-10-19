//
//  TLUIHelper.m
//  iOSAppTemplate
//
//  Created by 李伯坤 on 15/9/24.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "TLUIHelper.h"

@implementation TLUIHelper

+ (NSMutableArray *) getDynamicItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *album = [[TLSettingItem alloc] initWithTitle:@"游戏" subTitle:@"天天打飞机" imageName:@"found_icons_location_footprint" subImageName:@"found_icons_location_footprint"];
    TLSettingItem *favorite = [[TLSettingItem alloc] initWithTitle:@"购物" imageName:@"found_icons_location_footprint"];
    TLSettingItem *bank = [[TLSettingItem alloc] initWithTitle:@"阅读" imageName:@"found_icons_group_location"];
    TLSettingItem *card = [[TLSettingItem alloc] initWithTitle:@"动漫" imageName:@"found_icons_location_footprint"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card, nil];
    [items addObject:group1];
    
    
    
    
    TLSettingItem *expression = [[TLSettingItem alloc] initWithTitle:@"附近的群" imageName:@"found_icons_group_location"];
    TLSettingItem *expression1 = [[TLSettingItem alloc] initWithTitle:@"吃喝玩乐" imageName:@"found_icons_location_footprint"];
    TLSettingItem *expression2 = [[TLSettingItem alloc] initWithTitle:@"同城服务" imageName:@"found_icons_location_footprint"];
    TLSettingItem *expression3 = [[TLSettingItem alloc] initWithTitle:@"健康" imageName:@"found_icons_location_footprint"];
    TLSettingGrounp *group2 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, expression1,expression2,expression3, nil];
    [items addObject:group2];
    
    return items;
}


+(NSMutableArray *)getSettingItems
{
     NSMutableArray *items = [[NSMutableArray alloc] init];
    TLSettingItem *item = [[TLSettingItem alloc] initWithTitle:@"账户管理" subImageName:@"qqstar2"];
    TLSettingItem *item1 = [[TLSettingItem alloc] initWithTitle:@"手机号码" subTitle:@"未绑定"];
    TLSettingItem *item2 = [[TLSettingItem alloc] initWithTitle:@"QQ达人" subTitle:@"76天"];
    TLSettingGrounp *group = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item, item1,item2, nil];
    [items addObject:group];
    
    
    TLSettingItem *item3 = [[TLSettingItem alloc] initWithTitle:@"消息通知"];
    TLSettingItem *item4 = [[TLSettingItem alloc] initWithTitle:@"聊天记录"];
    TLSettingGrounp *group1 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item3, item4, nil];
    [items addObject:group1];
    
    TLSettingItem *item5 = [[TLSettingItem alloc] initWithTitle:@"联系人、隐私"];
    TLSettingItem *item6 = [[TLSettingItem alloc] initWithTitle:@"设备锁" subTitle:@"已经开启"];
    TLSettingItem *item7 = [[TLSettingItem alloc] initWithTitle:@"辅助功能"];
    TLSettingGrounp *group3 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item5, item6,item7, nil];
    [items addObject:group3];
    
    TLSettingItem *item8 = [[TLSettingItem alloc] initWithTitle:@"关于QQ与帮助"];
        TLSettingGrounp *group4 = [[TLSettingGrounp alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item8, nil];
    [items addObject:group4];
    return items;
}
@end
