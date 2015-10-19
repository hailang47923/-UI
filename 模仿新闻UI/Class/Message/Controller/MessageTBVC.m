//
//  MessageTBVC.m
//  模仿新闻UI
//
//  Created by 林海 on 15/10/16.
//  Copyright © 2015年 林海. All rights reserved.
//

#import "MessageTBVC.h"
#import "MessgeCoverView.h"
#import "LNewsVC.h"
#import "DynamicTBVC.h"
#import "MessageTitleView.h"
#import "MessageCell.h"
#import "Message.h"

@interface MessageTBVC ()
@property (nonatomic,assign) BOOL isClick;
@property (nonatomic,strong) MessgeCoverView *coverView;
@property (nonatomic,strong) UISearchController *searchVC;
@property (nonatomic,weak) UITableView *msgTBV;
@end

@implementation MessageTBVC

-(MessgeCoverView *)coverView
{
    if (!_coverView) {
       _coverView = [[MessgeCoverView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH,VIEW_HEIHT)];
        [self.view addSubview:_coverView];
    }
    return _coverView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubViews];
}

#pragma mark - 添加子控件
-(void)addSubViews
{
    //添加导航栏左边的按钮
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_icon_list"] style:UIBarButtonItemStyleDone target:self action:@selector(rightItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.searchPlaceholder = @"搜索";
    
    //添加导航栏titleView
    MessageTitleView *titleView = [[MessageTitleView alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    self.navigationItem.titleView = titleView;
    
}

-(void)rightItemClick
{
    _isClick = !_isClick;
    if (_isClick) {
        [self.coverView show];
    }else{
        [self.coverView hidden];
    }
}

#pragma mark - tableViewDegelate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Message *messageItem = [[Message alloc] init];
    messageItem.userName = @"爷、の蛋疼...旷操";
    messageItem.userTime = @"今天下午";
    messageItem.userMessage = @"几天天气很好...";
    messageItem.userImage = @"qqstar4";
    static NSString *ID = @"messaage";
    MessageCell *cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    [cell setBottomLineStyle:CellLineStyleDefault];
    cell.messageItem = messageItem;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}



@end
