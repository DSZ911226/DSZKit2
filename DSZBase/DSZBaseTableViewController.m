//
//  DSZBaseTableViewController.m
//  Demo
//
//  Created by zhilvmac on 2017/10/23.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import "DSZBaseTableViewController.h"
#import <MJRefresh.h>
#import <DSZKitMacro.h>
@interface DSZBaseTableViewController ()

@end

@implementation DSZBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTableView];
    [self regiserCell];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)loadTableView {
    _tableView = [[DSZBaseTableView alloc]initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.frame = CGRectMake(0, 0, DSZScreenWidth, DSZViewHeight);
    [self.view addSubview:_tableView];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
}



- (void)regiserCell {
    
    DAssert(0)
    NSLog(@"子类必须重写");
    
}


/**
 注册cell
 
 @param classNames 需要注册的cell名称数组
 */
- (void)regiserCellWithClassName:(NSArray *)classNames {
    for (NSString *identify in classNames) {
        [self.tableView registerClass:[NSClassFromString(identify) class] forCellReuseIdentifier:identify];
    }
}
- (void)regiserCellWithNibClassName:(NSArray *)classNames {
    for (NSString *identify in classNames) {
        [self.tableView registerNib:[UINib nibWithNibName:identify bundle:nil] forCellReuseIdentifier:identify];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count >0?1:0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)back {
    [super back];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}

- (void)addHeaderRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self headerRereshing];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

- (void)addFootRefresh {
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self footerRereshing];
    }];
}

- (void)endRefresh
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}
- (void)headerRereshing
{
    _pageIndex = 1;
    // 刷新表格UI
    [self dszGetNetWork];
    
}

- (void)footerRereshing
{
    _pageIndex ++;
    [self dszGetNetWork];
}


- (void)reloadTableView {
    [self.tableView reloadData];
}

- (void)dszGetNetWork {
    
}

@end
