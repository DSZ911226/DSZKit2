//
//  DSZBaseTableView.m
//  Demo
//
//  Created by zhilvmac on 2017/10/23.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import "DSZBaseTableView.h"
#import <DSZKitMacro.h>
@implementation DSZBaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self setExtraCellLineHidden:self];
    }
    return self;
}

//隐藏tableview多余的空
-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
}
- (void)dealloc {
    DSZLog(@"DSZBaseTableView");
}
@end
