//
//  FirstTableVIewController.m
//  Demo
//
//  Created by zhilvmac on 2017/8/28.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import "FirstTableVIewController.h"
#import "TableViewCell.h"
#import <MJExtension.h>
@interface FirstTableVIewController ()

@end

@implementation FirstTableVIewController

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self p_initData];
    [self p_initView];
    [self addHeaderRefresh];
}

#pragma mark - 自定义方法

- (void)p_initData {
    
}

- (void)p_initView {
    self.title = @"失物招领";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - 重写父类方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (void)dszGetNetWork {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"BusinessManage" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    id jsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    NSArray *array = jsonObject;
    self.dataSource = [Firstmodel mj_objectArrayWithKeyValuesArray:array];    
    [self endRefresh];
    [self reloadTableView];
    
    
}

- (void)regiserCell {
    [self regiserCellWithClassName:@[[TableViewCell className]]];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    [cell setModel:self.dataSource[indexPath.row]];
    return cell;
    
}





@end
