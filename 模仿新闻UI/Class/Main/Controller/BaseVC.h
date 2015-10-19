//
//  ViewController.h
//  模仿新闻UI
//
//  Created by 林海 on 15/10/15.
//  Copyright © 2015年 林海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseVC : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic,copy) NSString *searchPlaceholder;
@property (nonatomic, weak) UITableView *tableView;
@end

