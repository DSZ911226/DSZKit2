//
//  DSZBaseTableViewController.h
//  Demo
//
//  Created by zhilvmac on 2017/10/23.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import "DSZBaseViewController.h"
#import "DSZBaseTableView.h"
@interface DSZBaseTableViewController : DSZBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)DSZBaseTableView *tableView;
@property(nonatomic,assign)NSInteger pageIndex;
@property(nonatomic,strong)NSMutableArray *dataSource;







/**
 下啦刷新
 */
- (void)addHeaderRefresh;

/**
 上提加载
 */
- (void)addFootRefresh;


/**
 结束刷新
 */
- (void)endRefresh;

/**
 刷新回调
 */
- (void)dszGetNetWork;

@end
