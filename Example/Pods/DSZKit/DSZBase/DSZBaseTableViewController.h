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
 设置tableView的样式
 */
@property(nonatomic,assign)UITableViewStyle tableViewStyle;

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

/**
 刷新tableView
 */
- (void)reloadTableView;


/**
 注册cell
 */
- (void)regiserCell;
/**
 注册cell

 @param classNames 需要注册的cell类名称数组
 */
- (void)regiserCellWithClassName:(NSArray *)classNames;

/**
 注册cell

 @param classNames 需要注册的cell的xib类名称
 */
- (void)regiserCellWithNibClassName:(NSArray *)classNames;
@end
