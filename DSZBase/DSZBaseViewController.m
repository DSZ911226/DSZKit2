//
//  DSZBaseViewController.m
//  Demo
//
//  Created by zhilvmac on 2017/10/23.
//  Copyright © 2017年 zjwist. All rights reserved.
//

#import "DSZBaseViewController.h"

@interface DSZBaseViewController ()

@end

@implementation DSZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (!_backHidden) {
        [self addLeftButton];
    }
    // Do any additional setup after loading the view.
}


#pragma mark - 返回按钮
-(void)addLeftButton{
    UIButton *moonButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [moonButton setImage:[UIImage imageNamed:@"arr_ios_back_w"] forState:UIControlStateNormal];
    [moonButton setTitle:@"返回" forState:(UIControlStateNormal)];
    //    [moonButton sizeToFit];
    // 让返回按钮内容继续向左边偏移10
    //
    moonButton.frame = CGRectMake(0, 0, 50, 44);
    moonButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 20);
    [moonButton addTarget:self action:@selector(clickLeftButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moonButton];
    [moonButton setAdjustsImageWhenHighlighted:NO];
}



- (void)clickLeftButton{
    [self back];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
