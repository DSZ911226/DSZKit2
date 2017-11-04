//
//  DSZBaseCollectionViewController.m
//  AFNetworking
//
//  Created by zhilvmac on 2017/11/4.
//

#import "DSZBaseCollectionViewController.h"
#import <MJRefresh.h>
#import <DSZKitMacro.h>
#import "UIView+DSZExt.h"
#import "UITableView+DSZExt.h"
@interface DSZBaseCollectionViewController ()
@property (nonatomic, strong) UIView *emptyView;
@property (nonatomic, strong) UIView *emptyFootView;
@end

@implementation DSZBaseCollectionViewController


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
-  (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //设置每个cell的大小
        layout.itemSize = CGSizeMake((DSZScreenWidth - 36 - 30)/5, 15);
        //设置每个cell间的最小水平间距
        layout.minimumInteritemSpacing = 0;
        //设置每个cell间的行间距
        layout.minimumLineSpacing = 5;
        //设置每一组距离四周的内边距
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 0, 5);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, DSZScreenWidth, DSZScreenHeight) collectionViewLayout:layout];
    }
    return _collectionView;
}


/* 目前基本可以兼容有表头的tableView
 * 无表头的话  请在所使用的类里加上self.emptyView.frame = self.tableView.frame;
 */
- (UIView *)emptyView {
    if (!_emptyView) {
       
        _emptyView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height)];
        
        UIImage *image = DSZBaseImageName(@"list_empty");
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        CGFloat centerY = 0.0;
        centerY = _emptyView.center.y - 90.0;
        imageView.size = CGSizeMake(188, 165);
        imageView.center = CGPointMake(_emptyView.center.x, centerY);
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
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.frame = CGRectMake(0, NavigationBarAndStatusHeight, DSZScreenWidth, DSZViewHeight);
    [self.view addSubview:self.collectionView];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
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
        [self.collectionView registerClass:[NSClassFromString(identify) class] forCellWithReuseIdentifier:identify];
    }
}
- (void)regiserCellWithNibClassName:(NSArray *)classNames {
    for (NSString *identify in classNames) {
        [self.collectionView registerNib:[UINib nibWithNibName:identify bundle:nil] forCellWithReuseIdentifier:identify];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSource.count >0?1:0;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
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
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self headerRereshing];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
}

- (void)addFootRefresh {
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self footerRereshing];
    }];
}

- (void)endRefresh
{
    [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshing];
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
    
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)]) {
        sections = [self.collectionView.dataSource numberOfSectionsInCollectionView:self.collectionView];
    }
    if (self.collectionView.dataSource && [self.collectionView.dataSource respondsToSelector:@selector(collectionView:numberOfItemsInSection:)]) {
        for (NSInteger section = 0; section < sections; section++) {
            items += [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:section];
        }
    }
    
    
    
    // 添加为空时显示的View
    if (items == 0 && sections == 0) {
        [self.collectionView addSubview:self.emptyView];
        self.emptyView.hidden = NO;
    } else {
        [self.emptyView removeFromSuperview];
        self.emptyView.hidden = YES;
    }
    
    // 判断隐藏底部刷新控件
    [self p_footerViewVisible:!self.hasNextPage];
    
    
    [self isHiddenFooterImgView];
    
    
    
    [self.collectionView reloadData];
}

- (void)p_footerViewVisible:(BOOL)visible {
    self.collectionView.mj_footer.hidden = visible;
}


- (void)isHiddenFooterImgView {
    
//    if (self.emptyView.hidden && !self.hasNextPage &&self.collectionView.mj_footer) {
//        self.emptyFootView.hidden = NO;
//        self.collectionView.footer = self.emptyFootView;
//    }else{
//        self.emptyFootView.hidden = YES;
//    }
    
    
}

- (void)dszGetNetWork {
    
}

- (void)changeEmptyView:(UIView *)view {
    _emptyView = view;
    [self.collectionView reloadData];
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
    [self.collectionView addGestureRecognizer:longPress];
    
}
//长按手势方法
- (void)longPressGestureRecognized:(id)sender {
    
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    UIGestureRecognizerState state = longPress.state;
    
    static UIView       *snapshot = nil;        ///< A snapshot of the row user is moving
    
    //判断手势状态
    switch (state) {
        case UIGestureRecognizerStateBegan:{
            //判断手势落点位置是否在路径上
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longPress locationInView:self.collectionView]];
            
            UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
            snapshot = [self customSnapshotFromView:cell];
            snapshot.center = cell.center;
            [self.collectionView addSubview:snapshot];
            
            [UIView animateWithDuration:0.25 animations:^{
                
                // Offset for gesture location.
                
                snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
                snapshot.alpha = 0.0;
                
                // Black out.
            } completion:nil];
            
            if (indexPath == nil) {
                break;
            }
            //在路径上则开始移动该路径上的cell
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
        case UIGestureRecognizerStateChanged:
            //移动过程当中随时更新cell位置
            
            [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:self.collectionView]];
            
            break;
            
        case UIGestureRecognizerStateEnded:
            //移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
            [snapshot removeFromSuperview];
            
            break;
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
    
    // More coming soon...
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    //返回YES允许其item移动
    return YES;
}

//CollectionView move 方法
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath {
    //取出源item数据
    id objc = [_dataSource objectAtIndex:sourceIndexPath.item];
    
    //从资源数组中移除该数据
    [_dataSource removeObject:objc];
    //将数据插入到资源数组中的目标位置上
    [_dataSource insertObject:objc atIndex:destinationIndexPath.item];
}

//自定制快照样式
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
