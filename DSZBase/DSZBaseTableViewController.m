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
#import "UIView+DSZExt.h"
#import "UITableView+DSZExt.h"
@interface DSZBaseTableViewController ()

@property (nonatomic, strong) UIView *emptyView;
@property (nonatomic, strong) UIView *emptyFootView;

@end

@implementation DSZBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTableView];
    [self regiserCell];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}



/**
 懒加载

 @return tableView默认为Plain
 */
- (DSZBaseTableView *)tableView{

    if (!_tableView) {
        if (self.tableViewStyle == UITableViewStylePlain) {
            _tableView = [[DSZBaseTableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        }else{
            _tableView = [[DSZBaseTableView alloc]initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
            _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.001, 0.001)];
        }
    }
    return _tableView;
}


/* 目前基本可以兼容有表头的tableView
 * 无表头的话  请在所使用的类里加上self.emptyView.frame = self.tableView.frame;
 */
- (UIView *)emptyView {
    if (!_emptyView) {
        
        CGFloat posY = self.tableView.tableHeaderView.frame.size.height;
        CGFloat height = 0.0;
        
        //        if (self.tableView.frame.origin.y == 0.0 && posY == 0.0) {
        //            posY = 64.0;
        //        } else {
        //
        //        }
        
        if (self.tableView.tableHeaderView.frame.size.height != 0.0) {
            height = self.tableView.frame.size.height - self.tableView.tableHeaderView.frame.size.height;
        } else {
            height = self.tableView.frame.size.height;
        }
        
        _emptyView = [[UIView alloc]initWithFrame:CGRectMake(0.0, posY, self.tableView.frame.size.width, height)];
        
        UIImage *image = DSZBaseImageName(@"list_empty");
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        CGFloat centerY = 0.0;
        if (self.tableView.tableHeaderView.frame.size.height != 0.0) {
            centerY = _emptyView.center.y - 120.0;
        } else {
            centerY = _emptyView.center.y - 90.0;
        }
        
        imageView.size = CGSizeMake(188, 165);
        imageView.center = CGPointMake(_emptyView.center.x, centerY);
        // imageView.center = view.center;
        _emptyView.hidden = YES;
        _emptyView.backgroundColor = [UIColor clearColor];
        [_emptyView addSubview:imageView];
        
        UILabel *emptyLbl = [[UILabel alloc] initWithFrame:CGRectMake(16, imageView.frame.origin.y + imageView.frame.size.height + 8, DSZScreenWidth-32, 30)];
        
       
        
        emptyLbl.text = @"暂无数据";
        emptyLbl.textAlignment = NSTextAlignmentCenter;
        emptyLbl.font = [UIFont systemFontOfSize:16];
        emptyLbl.textColor = UIColorFrom16RGB(0x787878);
        [_emptyView addSubview:emptyLbl];
        
    }
    
    return _emptyView;
}

- (UIView *)emptyFootView {
    
    if (!_emptyFootView) {
        _emptyFootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DSZScreenWidth, 30)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DSZScreenWidth, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"我是有底线的";
        [_emptyFootView addSubview:label];
        
    }
    
    
    
    return _emptyFootView;
    
    
    
}



-(void)setTableViewStyle:(UITableViewStyle)tableViewStyle{
    _tableViewStyle = tableViewStyle;
}


- (void)loadTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = CGRectMake(0, NavigationBarAndStatusHeight, DSZScreenWidth, DSZViewHeight);
    [self.view addSubview:self.tableView];
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
    
    UILabel *label = [UILabel new];
    label.text = @"3fsdfsdfsdf";
    label.backgroundColor = [UIColor greenColor];
    return label;
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
    return 20;
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
    NSInteger items = 0;
    NSInteger sections = 0;
    
    if (self.tableView.dataSource && [self.tableView.dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sections = [self.tableView.dataSource numberOfSectionsInTableView:self.tableView];
    }
    
    if (self.tableView.dataSource && [self.tableView.dataSource respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        for (NSInteger section = 0; section < sections; section++) {
            items += [self.tableView.dataSource tableView:self.tableView numberOfRowsInSection:section];
        }
    }
    
    
    
    // 添加为空时显示的View
    if (items == 0 && sections == 0) {
        [self.tableView addSubview:self.emptyView];
        self.emptyView.hidden = NO;
    } else {
        [self.emptyView removeFromSuperview];
        self.emptyView.hidden = YES;
    }
    
    // 判断隐藏底部刷新控件
    [self p_footerViewVisible:!self.hasNextPage];
    

    [self isHiddenFooterImgView];
    
    
    
    [self.tableView reloadData];
}

- (void)p_footerViewVisible:(BOOL)visible {
    self.tableView.mj_footer.hidden = visible;
}


- (void)isHiddenFooterImgView {
    
    if (self.emptyView.hidden && !self.hasNextPage &&self.tableView.mj_footer) {
        self.emptyFootView.hidden = NO;
        self.tableView.tableFooterView = self.emptyFootView;
    }else{
        self.emptyFootView.hidden = YES;
    }
    
    
}

- (void)dszGetNetWork {
    
}

- (void)changeEmptyView:(UIView *)view {
    _emptyView = view;
    [self.tableView reloadData];
}

- (void)resetEmptyViewFrame:(CGRect)frame {
    self.emptyView.frame = frame;
}

- (void)setEmptyViewHidden {
    self.emptyView.hidden = YES;
}




- (void)addChangeCell{
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(longPressGestureRecognized:)];
    [self.tableView addGestureRecognizer:longPress];

}

//长按手势方法
- (void)longPressGestureRecognized:(id)sender {
    
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    UIGestureRecognizerState state = longPress.state;
    
    CGPoint location = [longPress locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    
    static UIView       *snapshot = nil;        ///< A snapshot of the row user is moving.
    static NSIndexPath  *sourceIndexPath = nil; ///< Initial index path, where gesture begins.
    
    switch (state) {
        case UIGestureRecognizerStateBegan: {
            if (indexPath) {
                sourceIndexPath = indexPath;
                
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
                
                
                // Take a snapshot of the selected row using helper method.
                snapshot = [self customSnapshotFromView:cell];
                
                // Add the snapshot as subview, centered at cell's center...
                __block CGPoint center = cell.center;
                snapshot.center = center;
                snapshot.alpha = 0.0;
                [self.tableView addSubview:snapshot];
                [UIView animateWithDuration:0.25 animations:^{
                    
                    // Offset for gesture location.
                    center.y = location.y;
                    snapshot.center = center;
                    snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
                    snapshot.alpha = 0.98;
                    
                    // Black out.
                    cell.hidden = YES;
                } completion:nil];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint center = snapshot.center;
            center.y = location.y;
            snapshot.center = center;
            
            // Is destination valid and is it different from source?
            if (indexPath && ![indexPath isEqual:sourceIndexPath]) {
                
                // ... update data source.
                [self.dataSource exchangeObjectAtIndex:indexPath.row withObjectAtIndex:sourceIndexPath.row];
                
                // ... move the rows.
                [self.tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:indexPath];
                
                // ... and update source so it is in sync with UI changes.
                sourceIndexPath = indexPath;
                
            }
            break;
        }
        default: {
            // Clean up.
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:sourceIndexPath];
            [UIView animateWithDuration:0.25 animations:^{
                
                snapshot.center = cell.center;
                snapshot.transform = CGAffineTransformIdentity;
                snapshot.alpha = 0.0;
                
                // Undo the black-out effect we did.
                cell.hidden = NO;
                
            } completion:^(BOOL finished) {
                
                [snapshot removeFromSuperview];
                snapshot = nil;
                
            }];
            sourceIndexPath = nil;
            break;
        }
    }
    // More coming soon...
}
- (UIView *)customSnapshotFromView:(UIView *)inputView {
    
    UIView *snapshot = [inputView snapshotViewAfterScreenUpdates:YES];
    snapshot.layer.masksToBounds = NO;
    snapshot.layer.cornerRadius = 0.0;
    snapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
    snapshot.layer.shadowRadius = 5.0;
    snapshot.layer.shadowOpacity = 0.4;
    
    return snapshot;
}

@end
